package com.chixing.dao;

import com.chixing.entity.Customer;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BlacklistDao {
    //根据用户id查询被该用户拉黑的所有用户
    @Select("select c.* from customer c join blacklist b where c.cust_id=b.cust_black_id and b.cust_id=#{custId}")
    List<Customer> selectBlacklistById(Integer custId);

    //添加用户进入黑名单
    @Insert("insert into blacklist values(#{custId},#{custBlackId})")
    int addBlacklist(@Param("custId") Integer custId, @Param("custBlackId") Integer custBlackId);

    //删除黑名单
    @Delete("delete from blacklist where cust_black_id= #{custBlackId} and cust_id=#{custId}")
    int deleteBlacklist(@Param("custId") Integer custId, @Param("custBlackId") Integer custBlackId);

    //根据用户Id查询其黑名单总人数
    @Select("select count(cust_black_id) from blacklist where cust_id =#{custId}")
    public Integer selectCountOfBlacklistByCustId(Integer custId);

    //分页查询用户黑名单的所有信息
    @Select("select c.* from customer c join blacklist b on c.cust_id=b.cust_black_id where b.cust_id=#{custId} limit #{pageModel.startRecord},#{pageModel.pageSize}")
    public List<Customer> selectBlacklistMsgByPage(@Param("pageModel") PageModel<Customer> pageModel, @Param("custId") Integer custId);
}
