package com.chixing.controller;

import com.chixing.dao.CustomerDao;
import com.chixing.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class CheckPhoneServlet {
    @Autowired
    private CustomerDao dao;

    @RequestMapping(value="/askCheckPhone", method = RequestMethod.GET)
    public String  checkPhone(HttpServletRequest request){
     String   custPhone= request.getParameter("phone");
     Customer customer= dao.selectCustomerByPhone(custPhone);
     if(customer==null){
         System.out.println("-----------不存在该用户-------------------");
         return "inexist";
     }else{
         System.out.println("-----------存在该用户---------------------");
         return "exist";
     }
    }

    @RequestMapping(value="/askCheckNikename", method = RequestMethod.GET)
    public String  checkNikename(HttpServletRequest request){
        String   nikename= request.getParameter("nikename");

        Integer custId= (Integer) request.getSession().getAttribute("custId");
        if(custId!=null){
            Customer customer= dao.selectCustomerByNikename(nikename,custId);
            if(customer==null){
                System.out.println("-----------用户名可使用-------------------");
                return "inexist";
            }else{
                System.out.println("-----------用户名已存在---------------------");
                return "exist";
            }
        }else{
            Customer customer= dao.selectCustomerbyNikename(nikename);
            if(customer==null){
                System.out.println("-----------用户名可使用-------------------");
                return "inexist";
            }else{
                System.out.println("-----------用户名已存在---------------------");
                return "exist";
            }
        }
    }


}
