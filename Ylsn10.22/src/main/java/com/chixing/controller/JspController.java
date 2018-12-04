package com.chixing.controller;

import com.chixing.entity.Customer;
import com.chixing.entity.Happiness;
import com.chixing.service.CustomerService;
import com.chixing.service.HappinessService;
import com.chixing.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class JspController {
    @Autowired
    private MessageService messageService;

    @Autowired
    private HappinessService happinessService;

    @Autowired
    private CustomerService customerService;
    public JspController() {
        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<,,JspController");
    }

    @RequestMapping("/hello")
    public String hello(){
        System.out.println("<<<<<..................<<<,,hello");
        return "hello";
    }

    @RequestMapping("/user")
    public String userIndex(){
        System.out.println("<<<<<..................<<<,,user");
        return "user";
    }

    @RequestMapping("/login")
    public String login(){
        System.out.println("<<<<<..................<<<,,login");
        return "login";
    }

    @RequestMapping("/image")
    public String image(){
        return "image";
    }

    @RequestMapping("/signuplist")
    public String signuplist(){
        System.out.println("<<<<<..................<<<,,signuplist");
        return "signuplist";
    }

    @RequestMapping("/success")
    public String home(){
        return "success";
    }

    @RequestMapping("/activiti")
    public String activity(){
        return "activity";
    }

    @RequestMapping("/minbox")
    public String inbox(){
        return "inbox";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/personalCenter")
    public String personalCenter(){
        return "personalCenter";
    }

    @RequestMapping("/pageJump")
    public String tiaozhuan(){
        return "pageJump";
    }

    @RequestMapping("/moreInfo")
    public String moreInfo(){
        return "moreInfo";
    }
    @RequestMapping("/moreinf")
    public String morinf(){
        return "moreinf";
    }

    @RequestMapping("/upheadPhoto")
    public String upheadPhoto(){
        return "upheadPhoto";
    }

    @RequestMapping("header")
    public String toheader(){
        return "header";
    }
    @RequestMapping("footer")
    public String tofooter(){
        return "footer";
    }

    @RequestMapping("/index")
    public ModelAndView toindex(HttpSession session, Integer isAuto){
        ModelAndView modelAndView=new ModelAndView();
        Integer custId=(Integer) session.getAttribute("custId");
        Integer count=messageService.getNotReadCount(custId);
        if (null==count)
            count=0;
        modelAndView.addObject("count",count);
        modelAndView.setViewName("index");
        modelAndView.addObject("isAuto",isAuto);
        return modelAndView;
    }

    @RequestMapping("/constellation")
    public String constellation(){
        return "constellation";
    }

    @RequestMapping("/upload0")
    public String upload(){
        return "upload0";
    }

    @RequestMapping("/happiness")
    public String happiness(){
        return "story";
    }

    @RequestMapping("/party") //完成
    public String party(){
        return "party";
    }

    @RequestMapping("/condition") //完成
    public ModelAndView condition(HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        Integer custId=(Integer)session.getAttribute("custId");
        Customer customer=customerService.getCustomerById(custId);
        modelAndView.addObject("custNickname",customer.getCustNickname());
        modelAndView.setViewName("condition");
        return modelAndView;
    }

    @RequestMapping("/readMail")  //完成
    public ModelAndView readMail(Integer messFromId,HttpSession session) {
        ModelAndView modelAndView=new ModelAndView();
        Integer messToId=(Integer)session.getAttribute("custId");
        modelAndView.addObject("messToId",messToId);
        modelAndView.addObject("messFromId",messFromId);
        modelAndView.setViewName("readMail");
        return modelAndView;
    }

    @RequestMapping("popularityRanking") //完成
    public String popularityRanking(){
        return "popularityRanking";
    }

    @RequestMapping("popularityRankingDay") //完成
    public String popularityRankingDay(){
        return "popularityRankingDay";
    }

    @RequestMapping("setBlock") //完成
    public String setBlock(){
        return "setBlack";
    }

    @RequestMapping("setPwd") //完成
    public String setPwd(){
        return "setPwd";
    }

    @RequestMapping("detailStory")
    public ModelAndView detailStory(Integer happId,String happImage){
        ModelAndView modelAndView=new ModelAndView();
        Happiness happiness=happinessService.getHappinessByHappId(happId);
        modelAndView.addObject("happiness",happiness);
        modelAndView.addObject("happImage",happImage);
        modelAndView.setViewName("detailStory");
        return modelAndView;
    }

    @RequestMapping("indexCSZ")
    public String detailStory1(){
        return "indexCSZ";
    }
}
