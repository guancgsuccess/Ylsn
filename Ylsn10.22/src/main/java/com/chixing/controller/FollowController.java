package com.chixing.controller;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Follow;
import com.chixing.service.impl.FollowServiceImpl;
import com.chixing.service.impl.VisitServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/followAndvisit")
public class FollowController {
    @Autowired
    private FollowServiceImpl followService;
    @Autowired
    private VisitServiceImpl visitService;

    @RequestMapping("follviscount")
    public ModelAndView  follow(HttpSession session){
        ModelAndView mav = new ModelAndView();
        Integer  custId = (Integer)session.getAttribute("custId");

        int myfollowCount = followService.getCountCustIdInitiative(custId);
        int followmeCount = followService.getCountCustIdUnactive(custId);
        int visitmecount =   visitService.getVisitCount(custId);
        int myvisitothercount =  visitService.getMyVisitOtherCount(custId);

        mav.addObject("myfollowCount",myfollowCount);
        mav.addObject("followmeCount",followmeCount);
        mav.addObject("visitmecount",visitmecount);
        mav.addObject("myvisitothercount",myvisitothercount);
        mav.setViewName("moreInfo");
        return mav;
    }


    @RequestMapping("getAllFollowMe")
    public List<CustFollowBean>  getallFollowMe(HttpSession session){
      Integer custId=(Integer)session.getAttribute("custId");
        List<CustFollowBean> followMe =followService.getAllFollowMe(custId);
        return followMe;
    }
    @RequestMapping("getAllMyFollow")
    public List<CustFollowBean> getAllMyFollow(HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        List<CustFollowBean> mefollow = followService.getAllMyFollow(custId);
        return mefollow;
    }
    @RequestMapping("getAllVisitme")
    public List<CustFollowBean> getAllVisitme(HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        List<CustFollowBean>   visitme = visitService.getAllVisitme(custId);
        return visitme;
    }
    @RequestMapping("getmyVisitOtherById")
    public List<CustFollowBean> getmyVisitOtherById(HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        List<CustFollowBean>   myvisitother= visitService.getmyVisitOtherById(custId);
        return myvisitother;
    }
    @RequestMapping("addFollow")
    public void getmyVisitOtherById(HttpSession session,Integer custIdUnactive){
        Integer custId=(Integer)session.getAttribute("custId");
        Follow follow=new Follow();
        follow.setCustIdInitiative(custId);
        follow.setCustIdUnactive(custIdUnactive);
        follow.setFollowTime(new Date());
        followService.saveFollow(follow);

    }
}
