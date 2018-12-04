package com.chixing.dao;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.Visit;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
@Mapper
public interface VisitDao {
    //查询访问过我的用户
    @Select("select c.* from visit v, customer c where c.cust_id=v.cust_id and cust_visit_id=#{custVisitId}")
    List<Customer> selectVisitByVisitId(int custVisitId);

    //查询我访问过的用户
    /*@Select("select c.* from visit v, customer c where c.cust_id=v.cust_visit_id and v.cust_id=#{custId}")
    List<Customer> selectVisitById(int custId);*/

    //查询最近一次访问时间
    @Select("select visit_date from visit where cust_id=#{custId} and cust_visit_id=#{custVisitId}")
    Date selectLastTime(@Param("custId") int custId,@Param("custVisitId") int custVisitId);

    //查询A是否访问过B
    @Select("select count(*) from visit where cust_id=#{custId} and cust_visit_id=#{custVisitId}")
    int selectHasVisited(@Param("custId") int custId,@Param("custVisitId") int custVisitId);

    //增加
    @Insert("insert into visit (cust_id,cust_visit_id) values(#{custId},#{custVisitId})")
    int insertVisit(Visit visit);

    //修改
    @Update("update visit set visit_date=#{visitDate} where cust_id=#{custId} and cust_visit_id=#{custVisitId}")
    int updateVisit(Visit visit);

    //查询访问过我的根据时间查询前6个用户
    @Select("select c.* from visit v, customer c where c.cust_id=v.cust_id and cust_visit_id=#{custVisitId} order by visit_date desc limit 6")
    List<CustFollowBean> selectVisitByVisitId6(Integer custVisitId);

    //查询访问过我的所有用户
    @Select("select c.* from visit v, customer c where c.cust_id=v.cust_id and cust_visit_id=#{custVisitId} order by visit_date desc limit 60")
    List<CustFollowBean> selectAllVisitme(Integer custVisitId);

    //查询我访问过的用户
    @Select("select c.* from visit v, customer c where c.cust_id=v.cust_visit_id and v.cust_id=#{custId} order by visit_date desc limit 60")
    List<CustFollowBean> selectVisitById(Integer custId);

    //查询访问我的用户数量
    @Select("select count(cust_id) from visit where cust_visit_id=#{custVisitId}")
    int selectVisitCount(Integer custVisitId);

    //查询我访问的用户数量
    @Select("select count(cust_visit_id) from visit where cust_id=#{custId}")
    int selectMyVisitOtherCount(Integer custId);
}
