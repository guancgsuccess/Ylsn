package com.chixing.controller;

import com.chixing.entity.Customer;
import com.chixing.service.BlacklistService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("blacklist")
public class BlacklistController {
    public BlacklistController(){
        System.out.println("BlacklistController constructor....");
    }
    @Autowired
    private BlacklistService blacklistService;
    @GetMapping("getBlackCustMsg")
    public PageModel<Customer> getBlacklistMsgByPage(Integer pagecode, HttpSession session){
        PageModel<Customer> page = new PageModel<Customer>();
        Integer custId=(Integer)session.getAttribute("custId");
        System.out.println("pagecode = " + pagecode);
        if (pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else {
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.blacklistService.getCountOfBlacklistByCustId(custId));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() : page.getTotalRecord()/page.getPageSize()+1);
        page.setStartRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        page = this.blacklistService.getBlacklistMsgByPage(page,custId);
        return page;
    }

    @GetMapping("getBlackCustMsg/page/{page}")
    public PageModel<Customer> pageByPage(@PathVariable Integer page, HttpSession session){
        return getBlacklistMsgByPage(page,session);
    }

    @DeleteMapping("deleteBlacklist")
    public Integer deleteBlacklist(HttpSession session, Integer custBlackId){
        Integer custId=(Integer)session.getAttribute("custId");
        int result = this.blacklistService.deleteBlacklist(custId,custBlackId);
        return result;
    }
}
