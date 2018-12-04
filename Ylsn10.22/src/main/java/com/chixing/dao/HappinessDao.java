package com.chixing.dao;

import com.chixing.entity.Happiness;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface HappinessDao {
    //根据id判断用户是否有伴侣
    @Select("select * from happiness where cust_id=#{custId}")
    Happiness selectHappinessById(Integer custId);

    //根据昵称判断用户是否有伴侣
    @Select("select * from happiness where happ_other_name=#{happOtherName}")
    Happiness selectHappinessByName(String happOtherName);

    //查询总幸福数
    @Select("select count(happ_id) from happiness")
    int selectCountHappiness();

    //添加幸福
    @Insert("insert into happiness(happ_other_name,happ_state,happ_title,happ_content,happ_images,cust_id) values(#{happOtherName},#{happState},#{happTitle},#{happContent},#{happImages},#{custId})")
    int addHappiness(Happiness happiness);

    //删除幸福
    @Delete("delete from happiness where happ_id= #{happId}")
    int deleteHappiness(Integer happId);

    //根据判断用户手机号查询记录
    @Select("select h.* from happiness h,customer c where c.cust_id=h.cust_id and c.cust_phone=#{custPhone}")
    Happiness selectHappinessByPhone(String custPhone);

    //根据判断id查询记录
    @Select("select * from happiness  where happ_id=#{happId}")
    Happiness selectHappinessByHappId(Integer happId);
}
