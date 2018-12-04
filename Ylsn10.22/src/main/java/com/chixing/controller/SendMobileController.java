package com.chixing.controller;

import com.chixing.service.impl.LikeServiceImpl;
import com.chixing.util.JuheDemo;
import com.chixing.util.Random4Numb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class SendMobileController {
    @Autowired
    private LikeServiceImpl likeService;


    @RequestMapping(value="/SendMobile",method = RequestMethod.GET)
    public String  sendMobileCode(HttpServletRequest request){
        String mobilecode=Random4Numb.generateDigitalString(4);
      String  mobileCode="#code#="+mobilecode;
        System.out.println(mobileCode);

    String phoneNo= request.getParameter("telephone");
    HttpSession session= request.getSession();
    session.setAttribute("mobileCode",mobileCode);

        JuheDemo.mobileQuery(phoneNo,mobileCode);
        return "0";
    }

    @RequestMapping(value = "/GetMobileCode",method = RequestMethod.GET)
    public String  GetMobileCode(HttpServletRequest request){
        HttpSession session= request.getSession();
     String mobileCode=(String)session.getAttribute("mobileCode");
        System.out.println(mobileCode);
     return mobileCode;
    }

    //将某个用户加入我的喜欢列表
    @RequestMapping(value="/addToMylike",method = RequestMethod.POST)
    public void addToMylike(HttpServletRequest request){
        int custId= (int) request.getSession().getAttribute("custId");
        String likedid=  request.getParameter("liked");
        int likeId= Integer.parseInt(likedid);
        likeService.saveToLike(custId,likeId);
    }
}
