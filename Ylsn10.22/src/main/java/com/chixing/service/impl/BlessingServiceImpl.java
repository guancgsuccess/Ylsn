package com.chixing.service.impl;

import com.chixing.dao.BlessingDao;
import com.chixing.entity.Customer;
import com.chixing.service.BlessingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlessingServiceImpl implements BlessingService {
    @Autowired
    private BlessingDao blessingDao;

    @Override
    public int getCountBlessing(Integer happId) {
        return blessingDao.selectConutBlessing(happId);
    }

    @Override
    public List<Customer> getBlessingByHappId(Integer happId) {
        return blessingDao.selectBlessingByHappId(happId);
    }

    @Override
    public int getBlessing(Integer happId, Integer custId) {
        return blessingDao.selectBlessing(happId, custId);
    }

    @Override
    public int saveBlessing(Integer happId, Integer custId) {
        return blessingDao.addBlessing(happId, custId);
    }

    @Override
    public int deleteBlessing(Integer happId, Integer custId) {
        return blessingDao.deleteBlessing(happId, custId);
    }
}
