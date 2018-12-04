package com.chixing.service.impl;

import com.chixing.dao.BlacklistDao;
import com.chixing.entity.Customer;
import com.chixing.service.BlacklistService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class  BlacklistServiceImpl implements BlacklistService {
    @Autowired
    private BlacklistDao blacklistDao;

    @Override
    public List<Customer> getBlacklistById(Integer custId) {
        return blacklistDao.selectBlacklistById(custId);
    }

    @Override
    public int saveBlacklist(Integer custId, Integer custBlackId) {
        return blacklistDao.addBlacklist(custId, custBlackId);
    }

    @Override
    public int deleteBlacklist(Integer custId, Integer custBlackId) {
        return blacklistDao.deleteBlacklist(custId, custBlackId);
    }

    //分页
    @Override
    public Integer getCountOfBlacklistByCustId(Integer custId) {
        return this.blacklistDao.selectCountOfBlacklistByCustId(custId);
    }

    @Override
    public PageModel<Customer> getBlacklistMsgByPage(PageModel<Customer> page, Integer custId) {
        List<Customer> customerList = this.blacklistDao.selectBlacklistMsgByPage(page,custId);
        page.setModelList(customerList);
        return page;
    }
}
