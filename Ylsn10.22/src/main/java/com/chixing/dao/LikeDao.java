package com.chixing.dao;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Like;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface LikeDao {
    //将用户加入到喜欢表
    @Insert("insert into mylike(like_id,liked_id) values(#{0},#{1})")
    int addToLike(int likeId, int likedId);
    //查询我的喜欢列表
    @Select("select * from mylike m join customer c on m.liked_id=c.cust_id where like_id=#{likeId}")
    List<CustFollowBean> selectMylike(int likeId);
}
