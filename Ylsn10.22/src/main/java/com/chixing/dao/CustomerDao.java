package com.chixing.dao;

import com.chixing.entity.CustFollowBean;
import com.chixing.entity.Customer;
import com.chixing.entity.LoginBean;
import com.chixing.entity.Requirement;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
@Mapper
public interface CustomerDao{
    @Select("select * from customer where cust_id=#{custId}")
    Customer selectCustomerById(Integer custId);

    @Select("select * from customer where cust_phone=#{custPhone}")
    Customer selectCustomerByPhone(String custPhone);

    @Select("select * from customer where cust_phone=#{custPhone} and cust_password=#{custPassword}")
    Customer selectCustomerByPhoneAndPassword(LoginBean loginBean);

    @Select("select * from customer where cust_nickname=#{custNickname}")
    Customer selectCustomerByNickname(String custNickname);

    //查询总记录数
    @Select("select count(cust_id) from customer")
    int selectCustomerCount();

    @Insert("insert into customer(cust_phone,cust_password,cust_nickname,cust_gender,cust_birthday,cust_province,cust_city,cust_height,cust_education,cust_income,cust_marriage,cust_zodiac,cust_constellation) values(#{custPhone},#{custPassword},#{custNickname},#{custGender},#{custBirthday},#{custProvince},#{custCity},#{custHeight},#{custEducation},#{custIncome},#{custMarriage},#{custZodiac},#{custConstellation})")
    int addCustomer(Customer customer);

    @Update("update customer set cust_password=#{custPassword} where cust_phone =#{custPhone}")
    int updateCustomerPassword(@Param("custPhone") String custPhone,@Param("custPassword") String custPassword);

    @Update("update customer set cust_day_visit_count=0,cust_meet_count=20,cust_like_number=0")
    int updateCustomerDay();

    @Update("update customer set cust_week_visit_count=0")
    int updateCustomerWeekVisitCount();

    @Update("update customer set cust_month_visit_count=0")
    int updateCustomerMonthVisitCount();

    @Update("update customer set cust_photo=#{custPhoto} where cust_phone =#{custPhone}")
    int updateCustomerPhoto(@Param("custPhone") String custPhone,@Param("custPhoto") String custPhoto);

    @Update("update customer set cust_state=#{custState} where cust_phone =#{custPhone}")
    int deleteUser(@Param("custPhone") String custPhone,@Param("custState") Integer custState);

    @SelectProvider(type=SQLProvider.class,method="selectCustomerByDynamic")
    List<Customer> selectCustomerByDynamic(@Param("requirement")Requirement requirement,@Param("md")String md,@Param("pageModel") PageModel<Customer> pageModel);

    @SelectProvider(type=SQLProvider.class,method="selectCountCustomerByDynamic")
    int selectCountCustomerByDynamic(@Param("requirement")Requirement requirement,@Param("md")String md);

    //根据用户id查询用户头像和 昵称
    @Select("select cust_nickname,cust_photo from customer where cust_id=#{custId}")
    Customer selectCustPhoto(Integer custId);

    //随机查询比自己年龄小两岁比自己年龄大两岁的4个异性用户
    @Select("SELECT * FROM  customer WHERE  cust_id not in(SELECT liked_id from mylike where like_id=#{custId}) and cust_gender!=#{custGender} and cust_birthday Between  DATE_SUB(#{custBirthday},INTERVAL 2 YEAR)and DATE_ADD(#{custBirthday},INTERVAL 3 YEAR) order by rand()  LIMIT 4;")
    List<CustFollowBean> selectFourCust(@Param("custId") Integer custId,@Param("custBirthday") Date custBirthday, @Param("custGender") String custGender);

    //随机查询比自己年龄小两岁比自己年龄大两岁的2个异性用户
    @Select("SELECT * FROM  customer WHERE  cust_id not in(SELECT liked_id from mylike where like_id=#{custId}) and  cust_gender!=#{custGender} and  cust_birthday Between  DATE_SUB(#{custBirthday},INTERVAL 2 YEAR)and DATE_ADD(#{custBirthday},INTERVAL 3 YEAR) order by rand() LIMIT 2;")
    List<CustFollowBean> selectTwoCust(@Param("custId") Integer custId,@Param("custBirthday") Date custBirthday, @Param("custGender") String custGender);

    @Update("update customer set cust_nickname=#{custNickname},cust_birthday=#{custBirthday},cust_province=#{custProvince},cust_city=#{custCity},cust_height=#{custHeight},cust_education=#{custEducation},cust_income=#{custIncome},cust_marriage=#{custMarriage},cust_profession=#{custProFession},cust_zodiac=#{custZodiac},cust_constellation=#{custConstellation},cust_blood_type=#{custBloodType},cust_weight=#{custWeight},cust_nation=#{custNation},cust_hobby=#{custHobby},cust_introduce=#{custIntroduce} where cust_id=#{custId}")
    int updateUser(Customer customer);

    @Update("update customer set cust_photo=#{custPhoto} where cust_id=#{custId}")
    int updateUserPhoto(@Param("custPhoto") String custPhoto, @Param("custId") int custId);

    @Select("select * from customer where cust_nickname=#{custNickname}")
    Customer selectCustomerbyNikename(String custNickname);

    @Select("select * from customer where cust_gender!=#{custGender} group by cust_day_visit_count desc,cust_id asc limit 4 ")
    List<CustFollowBean> selectTodayStar(@Param("custGender") String custGender);

    @Update("update customer set cust_day_visit_count=cust_day_visit_count+1,cust_week_visit_count=cust_week_visit_count+1," +
            "cust_month_visit_count=cust_month_visit_count+1,cust_total_visit_count=cust_total_visit_count+1 where cust_id =#{custId}")
    int updateVisitCount(Integer custId);

    @Select("select *  from customer where (cust_gender=#{custGender} or #{custGender} is null)and (cust_province like #{custProvince}||'%' or #{custProvince} is null)" +
            "and (cust_city=#{custCity}||'%' or #{custCity} is null)and (cust_constellation=#{CustConstellation} or #{CustConstellation} is null)" +
            "and (year(cust_birthday)>=#{minYear} or #{minYear} is null)and (year(cust_birthday)<#{maxYear} or #{maxYear} is null ) ORDER BY rand() LIMIT 10")
    List<Customer> selectCustomer(@Param("custGender") String custGender,@Param("custProvince") String custProvince,@Param("custCity") String custCity,
                                  @Param("CustConstellation") String CustConstellation,@Param("minYear") Integer minYear,@Param("maxYear") Integer maxYear);

    @Select("SELECT * from(SELECT * from customer where cust_gender=#{custGender} or #{custGender} is null ORDER BY cust_week_visit_count  desc LIMIT 0,30) t ORDER BY RAND() LIMIT 10")
    List<Customer> selectCustomerByVisit(@Param("custGender") String custGender,@Param("custWeekVisitCount") String custWeekVisitCount);

    @Select("SELECT * from customer  where cust_gender=#{custGender} or #{custGender} is null order by rand() limit 1")
    Customer selectCustomerByGender(String custGender);

    @Update("update customer set cust_meet_count=#{custMeetCount},cust_like_number=#{custLikeNumber} where cust_id =#{custId}")
    int updateCustomerMeet(@Param("custId") Integer custId,@Param("custMeetCount") Integer custMeetCount,@Param("custLikeNumber") Integer custLikeNumber);

    //根据id查询用户信息
    @Select("select * from customer where cust_id=#{custId}")
    Customer selectCustByCustId(Integer custId);

    //根据性别和省份查询日人气前六名
    @Select("select * from customer where cust_gender =#{custGender} and (cust_province=#{custProvince} or #{custProvince} like '全国') order by  cust_day_visit_count  desc limit 6")
    List<Customer> selectDayVisitCountByGenderAndProvince(@Param("custGender") String custGender, @Param("custProvince") String custProvince);

    //根据性别和省份查询周人气前六名
    @Select("select * from customer where cust_gender =#{custGender} and (cust_province=#{custProvince} or #{custProvince} like '全国') order by  cust_week_visit_count  desc limit 6")
    List<Customer> selectWeekVisitCountByGenderAndProvince(@Param("custGender") String custGender, @Param("custProvince") String custProvince);

    //根据性别和省份查询日人气前六名
    @Select("select * from customer where cust_gender =#{custGender} and (cust_province=#{custProvince} or #{custProvince} like '全国') order by  cust_month_visit_count  desc limit 6")
    List<Customer> selectMonthVisitCountByGenderAndProvince(@Param("custGender") String custGender, @Param("custProvince") String custProvince);

    //根据性别和省份查询日人气前六名
    @Select("select * from customer where cust_gender =#{custGender} and (cust_province=#{custProvince} or #{custProvince} like '全国') order by  cust_total_visit_count  desc limit 6")
    List<Customer> selectTotalVisitCountByGenderAndProvince(@Param("custGender") String custGender, @Param("custProvince") String custProvince);

    //根据性别和省份查询日人气榜所有人
    @Select("select * from customer where cust_gender =#{custGender} and (cust_province=#{custProvince} or #{custProvince} like '全国') order by  cust_day_visit_count  desc")
    List<Customer> selectAllOfDayVisitCountByGenderAndProvince(@Param("custGender") String custGender, @Param("custProvince") String custProvince);

    //根据id查询用户密码
    @Select("select cust_password from customer where cust_id=#{custId}")
    String selectPwdByCustId(Integer custId);

    //修改用户密码
    @Update("update customer set cust_password=#{custPassword} where cust_id =#{custId}")
    int updatePwdByCustId(@Param("custId") Integer custId,@Param("custPassword") String custPassword);

    @Select("select * from customer where cust_nickname=#{custNickname} and cust_id!=#{custId}")
    Customer selectCustomerByNikename(@Param("custNickname") String custNickname,@Param("custId") Integer custId);


}
