package com.chixing.dao;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Follow;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface FollowDao {
    //查询我关注的用户
    @Select("select c.* from follow f join customer c on f.cust_id_unactive=c.cust_id where cust_id_initiative=#{custIdInitiative} order by f.follow_time desc")
    List<Customer> selectByCustIdInitiative(Integer custIdInitiative);

    //查询关注我的用户
    @Select("select c.* from follow f join customer c on f.cust_id_initiative=c.cust_id where  cust_id_unactive=#{custIdUnactive} order by f.follow_time desc")
    List<Customer> selectByCustIdUnactive(Integer custIdUnactive);

    //查询我关注的用户数
    @Select("select count(cust_id_initiative) from follow where cust_id_initiative=#{custIdInitiative}")
    int selectCountCustIdInitiative(Integer custIdInitiative);

    //查询关注我的用户数
    @Select("select count(cust_id_unactive) from follow where cust_id_unactive=#{custIdUnactive}")
    int selectCountCustIdUnactive(Integer custIdUnactive);

    //添加关注
    @Insert("insert into follow value(#{custIdInitiative},#{custIdUnactive},#{followTime})")
    int saveFollow(Follow follow);

    //删除关注
    @Delete("delete from follow  where cust_id_initiative=#{custIdInitiative} and cust_id_unactive=#{custIdUnactive} ")
    int deleteFollow(@Param("custIdInitiative") Integer custIdInitiative, @Param("custIdUnactive") Integer custIdUnactive);

    //查询我关注的用户根据时间的前六个
    @Select("select * from follow f join customer c on f.cust_id_unactive=c.cust_id  where cust_id_initiative=#{custIdInitiative} order by follow_time desc limit 6 ")
    List<CustFollowBean> selectMyFollow(Integer custIdInitiative);

    //查询关注我的用户
    @Select("select * from follow f join customer c on f.cust_id_initiative=c.cust_id  where cust_id_unactive=#{custIdUnactive} order by follow_time desc limit 6 ")
    List<CustFollowBean> selectFollowMe(Integer custIdUnactive);

    //查询我关注的所有用户
    @Select("select * from follow f join customer c on f.cust_id_unactive=c.cust_id  where cust_id_initiative=#{custIdInitiative} order by follow_time desc limit 60  ")
    List<CustFollowBean> selectAllMyFollow(Integer custIdInitiative);

    //查询关注我的所有用户
    @Select("select * from follow f join customer c on f.cust_id_initiative=c.cust_id  where cust_id_unactive=#{custIdUnactive} order by follow_time desc limit 60  ")
    List<CustFollowBean> selectAllFollowMe(Integer custIdUnactive);

    @Insert("insert into follow values(#{custIdInitiative},#{custIdUnactive},#{followTime})")
    public int save(Follow follow);

    @Delete("delete from follow  where cust_id_initiative=#{custIdInitiative} and cust_id_unactive=#{custIdUnactive} ")
    public int delete(HashMap<String,Object> map);

    //是否关注过
    @Select("select * from follow where cust_id_unactive=#{custIdUnactive} and cust_id_initiative=#{custIdInitiative}")
    Follow selectIsFollow(@Param("custIdInitiative") Integer custIdInitiative,@Param("custIdUnactive") Integer custIdUnactive);
}
