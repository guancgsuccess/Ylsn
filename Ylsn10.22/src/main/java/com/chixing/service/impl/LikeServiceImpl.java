package com.chixing.service.impl;

import com.chixing.dao.LikeDao;
import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Like;
import com.chixing.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LikeServiceImpl implements LikeService {
    @Autowired
    private LikeDao likedao;
    @Override
    public int saveToLike(int likeId, int likedId) {
        return likedao.addToLike(likeId,likedId);
    }

    @Override
    public List<CustFollowBean> getMylike(int likeId) {
        return likedao.selectMylike(likeId);
    }
}
