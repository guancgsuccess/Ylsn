package com.chixing.service.impl;

import com.chixing.dao.FollowDao;
import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Follow;
import com.chixing.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class FollowServiceImpl implements FollowService {
    @Autowired
    private FollowDao followDao;

    @Override
    public List<Customer> getAllByCustIdInitiative(Integer custIdInitiative) {
        return followDao.selectByCustIdInitiative(custIdInitiative);
    }

    @Override
    public List<Customer> getAllByCustIdUnactive(Integer custIdUnactive) {
        return followDao.selectByCustIdUnactive(custIdUnactive);
    }

    @Override
    public int getCountCustIdInitiative(Integer custIdInitiative) {
        return followDao.selectCountCustIdInitiative(custIdInitiative);
    }

    @Override
    public int getCountCustIdUnactive(Integer custIdUnactive) {
        return followDao.selectCountCustIdUnactive(custIdUnactive);
    }

    @Override
    public int saveFollow(Follow follow) {
        if(followDao.selectIsFollow(follow.getCustIdInitiative(),follow.getCustIdUnactive())==null)
            return followDao.saveFollow(follow);
        return 0;
    }

    @Override
    public int deleteFollow(Integer custIdInitiative, Integer custIdUnactive) {
        return followDao.deleteFollow(custIdInitiative, custIdUnactive);
    }

    @Override
    public int add(Follow follow) {
        return followDao.save(follow);
    }

    @Override
    public int delete(HashMap<String, Object> map) {
        return followDao.delete(map);
    }

    @Override
    public List<CustFollowBean> gettMyFollow(Integer custIdInitiative) {
        return followDao.selectMyFollow(custIdInitiative);
    }

    @Override
    public List<CustFollowBean> getFollowMe(Integer custIdUnactive) {
        return followDao.selectFollowMe(custIdUnactive);
    }

    @Override
    public List<CustFollowBean> getAllMyFollow(Integer custIdInitiative) {
        return followDao.selectMyFollow(custIdInitiative);
    }

    @Override
    public List<CustFollowBean> getAllFollowMe(Integer custIdUnactive) {
        return followDao.selectAllFollowMe(custIdUnactive);
    }
}
