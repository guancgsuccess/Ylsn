package com.chixing.controller;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.service.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/cust")
public class personalCenterController {
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private MessageServiceImpl messageService;
    @Autowired
    private VisitServiceImpl visitService;
    @Autowired
    private FollowServiceImpl followService;
    @Autowired
    private LikeServiceImpl likeService;


    @RequestMapping("center")
    public ModelAndView getphotoAndname(HttpSession session) throws ParseException {
        Integer custId =(Integer) session.getAttribute("custId");
        ModelAndView mav=new ModelAndView();
        Customer customer=  customerService.getCustomerById(custId);
        Integer unreadCount=  messageService.getCount(custId);
        Integer visitCount = visitService.getVisitCount(custId);
        String  Nickname = customer.getCustNickname();
        String  Photo= customer.getCustPhoto();
        mav.addObject("custId",custId);
        mav.addObject("Nickname",Nickname);
        mav.addObject("Photo",Photo);
        mav.addObject("unreadCount",unreadCount);
        mav.addObject("visitCount",visitCount);
        Date custBirthday=  customer.getCustBirthday();
        String  custGender= customer.getCustGender();
        List<CustFollowBean> fourlist=  customerService.getFourCust(custId,custBirthday,custGender);
        mav.addObject("fourlist",fourlist);
        List<CustFollowBean>  starlist= customerService.getTodayStar(custGender);
        mav.addObject("starlist",starlist);
        List<CustFollowBean>  custFollowBeanList= followService.gettMyFollow(custId);
        mav.addObject("custFollowBeanList",custFollowBeanList);
        mav.setViewName("personalCenter");
        return mav;
    }

    @GetMapping("myFollow")
    public List<CustFollowBean>  getMyFollow(HttpSession session){
        Integer custId= (Integer)session.getAttribute("custId");
        List<CustFollowBean>  custFollowBeanList= followService.gettMyFollow(custId);
        return custFollowBeanList;
    }

    @GetMapping("followMe")
    public List<CustFollowBean> getFollowMe(HttpSession session){
        Integer custId= (Integer)session.getAttribute("custId");
        List<CustFollowBean> custFollowBeanList=followService.getFollowMe(custId);
        return  custFollowBeanList;
    }

    @GetMapping("visitMe")
    public List<CustFollowBean> getVisitMe(HttpSession session){
        Integer custId= (Integer)session.getAttribute("custId");
        List<CustFollowBean> custvisitList=visitService.getVisitByVisitId6(custId);
        return  custvisitList;
    }

    @GetMapping("getFourCust")
    public List<CustFollowBean> getFourCustomer(HttpSession session) throws ParseException {
        Integer  custId=(Integer)  session.getAttribute("custId");
        Customer customer=  customerService.getCustomerById(custId);
        Date custBirthday=  customer.getCustBirthday();
        String  custGender= customer.getCustGender();
        List<CustFollowBean> fourlist=  customerService.getFourCust(custId,custBirthday,custGender);
        return fourlist;
    }


    @GetMapping("getTwoCust")
    public List<CustFollowBean> getTwoCustomer(HttpSession session) throws ParseException {
        Integer  custId=(Integer)  session.getAttribute("custId");
        Customer customer=  customerService.getCustomerById(custId);
        Date custBirthday=  customer.getCustBirthday();
        String  custGender= customer.getCustGender();
        List<CustFollowBean> twolist=  customerService.getTwoCust(custId,custBirthday,custGender);
        return twolist;
    }

    @RequestMapping("myLike")
    public ModelAndView getmyLike(HttpSession session){
    Integer custId= (Integer) session.getAttribute("custId");
    ModelAndView mav=new ModelAndView();
    List<CustFollowBean> customerList= likeService.getMylike(custId);
    mav.addObject("customerList",customerList);
    mav.setViewName("myLike");
    return mav;
    }

}
