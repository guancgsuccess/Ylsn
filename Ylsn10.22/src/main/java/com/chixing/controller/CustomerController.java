package com.chixing.controller;

import com.chixing.entity.*;
import com.chixing.service.CustomerService;
import com.chixing.service.LoginService;
import com.chixing.service.RequirementService;
import com.chixing.util.Constellation;
import com.chixing.util.IPAnalyse2;
import com.chixing.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RestController
@RequestMapping("/customer")
public class CustomerController {
    public CustomerController() {
        System.out.println("CustomerController constructor....");
    }

    @Autowired
    private CustomerService customerService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private RequirementService requirementService;

    @PostMapping("login")
    public LoginProcessBean login(String custPhone, String custPassword, String isChecked, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        LoginBean loginBean = new LoginBean();
        loginBean.setCustPhone(custPhone);
        loginBean.setCustPassword(MD5Util.EncoderByMd5(custPassword));
        LoginProcessBean loginProcessBean = this.customerService.getCustomerByPhoneAndPassword(loginBean);
        if (loginProcessBean.getLoginStatus() == 0) { //登录成功
            if(isChecked.equals("yes")) {
                loginProcessBean.getLoginBean().setCustPassword(custPassword);
                customerService.autoLogin(loginProcessBean, response);
            }
            customerService.saveLog(loginProcessBean,request);

            request.getSession().setAttribute("custId", loginProcessBean.getLoginBean().getCustId());
            request.getSession().setAttribute("custPhone", loginProcessBean.getLoginBean().getCustPhone());
            request.getSession().setAttribute("custNickname",  customerService.getCustomerById(loginProcessBean.getLoginBean().getCustId()).getCustNickname());


        }
        return loginProcessBean;
    }

    @GetMapping(value="logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        customerService.logout(request,response);
    }

    @GetMapping(value="askVerCode")
    public String askVerCode(HttpSession session){
        String  rand=(String)session.getAttribute("rand");
        return rand;
    }

    @DuplicateSubmitToken(type = DuplicateSubmitToken.SESSION)
    @PostMapping("save")
    public void saveCust(Customer customer) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        System.out.println("++++++++++++++++"+customer+"++++++++++++++");
        //生日转化为生肖和星座
        Date custBirthday= customer.getCustBirthday();
        //生肖
        String  custZodiac=Constellation.getNature(custBirthday);
        //星座
        String   custConstellation=Constellation.getBuyerConstell(custBirthday);
        System.out.println("生肖"+custZodiac+"星座"+custConstellation);

        customer.setCustZodiac(custZodiac);
        customer.setCustConstellation(custConstellation);
        //密码加密
        String pwd = customer.getCustPassword();
        String newpwd= MD5Util.EncoderByMd5(pwd);
        System.out.println(newpwd);
        customer.setCustPassword(newpwd);
        int row = customerService.saveCustomer(customer);
    }

    @InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }


    @RequestMapping("/getMyInfo")
    public ModelAndView getCustInfo(HttpSession session){
        ModelAndView mav=new ModelAndView();
        Integer custId=(Integer)session.getAttribute("custId");
        Customer customer = customerService.getCustomerById(custId);
        mav.addObject("customer",customer);
        mav.setViewName("myInfo");
        return  mav;
    }

    @RequestMapping("updateUser")
    public void saveAgain(Customer customer,HttpSession session){
        System.out.println("+++++++"+customer);

        //生日转化为生肖和星座
        Date custBirthday= customer.getCustBirthday();
        //生肖
        String  custZodiac=Constellation.getNature(custBirthday);
        //星座
        String   custConstellation = Constellation.getBuyerConstell(custBirthday);
        System.out.println("生肖"+custZodiac+"星座"+custConstellation);

        int custId= (int) session.getAttribute("custId");
        customer.setCustZodiac(custZodiac);
        customer.setCustConstellation(custConstellation);
        customer.setCustId(custId);
        customerService.updateUser(customer);
    }

    @GetMapping(value="getCustomer")
    public Customer getCustomer(Integer custId,HttpSession session){
        if(custId==null)
            custId=(Integer) session.getAttribute("custId");
        return customerService.getCustomerById(custId);
    }

    @RequestMapping("message")
    public ModelAndView message(Integer id,HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("message");
        Integer custId=(Integer) session.getAttribute("custId");
        Customer customer1=customerService.getCustomerById(custId);
        Customer customer=customerService.getCustomerById(id);
        Login login=loginService.getRecentLoginByCustId(id);
        Requirement requirement=requirementService.getRealRequirementByCustId(id);
        Integer score=customerService.match(custId,id);
        ServletContext application = session.getServletContext();
        Set<Integer> onlineUserSet = (Set)application.getAttribute("onlineUserSet");
        String state="";
        if(customer.getCustGender().equals("男"))
            state="他不在线";
        else
            state="她不在线";
        for(Integer i:onlineUserSet){
            if(i==id){
                state=state.substring(0,1)+state.substring(2);
            }
        }
        modelAndView.addObject("customer",customer);
        modelAndView.addObject("login",login);
        modelAndView.addObject("nickname",customer1.getCustNickname());
        modelAndView.addObject("photo",customer1.getCustPhoto());
        modelAndView.addObject("gender",customer1.getCustGender());
        modelAndView.addObject("requirement",requirement);
        modelAndView.addObject("score",score);
        modelAndView.addObject("state",state);
        return modelAndView;
    }

    @GetMapping(value="getCustomerList")
    public List<Customer> getCustomerList(String custGender, String custProvince, String custCity, String custConstellation,Integer minYear,Integer maxYear) {
        if(custCity!=null&&custProvince!=null)
            if(custProvince.equals("省份")&&custCity.equals("城市")){
                Map<String,String> address= IPAnalyse2.getAddress();
                return customerService.getCustomerList(custGender,address.get("province"),address.get("city"),custConstellation,minYear,maxYear);
            }
        return customerService.getCustomerList(custGender,custProvince,custCity,custConstellation,minYear,maxYear);
    }

    @GetMapping(value="getCustomerListByVisit")
    public List<Customer> getCustomerListByVisit(String custGender, String custWeekVisitCount){

        return customerService.getCustomerByVisit(custGender,custWeekVisitCount);
    }
    @RequestMapping("/meet")
    public ModelAndView meet(HttpSession session,String custGender){
        ModelAndView modelAndView=new ModelAndView();
        Integer custId=(Integer) session.getAttribute("custId");
        Requirement requirement=requirementService.getRealRequirementByCustId(custId);
        modelAndView.setViewName("meet");
        modelAndView.addObject("custGender",custGender);
        modelAndView.addObject("requirement",requirement);
        return modelAndView;
    }
    @RequestMapping("/getCustByRequGender")
    public Customer getCustByRequGender(String gender){
        return customerService.getCustomerByGender(gender);
    }

    @RequestMapping("/updateMeet")
    public void updateMeet(Integer custId,Integer meetId ,Integer custMeetCount, Integer custLikeNumber){
        customerService.updateMeet(custId,meetId,custMeetCount,custLikeNumber);
    }

    //根据性别和省份查询日人气前六名
    @GetMapping("getDayVisitCountRankingList")
    public List<Customer> getDayVisitCountByGenderAndProvince(String custGender, String custProvince){
        List<Customer> customerListDay = this.customerService.getDayVisitCountByGenderAndProvince(custGender,custProvince);
        System.out.println("**************customerListDay = " + customerListDay);
        return customerListDay;
    }

    //根据性别和省份查询周人气前六名
    @GetMapping("getWeekVisitCountRankingList")
    public List<Customer> getWeekVisitCountByGenderAndProvince(String custGender, String custProvince){
        List<Customer> customerListWeek = this.customerService.getWeekVisitCountByGenderAndProvince(custGender,custProvince);
        System.out.println("**************customerListWeek = " + customerListWeek);
        return customerListWeek;
    }

    //根据性别和省份查询月人气前六名
    @GetMapping("getMonthVisitCountRankingList")
    public List<Customer> getMonthVisitCountByGenderAndProvince(String custGender, String custProvince){
        List<Customer> customerListMonth = this.customerService.getMonthVisitCountByGenderAndProvince(custGender,custProvince);
        System.out.println("**************customerListMonth = " + customerListMonth);
        return customerListMonth;
    }

    //根据性别和省份查询总人气前六名
    @GetMapping("getTotalVisitCountRankingList")
    public List<Customer> getTotalVisitCountByGenderAndProvince(String custGender, String custProvince){
        List<Customer> customerListTotal = this.customerService.getTotalVisitCountByGenderAndProvince(custGender,custProvince);
        System.out.println("**************customerListTotal = " + customerListTotal);
        return customerListTotal;
    }

    //根据性别和省份查询日人气所有人
    @GetMapping("getAllOfDayVisitCountRankingList")
    public List<Customer> getAllOfDayVisitCountByGenderAndProvince(String custGender, String custProvince){
        List<Customer> allCustomerListDay = this.customerService.getAllOfDayVisitCountByGenderAndProvince(custGender,custProvince);
        System.out.println("**************allCustomerListDay = " + allCustomerListDay);
        return allCustomerListDay;
    }

    //根据id查询用户密码
    @GetMapping("getPwdByCustId")
    public String getPwdByCustId( HttpServletRequest request){
        Integer custId=(Integer) request.getSession().getAttribute("custId");
        String result = this.customerService.getPwdByCustId(custId);
        System.out.println("$%$$%^%^&^%^&^%^&result= " + result);
        return result;
    }

    //根据ID修改用户密码
    @PostMapping("updatePwdByCustId")
    public void updatePwdByCustId( String custPassword, HttpServletRequest request,HttpServletResponse response) throws IOException{
        Integer custId=(Integer) request.getSession().getAttribute("custId");
        int result = this.customerService.updatePwdByCustId(custId,custPassword);
        if(result>0){
           customerService.logout(request,response);
        }
    }
}
