package com.chixing.dao;

import com.chixing.entity.Login;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
@Mapper
public interface LoginDao {
    @Select("select * from login where cust_id=#{custId}")
    Login selectRecentLoginByCustId(Integer custId);

    @Select("select count(login_id) from login")
    int selectLoginCount();

    @Insert("insert into login(login_ip,cust_id) values(#{loginIp},#{custId})")
    int addLogin(Login login);

    @Update("update login set login_time=now() , login_ip=#{loginIp} where login_id =#{loginId}")
    int updateLogin(@Param("loginIp") String loginIp, @Param("loginId") Integer loginId);

    @Delete("delete from login where cust_id in(select cust_id from customer where cust_state=2)")
    int deleteUser();

    //根据用户Id查询登录时间
    @Select("select login_time from login where cust_id=#{custId} order by login_time desc limit 1")
    Date selectLoginTimeByCustId(Integer custId);
}
