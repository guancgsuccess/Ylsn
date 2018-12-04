package com.chixing.service.impl;

import com.chixing.dao.CustActiDao;
import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.service.CustActivityService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustActivityServiceImpl implements CustActivityService {
    @Autowired
    private CustActiDao custActiDao;

    @Override
    public List<Activity> getCustActiByCustId(Integer custId) {
        return custActiDao.selectCustActiByCustId(custId);
    }

    @Override
    public List<Customer> getCustActiByActiId(Integer actiId) {
        return custActiDao.selectCustActiByActiId(actiId);
    }

    @Override
    public List<Customer> getmaleCountCustActi(Integer actiId) {
        return custActiDao.selectmaleCountCustActi(actiId);
    }

    @Override
    public List<Customer> getfemaleCountCustActi(Integer actiId) {
        return custActiDao.selectfemaleCountCustActi(actiId);
    }

    @Override
    public Integer getmaleCountActiId(Integer actiId) {
        return custActiDao.selectmaleCountActiId(actiId);
    }

    @Override
    public Integer getfemaleCountActiId(Integer actiId) {
        return custActiDao.selectfemaleCountActiId(actiId);
    }

    @Override
    public Integer getCountActiId(Integer actiId) {
        return custActiDao.selectCountActiId(actiId);
    }

    @Override
    public Integer getIsSignup(Integer custId, Integer actiId) {
        return custActiDao.selectIsSignup(custId, actiId);
    }

    @Override
    public int saveCustActivity(Integer custId, Integer actiId) {
        return custActiDao.addCustActi(custId, actiId);
    }

    @Override
    public PageModel<Customer> getCustActiByPage(Integer actiId, PageModel<Customer> page) {
        List<Customer> customerList = custActiDao.selectCustActiByPage(actiId, page);
        page.setModelList(customerList);
        return page;
    }

    @Override
    public PageModel<Customer> getmaleCountCustActiByPage(Integer actiId, PageModel<Customer> page) {
        List<Customer> customerList = custActiDao.selectmaleCountCustActiByPage(actiId, page);
        page.setModelList(customerList);
        return page;
    }

    @Override
    public PageModel<Customer> getfemaleCountCustActiByPage(Integer actiId, PageModel<Customer> page) {
        List<Customer> customerList = custActiDao.selectfemaleCountCustActiByPage(actiId, page);
        page.setModelList(customerList);
        return page;
    }
}
