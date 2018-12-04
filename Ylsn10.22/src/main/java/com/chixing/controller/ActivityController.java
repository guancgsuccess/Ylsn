package com.chixing.controller;

import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.service.ActivityService;
import com.chixing.service.CustActivityService;
import com.chixing.service.CustomerService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("/activity")
public class ActivityController {
    public ActivityController() {
        System.out.println("ActivityController constructor....");
    }

    @Autowired
    private CustActivityService custActivityService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private ActivityService activityService;

    @GetMapping(value="detail")
    public ModelAndView detail(Integer actiId){

        ModelAndView mav = new ModelAndView();
        Activity activity=activityService.getActivityById(actiId);
        DateFormat df = new SimpleDateFormat("MM月dd日");
        String actiDate=df.format(activity.getActiDate());
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        cal.setTime(activity.getActiDate());
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        String actiIntroduction=activity.getActiIntroduction().substring(0,92)+"...";
        List<Customer> customerList=custActivityService.getCustActiByActiId(actiId);//改为活动id
        int count=custActivityService.getCountActiId(actiId);//改为活动id
        mav.addObject("activity",activity);
        mav.addObject("actiDate",actiDate);
        mav.addObject("weekDays",weekDays[w]);
        mav.addObject("actiIntroduction",actiIntroduction);
        mav.addObject("customerList",customerList);
        mav.addObject("count",count);
        mav.setViewName("activitydetail");
        return mav;
    }

    @GetMapping(value="signuplist")
    public ModelAndView signuplist(Integer actiId,Integer tag,Integer pagecode){
        ModelAndView mav = new ModelAndView();
        PageModel<Customer> page1 =  new PageModel<>();
        PageModel<Customer> page2 =  new PageModel<>();
        PageModel<Customer> page3 =  new PageModel<>();
        if(tag==null) {
            tag=0;
            page1.setCurrentPageCode(1);
            page2.setCurrentPageCode(1);
            page3.setCurrentPageCode(1);
        }else if(tag==1){
            page1.setCurrentPageCode(pagecode);
            page2.setCurrentPageCode(1);
            page3.setCurrentPageCode(1);
        }else if(tag==2){
            page1.setCurrentPageCode(1);
            page2.setCurrentPageCode(pagecode);
            page3.setCurrentPageCode(1);
        }else if(tag==3){
            page1.setCurrentPageCode(1);
            page2.setCurrentPageCode(1);
            page3.setCurrentPageCode(pagecode);
        }
        page1.setPageSize(12);
        page1.setTotalRecord(custActivityService.getCountActiId(actiId));//改为活动id
        page1.setTotalPages(page1.getTotalRecord() % page1.getPageSize() == 0 ? page1.getTotalRecord() / page1.getPageSize() : page1.getTotalRecord() / page1.getPageSize() + 1);
        page1.setStartRecord((page1.getCurrentPageCode() - 1) * page1.getPageSize());
        page1 = custActivityService.getCustActiByPage(actiId,page1);//改为活动id
        page2.setPageSize(12);
        page2.setTotalRecord(custActivityService.getmaleCountActiId(actiId));//改为活动id
        page2.setTotalPages(page2.getTotalRecord() % page2.getPageSize() == 0 ? page2.getTotalRecord() / page2.getPageSize() : page2.getTotalRecord() / page2.getPageSize() + 1);
        page2.setStartRecord((page2.getCurrentPageCode() - 1) * page2.getPageSize());
        page2 = custActivityService.getmaleCountCustActiByPage(actiId,page2);//改为活动id
        page3.setPageSize(12);
        page3.setTotalRecord(custActivityService.getfemaleCountActiId(actiId));//改为活动id
        page3.setTotalPages(page3.getTotalRecord() % page3.getPageSize() == 0 ? page3.getTotalRecord() / page3.getPageSize() : page3.getTotalRecord() / page3.getPageSize() + 1);
        page3.setStartRecord((page3.getCurrentPageCode() - 1) * page3.getPageSize());
        page3 = custActivityService.getfemaleCountCustActiByPage(actiId,page3);//改为活动id
        mav.addObject("page1",page1);
        mav.addObject("page2",page2);
        mav.addObject("page3",page3);
        mav.addObject("tag",tag);

        Activity activity=activityService.getActivityById(actiId);//改为活动id
        DateFormat df = new SimpleDateFormat("MM月dd日");
        String actiDate=df.format(activity.getActiDate());
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        cal.setTime(activity.getActiDate());
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        int count=custActivityService.getCountActiId(actiId);//改为活动id
        int maleCount=custActivityService.getmaleCountActiId(actiId);//改为活动id
        int femaleCount=custActivityService.getfemaleCountActiId(actiId);//改为活动id
        List<Customer> customerList=custActivityService.getCustActiByActiId(actiId);//改为活动id
        mav.addObject("activity",activity);
        mav.addObject("actiDate",actiDate);
        mav.addObject("weekDays",weekDays[w]);
        mav.addObject("count",count);
        mav.addObject("maleCount",maleCount);
        mav.addObject("femaleCount",femaleCount);
        mav.addObject("customerList",customerList);
        mav.setViewName("signuplist");
        return mav;
    }

    @PostMapping(value="search")
    public ModelAndView search(String loveid){
        ModelAndView mav = new ModelAndView();
        Customer customer=customerService.getCustomerByNickname(loveid);
        System.out.println(customer);
        mav.addObject("customer",customer);
        mav.setViewName("");//填写个人信息页面地址
        return mav;
    }

    @GetMapping(value="signup")
    public int signup(Integer actiId, HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        int isSignup=custActivityService.getIsSignup(custId, actiId);
        if (isSignup==0)
            custActivityService.saveCustActivity(custId, actiId);
        return isSignup;
    }

    //活动所有活动
    @GetMapping("all")
    public List<Activity> getaAll() {
        List<Activity> allActivi = activityService.getAllActivi();
        System.out.println("=============="+allActivi);
        return allActivi;
    }
    //根据地址查询活动
    @GetMapping("getActivity")
    public List<Activity> getByCity(String city){
        System.out.println("dsfsdfsdfsdfdsfsdfs");
        List<Activity> activityList = activityService.getActivityByCity(city);
        System.out.println(activityList);
        return activityList;
    }
    //根据活动查询参加的人数
    @GetMapping("no4People")
    public int getNo4PeopleByActivity(Integer actiId){
        int result = this.activityService.getNo4PeopleByActivity(actiId);
        System.out.println("result = " + result);
        return result;
    }

    //根据活动查询活动状态
    @GetMapping("state")
    public int getStateByActivity(Integer actiId){
        int state = this.activityService.getStateByActivity(actiId);
        System.out.println("state" + state);
        return state;
    }

    //根据活动获得用户
    @GetMapping("photo")
    public List<Customer> getPhotoByActivity(Integer actiId){
        List<Customer> photoList = this.activityService.getPhotoByActivity(actiId);
        System.out.println("*******************actiId = " + actiId);
        return photoList;
    }
    /**
     * 分页查询用户数据
     * @param pagecode 指定要查询的页码
     * @return 返回当前页码的页码相关信息与数据集合
     */
    @GetMapping("All")
    public PageModel<Activity> getAllByPage(Integer pagecode){
        PageModel<Activity> page = new PageModel<Activity>();
        page.setPageSize(5);
        System.out.println("pagecode = " + pagecode);
        if (pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else {
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.activityService.getCount());
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() : page.getTotalRecord()/page.getPageSize()+1);
        page.setStartRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        page = this.activityService.getAllActivityByPage(page);
        return page;
    }

    @GetMapping("All/page/{page}")
    public PageModel<Activity> pageAllByPage2(@PathVariable Integer page){
        System.out.println("getPage 222 " + page);
        return getAllByPage(page);
    }


    @GetMapping("allActivityByCity")
    public PageModel<Activity> getByPage(Integer pagecode,String actiCity){
        PageModel<Activity> page = new PageModel<Activity>();
        page.setPageSize(5);
        System.out.println("pagecode = " + pagecode);
        if (pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else {
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.activityService.getCountByCity(actiCity));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() : page.getTotalRecord()/page.getPageSize()+1);
        page.setStartRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        page = this.activityService.getActivityByPage(page,actiCity);
        return page;
    }

    @GetMapping("allActivityByCity/page/{page}/{actiCity}")
    public PageModel<Activity> pageByPage2(@PathVariable Integer page,@PathVariable String actiCity){
        System.out.println("getPage 222 " + page);
        return getByPage(page,actiCity);
    }

    //查询进行中或已结束的活动状态;
    @GetMapping("stateCount")
    public List<Integer> getStateCount(){
        List<Integer> allState = this.activityService.getStateCount();
        System.out.println("############allState = " + allState);
        return allState;
    }

    //根据城市查询进行中或已结束的活动状态
    @GetMapping("stateCountByCity")
    public List<Integer> getStateCountByCity(String actiCity){
        List<Integer> allStateByCity = this.activityService.getStateCountByCity(actiCity);
        System.out.println("############allState = " + allStateByCity);
        return allStateByCity;
    }
}
