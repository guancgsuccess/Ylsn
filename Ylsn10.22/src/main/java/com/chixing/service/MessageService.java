package com.chixing.service;

import com.chixing.entity.CustMessBean;
import com.chixing.entity.Message;
import com.chixing.util.PageModel;

import java.util.List;

public interface MessageService {
    List<Message> getMessageById(int messFromId, int messToId);

    int saveMessage(Message message);

    Integer getCount(Integer messToId);


    //删除某个用户的某个未读消息
    int deleteUnreadByTofromId(Integer messFromId,Integer messToId);

    //删除某个用户的某个已读消息
    int deleteReadByfromId(Integer messFromId,Integer messToId);

    //删除用户发送给某个人的消息的消息
    int deleteByToId(Integer messFromId,Integer messToId);

    public PageModel<CustMessBean> getSendrByPage(PageModel<CustMessBean> page);

    //1. 查询除去相同用户已读的总记录数
    public Integer getReadCount(Integer messToId);

    public PageModel<CustMessBean> getSenderReadByPage(PageModel<CustMessBean> page);

    //1. 查询除去相同用户已发送的总记录数
    public Integer getSendCount(Integer messFromId);

    public PageModel<CustMessBean>  getCustSendByPage(PageModel<CustMessBean> page);

    //根据messToId删除该用户收到的未读消息mess_state=0;
    int deleteAllMsgByToId(Integer messToId);

    //根据messToId删除所有已读消息mess_state=1;
    int deleteReadByToId(Integer messToId);

    //删除所有已发消息mess_state=2
    int deleteByFromId(Integer messFromId);

    Integer getNotReadCount(Integer custId);

    //获得双方所有的聊天信息
    List<Message> getAllMessage(Integer messFromId,Integer messToId);

    Integer updateRead( Integer messFromId, Integer messToId);
}
