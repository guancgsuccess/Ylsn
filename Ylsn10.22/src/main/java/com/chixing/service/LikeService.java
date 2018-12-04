package com.chixing.service;

import com.chixing.entity.CustFollowBean;
import java.util.List;

public interface LikeService {


    //将用户加入到喜欢表
    int saveToLike(int likeId, int likedId);
    //查询我的喜欢列表
    List<CustFollowBean> getMylike(int likeId);
}
