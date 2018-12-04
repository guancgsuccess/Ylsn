package com.chixing.service;

import com.chixing.entity.Customer;

import java.util.List;

public interface BlessingService {
    int getCountBlessing(Integer happId);

    List<Customer> getBlessingByHappId(Integer happId);

    int getBlessing(Integer happId,Integer custId);

    int saveBlessing(Integer happId,Integer custId);

    int deleteBlessing(Integer happId,Integer custId);
}
