package com.chixing.service.impl;

import com.chixing.dao.CustomerDao;
import com.chixing.dao.FollowDao;
import com.chixing.dao.LoginDao;
import com.chixing.dao.RequirementDao;
import com.chixing.entity.*;
import com.chixing.service.CustomerService;
import com.chixing.util.IPAnalyse;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private LoginDao loginDao;
    @Autowired
    private RequirementDao requirementDao;
    @Autowired
    private FollowDao followDao;

    @Override
    public Customer getCustomerById(Integer custId) {
        return customerDao.selectCustomerById(custId);
    }

    @Override
    public Customer getCustomerByPhone(String custPhone) {
        return customerDao.selectCustomerByPhone(custPhone);
    }

    @Override
    @Transactional
    public LoginProcessBean getCustomerByPhoneAndPassword(LoginBean loginBean) {
        LoginProcessBean loginProcessBean = new LoginProcessBean();
        loginProcessBean.setLoginBean(loginBean);
        if(customerDao.selectCustomerByPhone(loginBean.getCustPhone()) ==null){
            loginProcessBean.setLoginBean(loginBean);
            loginProcessBean.setLoginStatus(2);
            loginProcessBean.setLoginMessage("手机号不存在");
        }else {
            Customer customer = customerDao.selectCustomerByPhoneAndPassword(loginBean);
            if (customer == null) {
                loginProcessBean.setLoginBean(loginBean);
                loginProcessBean.setLoginStatus(1);
                loginProcessBean.setLoginMessage("密码错误");
            } else {
                loginBean.setCustId(customer.getCustId());
                loginProcessBean.setLoginBean(loginBean);
                loginProcessBean.setLoginStatus(0);
                loginProcessBean.setLoginMessage("用户登录成功");
            }
        }
        return  loginProcessBean;
    }

    @Override
    public Customer getCustomerByNickname(String custNickname) {
        return customerDao.selectCustomerByNickname(custNickname);
    }

    @Override
    public int getCustomerCount() {
        return customerDao.selectCustomerCount();
    }

    @Override
    public int saveCustomer(Customer customer) {
        return customerDao.addCustomer(customer);
    }

    @Override
    public int updateCustomerPassword(String custPhone, String custPassword) {
        return customerDao.updateCustomerPassword(custPhone, custPassword);
    }

    @Override
    public int updateCustomerPhoto(String custPhone, String custPhoto) {
        return customerDao.updateCustomerPhoto(custPhone, custPhoto);
    }

    @Override
    public int deleteUser(String custPhone, Integer custState) {
        return customerDao.deleteUser(custPhone, custState);
    }

    @Override
    public void autoLogin(LoginProcessBean loginProcessBean, HttpServletResponse response) {
        Cookie cookie_custPhone = new Cookie("custPhone",loginProcessBean.getLoginBean().getCustPhone());
        Cookie cookie_custPassword = new Cookie("custPassword",loginProcessBean.getLoginBean().getCustPassword());
        cookie_custPhone.setMaxAge(60*60*24*14);//保存两周
        cookie_custPassword.setMaxAge(60*60*24*14);
        cookie_custPhone.setPath("/");
        cookie_custPassword.setPath("/");
        response.addCookie(cookie_custPhone);
        response.addCookie(cookie_custPassword);
    }

    @Override
    @Transactional
    public void saveLog(LoginProcessBean loginProcessBean, HttpServletRequest request) {
        Login login=new Login();
        if(null==loginDao.selectRecentLoginByCustId(loginProcessBean.getLoginBean().getCustId())) {
            login.setLoginIp(IPAnalyse.getIp(request));
            login.setCustId(loginProcessBean.getLoginBean().getCustId());
            loginDao.addLogin(login);
        }else {
            loginDao.updateLogin(IPAnalyse.getIp(request),loginProcessBean.getLoginBean().getCustId());
        }
    }

    @Override
    public PageModel<Customer> getCustomerByDynamic(Requirement requirement,String md,PageModel<Customer> page) {
        List<Customer> customerList=customerDao.selectCustomerByDynamic(requirement,md,page);
        page.setModelList(customerList);
        return page;
    }

    @Override
    public int getCountCustomerByDynamic(Requirement requirement, String md) {
        return customerDao.selectCountCustomerByDynamic(requirement, md);
    }

    @Override
    public Customer getCustPhoto(Integer custId) {
        return customerDao.selectCustPhoto(custId);
    }

    @Override
    public List<CustFollowBean> getFourCust(Integer custId, Date custBirthday, String custGender) {
        return customerDao.selectFourCust(custId,custBirthday,custGender);
    }

    @Override
    public List<CustFollowBean> getTwoCust(Integer custId, Date custBirthday, String custGender) {
        return customerDao.selectTwoCust(custId,custBirthday,custGender);
    }

    @Override
    public int updateUser(Customer customer) {
        return customerDao.updateUser(customer);
    }

    @Override
    public int updateUserPhoto(String custPhoto, int custId) {
        return customerDao.updateUserPhoto(custPhoto,custId);
    }

    @Override
    public List<CustFollowBean> getTodayStar(String custGender) {
        return customerDao.selectTodayStar(custGender);
    }

    @Override
    public List<Customer> getCustomerList(String custGender, String custProvince, String custCity, String CustConstellation, Integer minYear, Integer maxYear) {
        List<Customer> userList =   this.customerDao.selectCustomer(isNULL(custGender),custProvince,custCity,getMatchConstellation(CustConstellation),minYear,maxYear);
        return  userList;
    }

    @Override
    public List<Customer> getCustomerByVisit(String custGender, String custWeekVisitCount) {
        return customerDao.selectCustomerByVisit(isNULL(custGender),custWeekVisitCount);
    }

    @Override
    @Transactional
    public Integer match(Integer custId, Integer requId) {
        Integer score=60;
        Customer customer=customerDao.selectCustomerById(custId);
        Requirement requirement=requirementDao.selectRequirementByCustId(requId);
        if(customer==null||requirement==null)
            return null;
        Integer age=getAgeByBirthDay(customer.getCustBirthday());
        Integer height=customer.getCustHeight();
        String income=customer.getCustIncome();
        String  education=customer.getCustEducation();
        String marriage=customer.getCustMarriage();
        String province=customer.getCustProvince();
        String city=customer.getCustCity();
        if(age<requirement.getRequMaxAge()&&age>requirement.getRequMinAge())
            score+=11;
        if(requirement.getRequMaxHeight()!=null&&requirement.getRequMinHeight()!=null&&height<requirement.getRequMaxHeight()&&height>requirement.getRequMinHeight())
            score+=9;
        if(requirement.getRequCity()!=null&&requirement.getRequProvince()!=null&&city.equals(requirement.getRequCity())&&province.equals(requirement.getRequProvince()))
            score+=5;
        if(requirement.getRequIncome()!=null&&income.equals(requirement.getRequIncome()))
            score+=10;
        if(requirement.getRequMarriage()!=null&&requirement.getRequMarriage().equals("不限")||marriage.equals(requirement.getRequMarriage()))
            score+=6;
        if(requirement.getRequEducation()!=null&&requirement.getRequEducation().equals("不限")||education.equals(requirement.getRequEducation()))
            score+=5;
        if(!customer.getCustPhoto().equals("xxx.jpg"))
            score+=7;
        if(score>100)
            score=100;
        return score;
    }

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie cookie_custPhone = new Cookie("custPhone",null);
        Cookie cookie_custPassword = new Cookie("custPassword",null);
        cookie_custPhone.setMaxAge(0);
        cookie_custPassword.setMaxAge(0);
        cookie_custPhone.setPath("/");
        cookie_custPassword.setPath("/");
        response.addCookie(cookie_custPhone);
        response.addCookie(cookie_custPassword);
        request.getSession().invalidate();
        response.sendRedirect("/login");
    }

    @Override
    public Customer getCustomerByGender(String custGender) {
        return customerDao.selectCustomerByGender(isNULL(custGender));
    }

    @Override
    @Transactional
    public int updateMeet(Integer custId, Integer meetId, Integer custMeetCount, Integer custLikeNumber) {
        Integer flag=0;
        Follow follow=new Follow();
        follow.setCustIdInitiative(custId);
        follow.setCustIdUnactive(meetId);
        follow.setFollowTime(new Date());
        if(customerDao.updateCustomerMeet(custId,custMeetCount,custLikeNumber)>0)
            flag=1;
        if (flag==1&&meetId!=null)
            if(followDao.selectIsFollow(custId,meetId)==null)
                flag=followDao.saveFollow(follow);
        return flag;
    }

    private   Integer getAgeByBirthDay(Date custBirthDay){
        if (custBirthDay == null || custBirthDay.getTime()>new Date().getTime()) {
            return 0;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //得到当前的年份
        String cYear = sdf.format(new Date()).substring(0,4);
        String cMouth = sdf.format(new Date()).substring(5,7);
        String cDay = sdf.format(new Date()).substring(8,10);
        //得到生日年份

        String birth_Year =sdf.format(custBirthDay).substring(0,4);
        String birth_Mouth =sdf.format(custBirthDay).substring(0,4);
        String birth_Day = sdf.format(custBirthDay).substring(0,4);
        //年月日比较后得到年龄
        int age = Integer.parseInt(cYear) - Integer.parseInt(birth_Year);
        if ((Integer.parseInt(cMouth) - Integer.parseInt(birth_Mouth))<0) {
            age=age-1;
        }else if ((Integer.parseInt(cMouth) - Integer.parseInt(birth_Mouth))==0) {
            if ( (Integer.parseInt(cDay) - Integer.parseInt(birth_Day))>0) {
                age=age-1;
            }else {
                age = Integer.parseInt(cYear) - Integer.parseInt(birth_Year);
            }
        }else if ((Integer.parseInt(cMouth) - Integer.parseInt(birth_Mouth))>0) {
            age = Integer.parseInt(cYear) - Integer.parseInt(birth_Year);
        }
        return age;
    }

    public String isNULL(String gender){
        if(gender==null)
            return null;
        else if(gender.equals("男"))
            return "女";
        else if(gender.equals("女"))
            return "男";
        else
            return null;
    }

    public String getMatchConstellation(String constellation){

        if(constellation==null)
            return null;
        switch (constellation){
            case "白羊座": return "狮子座";
            case "金牛座": return "处女座";
            case "双子座": return "水瓶座";
            case "巨蟹座": return "双鱼座";
            case "狮子座": return "射手座";
            case "天秤座": return "双子座";
            case "天蝎座": return "双鱼座";
            case "射手座": return "白羊座";
            case "摩羯座": return "金牛座";
            case "水瓶座": return "天秤座";
            case "双鱼座": return "天蝎座";
            case "处女座": return "双鱼座";
            default:return "巨蟹座";
        }
    }

    @Override
    public Customer getCustByCustId(Integer custId) {
        return this.customerDao.selectCustByCustId(custId);
    }

    //根据性别和省份查询日人气前六名
    @Override
    public List<Customer> getDayVisitCountByGenderAndProvince(String custGender, String custProvince) {
        return this.customerDao.selectDayVisitCountByGenderAndProvince(custGender,custProvince);
    }

    @Override
    public List<Customer> getWeekVisitCountByGenderAndProvince(String custGender, String custProvince) {
        return this.customerDao.selectWeekVisitCountByGenderAndProvince(custGender,custProvince);
    }

    @Override
    public List<Customer> getMonthVisitCountByGenderAndProvince(String custGender, String custProvince) {
        return this.customerDao.selectMonthVisitCountByGenderAndProvince(custGender,custProvince);
    }

    @Override
    public List<Customer> getTotalVisitCountByGenderAndProvince(String custGender, String custProvince) {
        return this.customerDao.selectTotalVisitCountByGenderAndProvince(custGender,custProvince);
    }

    @Override
    public List<Customer> getAllOfDayVisitCountByGenderAndProvince(String custGender, String custProvince) {
        return this.customerDao.selectAllOfDayVisitCountByGenderAndProvince(custGender,custProvince);
    }

    @Override
    public String getPwdByCustId(Integer custId) {
        return this.customerDao.selectPwdByCustId(custId);
    }

    //修改密码
    @Override
    public int updatePwdByCustId(Integer custId, String custPassword) {
        return this.customerDao.updatePwdByCustId(custId,custPassword);
    }
}
