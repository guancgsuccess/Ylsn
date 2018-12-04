package com.chixing.service;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Follow;

import java.util.HashMap;
import java.util.List;

public interface FollowService {
    List<Customer> getAllByCustIdInitiative(Integer custIdInitiative);

    List<Customer> getAllByCustIdUnactive(Integer custIdUnactive);

    int getCountCustIdInitiative(Integer custIdInitiative);

    int getCountCustIdUnactive(Integer custIdUnactive);

    int saveFollow(Follow follow);

    int deleteFollow(Integer custIdInitiative, Integer custIdUnactive);

    public int add(Follow follow);

    public int delete(HashMap<String,Object> map);

    List<CustFollowBean> gettMyFollow(Integer custIdInitiative);

    List<CustFollowBean> getFollowMe(Integer custIdUnactive);

    List<CustFollowBean> getAllMyFollow(Integer custIdInitiative);

    List<CustFollowBean> getAllFollowMe(Integer custIdUnactive);
}
