package com.chixing.dao;

import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustActiDao {
    //查询用户参加的活动
    @Select("select a.* from cust_acti ca,activity a where a.acti_id=ca.acti_id and cust_id=#{custId}")
    List<Activity> selectCustActiByCustId(Integer custId);

    //查询参加活动所有用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId}")
    List<Customer> selectCustActiByActiId(Integer actiId);

    //查询参加活动所有男性用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='男'")
    List<Customer> selectmaleCountCustActi(Integer actiId);

    //查询参加活动所有女性用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='女'")
    List<Customer> selectfemaleCountCustActi(Integer actiId);

    //查询参加活动的男性用户数量
    @Select("select count(c.cust_id) from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='男'")
    Integer selectmaleCountActiId(Integer actiId);

    //查询参加活动的女性用户数量
    @Select("select count(c.cust_id) from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='女'")
    Integer selectfemaleCountActiId(Integer actiId);

    //查询参加活动的用户数量
    @Select("select count(cust_id) from cust_acti where acti_id=#{actiId}")
    Integer selectCountActiId(Integer actiId);

    //查询用户是否参加过活动
    @Select("select count(*) from cust_acti where cust_id=#{custId} and acti_id=#{actiId}")
    Integer selectIsSignup(@Param("custId") Integer custId, @Param("actiId") Integer actiId);

    //添加用户(用户参加活动)
    @Insert("insert into cust_acti value(#{custId},#{actiId})")
    int addCustActi(@Param("custId") Integer custId, @Param("actiId") Integer actiId);

    //分页查询参加活动所有用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} limit #{pageModel.startRecord},#{pageModel.pageSize}")
    List<Customer> selectCustActiByPage(@Param("actiId") Integer actiId, @Param("pageModel") PageModel<Customer> pageModel);

    //分页查询参加活动所有男性用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='男' limit #{pageModel.startRecord},#{pageModel.pageSize}")
    List<Customer> selectmaleCountCustActiByPage(@Param("actiId") Integer actiId, @Param("pageModel") PageModel<Customer> pageModel);

    //分页查询参加活动所有女性用户
    @Select("select c.* from cust_acti ca,customer c where c.cust_id=ca.cust_id and acti_id=#{actiId} and c.cust_gender='女' limit #{pageModel.startRecord},#{pageModel.pageSize}")
    List<Customer> selectfemaleCountCustActiByPage(@Param("actiId") Integer actiId, @Param("pageModel") PageModel<Customer> pageModel);
}
