package com.chixing.dao;

import com.chixing.entity.Customer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BlessingDao {
    //根据幸福id查询点赞数
    @Select("select count(cust_id) from blessing  where happ_id=#{happId}")
    int selectConutBlessing(Integer happId);

    //根据幸福id查询用户
    @Select("select c.* from customer c join blessing b where b.happ_id=#{happId} and c.cust_id=b.cust_id")
    List<Customer> selectBlessingByHappId(Integer happId);

    //判断用户是否点过了
    @Select("select count(cust_id) from blessing  where cust_id= #{custId} and happ_id=#{happId}")
    int selectBlessing(@Param("happId") Integer happId, @Param("custId") Integer custId);

    //添加点赞
    @Insert("insert into blessing values(#{happId},#{custId})")
    int addBlessing(@Param("happId") Integer happId, @Param("custId") Integer custId);

    //删除点赞
    @Delete("delete from blessing where  cust_id= #{custId} and happ_id=#{happId}")
    int deleteBlessing(@Param("happId") Integer happId, @Param("custId") Integer custId);
}
