package com.chixing.service.impl;

import com.chixing.dao.MessageDao;
import com.chixing.entity.CustMessBean;
import com.chixing.entity.Message;
import com.chixing.service.MessageService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;

    @Override
    public List<Message> getMessageById(int messFromId, int messToId) {
        return messageDao.selectMessageById(messFromId, messToId);
    }

    @Override
    public int saveMessage(Message message) {
        return messageDao.insertMessage(message);
    }

    @Override
    public Integer getCount(Integer messToId) {
        return messageDao.selectCount(messToId);
    }

    @Override
    public int deleteUnreadByTofromId(Integer messFromId, Integer messToId) {
        return messageDao.deleteUnreadByTofromId(messFromId,messToId);
    }

    @Override
    public int deleteReadByfromId(Integer messFromId, Integer messToId) {
        return messageDao.deleteReadByfromId(messFromId,messToId);
    }

    @Override
    public int deleteByToId(Integer messFromId, Integer messToId) {
        return messageDao.deleteByToId(messFromId,messToId);
    }

    @Override
    public PageModel<CustMessBean> getSendrByPage(PageModel<CustMessBean> page) {
        List<CustMessBean> senderList = this.messageDao.selectSendrByPage(page);
        page.setModelList(senderList);
        return page;
    }

    @Override
    public Integer getReadCount(Integer messToId) {
        return this.messageDao.selectReadCount(messToId);
    }

    @Override
    public PageModel<CustMessBean> getSenderReadByPage(PageModel<CustMessBean> page) {
        List<CustMessBean> senderList = this.messageDao.selectSenderReadByPage(page);
        page.setModelList(senderList);
        return page;
    }

    @Override
    public Integer getSendCount(Integer messFromId) {
        return this.messageDao.selectSendCount(messFromId);
    }

    @Override
    public PageModel<CustMessBean> getCustSendByPage(PageModel<CustMessBean> page) {
        List<CustMessBean> senderList = this.messageDao.selectCustSendByPage(page);
        page.setModelList(senderList);
        return page;
    }

    @Override
    public int deleteAllMsgByToId(Integer messToId) {
        return messageDao.deleteAllMsgByToId(messToId);
    }

    @Override
    public int deleteReadByToId(Integer messToId) {
        return messageDao.deleteReadByToId(messToId);
    }

    @Override
    public int deleteByFromId(Integer messFromId) {
        return this.messageDao.deleteByFromId(messFromId);
    }

    @Override
    public Integer getNotReadCount(Integer custId) {
        return messageDao.selectNotReadCount(custId);
    }

    @Override
    public List<Message> getAllMessage(Integer messFromId, Integer messToId) {
        return this.messageDao.selectAllMessage(messFromId,messToId);
    }

    @Override
    public Integer updateRead(Integer messFromId, Integer messToId) {
        return messageDao.updateRead(messFromId,messToId);
    }
}
