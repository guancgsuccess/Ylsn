package com.chixing.controller;

import com.chixing.entity.CustMessBean;
import com.chixing.service.MessageService;
import com.chixing.service.impl.MessageServiceImpl;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService msgService;

    @GetMapping("msg")
    public PageModel<CustMessBean> getMsgByPage(Integer pagecode, HttpSession session){
        PageModel<CustMessBean> page =  new PageModel<CustMessBean>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        Integer custId=(Integer) session.getAttribute("custId");
        page.setMessToId(custId);
        page.setTotalRecord(this.msgService.getCount(custId));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page = this.msgService.getSendrByPage(page);
        return page;
    }

    @GetMapping("msg/page/{page}")
    public PageModel<CustMessBean> getByPage(@PathVariable Integer page, HttpSession session) {
        return    getMsgByPage(page,session);
    }

    @DeleteMapping("deleteunread/{delId}")
        public  void deleteUnreadByFromId(@PathVariable Integer delId,HttpSession session){
                int custId= (int) session.getAttribute("custId");
                msgService.deleteUnreadByTofromId(delId,custId);
    }

    @DeleteMapping("deleteread/{delId}")
    public  void deleteReadByFromId(@PathVariable Integer delId,HttpSession session){
        int custId= (int) session.getAttribute("custId");
        msgService.deleteReadByfromId(delId,custId);
    }

    //查询 已读消息
    @GetMapping("readmsg")
    public PageModel<CustMessBean> getReadMsgByPage(Integer pagecode, HttpSession session){
        PageModel<CustMessBean> page =  new PageModel<CustMessBean>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        Integer custId=(Integer) session.getAttribute("custId");
        page.setMessToId(custId);
        page.setTotalRecord(this.msgService.getReadCount(custId));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page = this.msgService.getSenderReadByPage(page);
        return page;
    }


    @GetMapping("readmsg/page/{page}")
    public PageModel<CustMessBean> getReadByPage(@PathVariable Integer page, HttpSession session) {
        return    getReadMsgByPage(page,session);
    }

    //查看已发消息
    @GetMapping("sendmsg")
    public PageModel<CustMessBean> getSendMsgByPage(Integer pagecode, HttpSession session){
        PageModel<CustMessBean> page =  new PageModel<CustMessBean>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        Integer custId=(Integer) session.getAttribute("custId");
        page.setMessFromId(custId);
        page.setTotalRecord(this.msgService.getSendCount(custId));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page = this.msgService.getCustSendByPage(page);
        return page;
    }


    @GetMapping("sendmsg/page/{page}")
    public PageModel<CustMessBean> getSendByPage(@PathVariable Integer page, HttpSession session) {
        return   getSendMsgByPage(page,session);
    }

    @DeleteMapping("deleteTo/{delId}")
    public  void deleteByToId(@PathVariable Integer delId,HttpSession session){
        int fromId= (int) session.getAttribute("custId");
       this.msgService.deleteByToId(fromId,delId);
    }

    @DeleteMapping("deleteallmsg")
    public void deleteAllMsg(HttpSession session){
        int custId= (int) session.getAttribute("custId");
        msgService.deleteAllMsgByToId(custId);
    }
    @DeleteMapping("deletereadmsg")
    public void deleteAllReadMsg(HttpSession session){
        int custId= (int) session.getAttribute("custId");
        msgService.deleteReadByToId(custId);
    }
    @DeleteMapping("deletesendmsg")
    public void deleteAllSendMess(HttpSession session){
        int custId= (int)session.getAttribute("custId");
        msgService.deleteByFromId(custId);
    }

    @GetMapping("read")
    public void setRead(HttpSession session,Integer messFromId) {
        Integer messToId=(Integer)session.getAttribute("custId");
        msgService.updateRead(messFromId,messToId);
    }

}
