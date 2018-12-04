package com.chixing.dao;

import com.chixing.entity.Requirement;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RequirementDao {
    //根据用户Id查询
    @Select("select * from requirement where cust_id=#{custId}")
    Requirement selectRequirementByCustId(int custId);

    //增加择友条件
    @Insert("insert into requirement(requ_gender,requ_min_age,requ_max_age,requ_province,requ_city,requ_min_height,requ_max_height,requ_marriage,requ_education,requ_income,requ_hasphoto,cust_id) values(#{requGender},#{requMinAge},#{requMaxAge},#{requProvince},#{requCity},#{requMinHeight},#{requMaxHeight},#{requMarriage},#{requEducation},#{requIncome},#{requHasPhoto},#{custId})")
    int insertRequirement(Requirement requirement);

    //修改择友条件
    @Update("update requirement set requ_min_age =#{requMinAge},requ_max_age =#{requMaxAge}, requ_province =#{requProvince},requ_city =#{requCity},requ_min_height =#{requMinHeight},requ_max_height =#{requMaxHeight},requ_marriage =#{requMarriage},requ_education =#{requEducation},requ_income =#{requIncome},requ_hasphoto =#{requHasPhoto},requ_blood_type=#{requBloodType}, requ_nation=#{requNation}, requ_zodiac=#{requZodiac}, requ_constellation=#{requConstellation}, requ_gender=#{requGender} where cust_id =#{custId}")
    int updateRequirement(Requirement requirement);

    @Select("select * from requirement where cust_id=#{custId}")
    Requirement selectRealRequirement(int custId);
}
