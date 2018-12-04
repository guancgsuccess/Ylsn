package com.chixing.controller;

import com.chixing.entity.Customer;
import com.chixing.entity.Message;
import com.chixing.service.CustomerService;
import com.chixing.service.LoginService;
import com.chixing.service.MessageService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/readMail")
public class ReadMailController {
    public ReadMailController(){
        System.out.println("ReadMailController constructor....");
    }
    @Autowired
    private MessageService messageService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private LoginService loginService;

    //获取对方的个人信息
    @GetMapping("getCustomerByCustId")
    public Customer getCustomerByCustId(Integer messFromId, HttpSession session){
        if(messFromId==null)
            messFromId=(Integer)session.getAttribute("custId") ;
        Customer result = this.customerService.getCustByCustId(messFromId);
        return result;
    }

    //查询双方所有的信息
    @GetMapping("getAllMessage")
    public List<Message> getAllMesage(Integer messFromId, HttpSession session){
        Integer messToId=(Integer)session.getAttribute("custId") ;
        List<Message> messageList = this.messageService.getAllMessage(messFromId,messToId);
        return messageList;
    }

    //回复消息
    @PostMapping("replyMessage")
    public int saveMessage(Message message){
        message.setMessTime(new Date());
        int result =this.messageService.saveMessage(message);
        System.out.println("*****************result = " + result);
        return result;
    }

    //获得登录时间
    @GetMapping("loginTime")
    public Date getLoginTimeByCustId(HttpSession session){
        Integer custId=(Integer)session.getAttribute("custId");
        Date date = this.loginService.getLoginTimeByCustId(custId);
        System.out.println("@#$%^&*#$%^&date = " + date);
        return date;
    }



}
