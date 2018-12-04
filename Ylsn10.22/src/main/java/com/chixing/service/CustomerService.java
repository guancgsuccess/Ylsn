package com.chixing.service;

import com.chixing.entity.*;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public interface CustomerService {
    Customer getCustomerById(Integer custId);

    Customer getCustomerByPhone(String custPhone);

    LoginProcessBean getCustomerByPhoneAndPassword(LoginBean loginBean);

    Customer getCustomerByNickname(String custNickname);

    int getCustomerCount();

    int saveCustomer(Customer customer);

    int updateCustomerPassword(String custPhone,String custPassword);

    int updateCustomerPhoto(String custPhone,String custPhoto);

    int deleteUser(String custPhone,Integer custState);
    /*----------------------------------------------------------------*/
    void autoLogin(LoginProcessBean loginProcessBean,HttpServletResponse response);

    void saveLog(LoginProcessBean loginProcessBean,HttpServletRequest request);

    PageModel<Customer> getCustomerByDynamic(Requirement requirement, String md, PageModel<Customer> page);

    int getCountCustomerByDynamic(Requirement requirement, String md);

    Customer getCustPhoto(Integer custId);

    List<CustFollowBean> getFourCust(Integer custId,Date custBirthday,String custGender);

    List<CustFollowBean> getTwoCust(Integer custId,Date custBirthday, String custGender);

    int updateUser(Customer customer);

    int updateUserPhoto(String custPhoto,int custId);

    List<CustFollowBean> getTodayStar( String custGender);

    List<Customer> getCustomerList(String custGender, String custProvince, String custCity, String CustConstellation,Integer minYear,Integer maxYear);

    List<Customer> getCustomerByVisit(String custGender,String custWeekVisitCount);

    Integer match(Integer custId,Integer requId);

    void logout(HttpServletRequest request, HttpServletResponse response)throws IOException;

    Customer getCustomerByGender(String custGender);

    int updateMeet(Integer custId,Integer meetId, Integer custMeetCount,Integer custLikeNumber);

    //根据id查询用户
    Customer getCustByCustId(Integer custId);

    //根据性别和省份查询日人气前六名
    List<Customer> getDayVisitCountByGenderAndProvince(String custGender, String custProvince);

    //根据性别和省份查询日人气前六名
    List<Customer> getWeekVisitCountByGenderAndProvince(String custGender, String custProvince);

    //根据性别和省份查询日人气前六名
    List<Customer> getMonthVisitCountByGenderAndProvince(String custGender, String custProvince);

    //根据性别和省份查询日人气前六名
    List<Customer> getTotalVisitCountByGenderAndProvince(String custGender, String custProvince);

    //根据性别和省份查询日人气榜所有人
    List<Customer> getAllOfDayVisitCountByGenderAndProvince(String custGender, String custProvince);

    //根据id查询用户密码
    String getPwdByCustId(Integer custId);

    //根据用户ID修改密码
    int updatePwdByCustId(Integer custId,String custPassword);
}
