package com.chixing.dao;

import com.chixing.entity.Customer;
import com.chixing.entity.Requirement;
import com.chixing.util.PageModel;
import org.apache.ibatis.jdbc.SQL;

public class SQLProvider {
    public String selectCustomerByDynamic(final Requirement requirement, final String md, final PageModel<Customer> pageModel){
        return new SQL(){{
            SELECT("c.*");
            FROM("customer c");
            JOIN("login l");
            WHERE("date_sub(curdate(), INTERVAL 30 day) <= date(l.login_time) and c.cust_id=l.cust_id and c.cust_id!=#{requirement.custId} and c.cust_marriage='未婚'");
            if(md.equals("log")){
                WHERE("c.cust_id=l.cust_id");
            }
            if(requirement.getRequGender() != null){
                WHERE("c.cust_gender=#{requirement.requGender}");
            }
            if(requirement.getRequProvince() != null){
                WHERE("c.cust_province=#{requirement.requProvince}");
            }
            if(requirement.getRequCity() != null){
                WHERE("c.cust_city=#{requirement.requCity}");
            }
            if(requirement.getRequMinAge() != null){
                WHERE("year(now())-year(c.cust_Birthday) between #{requirement.requMinAge} and #{requirement.requMaxAge}");
            }
            if(requirement.getRequMinHeight() != null){
                WHERE("c.cust_height between #{requirement.requMinHeight} and #{requirement.requMaxHeight}");
            }
            if(requirement.getRequHasPhoto() != null&&requirement.getRequHasPhoto()==1){
                WHERE("c.cust_photo!='xxx.jpg'");
            }
            if(requirement.getRequMarriage() != null){
                WHERE("c.cust_marriage=#{requirement.requMarriage}");
            }
            if(requirement.getRequEducation() != null){
                WHERE("c.cust_education=#{requirement.requEducation}");
            }
            if(requirement.getRequIncome() != null){
                WHERE("c.cust_income=#{requirement.requIncome}");
            }
            if(requirement.getRequNation() != null){
                WHERE("c.cust_nation=#{requirement.requNation}");
            }
            if(requirement.getRequBloodType() != null){
                WHERE("c.cust_blood_type=#{requirement.requBloodType}");
            }
            if(requirement.getRequZodiac() != null){
                WHERE("c.cust_zodiac in (#{requirement.requZodiac})");
            }
            if(requirement.getRequConstellation() != null){
                WHERE("c.cust_constellation in (#{requirement.requConstellation})");
            }
            if(md.equals("all")) {
                ORDER_BY("c.cust_nickname desc limit #{pageModel.startRecord},#{pageModel.pageSize}");
            }
            if(md.equals("ml")) {
                ORDER_BY("c.cust_total_visit_count desc limit #{pageModel.startRecord},#{pageModel.pageSize}");
            }
            if(md.equals("log")){
                ORDER_BY("l.login_time desc limit #{pageModel.startRecord},#{pageModel.pageSize}");
            }
            if(md.equals("zc")){
                ORDER_BY("c.cust_create_time desc limit #{pageModel.startRecord},#{pageModel.pageSize}");
            }
        }}.toString();
    }

    public String selectCountCustomerByDynamic(final Requirement requirement, final String md){
        return new SQL(){{
            SELECT("count(c.cust_id )");
            FROM("customer c");
            JOIN("login l");
            WHERE("date_sub(curdate(), INTERVAL 30 day) <= date(l.login_time) and c.cust_id=l.cust_id and c.cust_id!=#{requirement.custId} and c.cust_marriage='未婚'");
            if(md.equals("log")){
                WHERE("c.cust_id=l.cust_id");
            }
            if(requirement.getRequGender() != null){
                WHERE("c.cust_gender=#{requirement.requGender}");
            }
            if(requirement.getRequProvince() != null){
                WHERE("c.cust_province=#{requirement.requProvince}");
            }
            if(requirement.getRequCity() != null){
                WHERE("c.cust_city=#{requirement.requCity}");
            }
            if(requirement.getRequMinAge() != null){
                WHERE("year(now())-year(c.cust_Birthday) between #{requirement.requMinAge} and #{requirement.requMaxAge}");
            }
            if(requirement.getRequMinHeight() != null){
                WHERE("c.cust_height between #{requirement.requMinHeight} and #{requirement.requMaxHeight}");
            }
            if(requirement.getRequHasPhoto() != null&&requirement.getRequHasPhoto()==1){
                WHERE("c.cust_photo!='xxx.jpg'");
            }
            if(requirement.getRequMarriage() != null){
                WHERE("c.cust_marriage=#{requirement.requMarriage}");
            }
            if(requirement.getRequEducation() != null){
                WHERE("c.cust_education=#{requirement.requEducation}");
            }
            if(requirement.getRequIncome() != null){
                WHERE("c.cust_income=#{requirement.requIncome}");
            }
            if(requirement.getRequNation() != null){
                WHERE("c.cust_nation=#{requirement.requNation}");
            }
            if(requirement.getRequBloodType() != null){
                WHERE("c.cust_blood_type=#{requirement.requBloodType}");
            }
            if(requirement.getRequZodiac() != null){
                WHERE("c.cust_zodiac in (#{requirement.requZodiac})");
            }
            if(requirement.getRequConstellation() != null){
                WHERE("c.cust_constellation in (#{requirement.requConstellation})");
            }
        }}.toString();
    }
}
