package com.chixing.dao;

import com.chixing.entity.Activity;
import com.chixing.entity.Customer;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ActivityDao {
    //查询所有活动
    @Select("select * from activity")
    List<Activity> selectAllActivity();

    //根据id查询活动
    @Select("select * from activity where acti_id=#{actiId}")
    Activity selectActivityById(Integer actiId);

    //添加活动
    @Insert("insert into activity(acti_title,acti_city,acti_date,acti_time,acti_place,acti_count,acti_images,acti_introduction) value(#{actiTitle},#{actiCity},#{actiDate},#{actiTime},#{actiPlace},#{actiCount},#{actiImages},#{actiIntroduction})")
    int saveActivity(Activity activity);

    //修改活动
    @Update("update activity set acti_title=#{actiTitle},acti_city=#{actiCity},acti_date=#{actiDate},acti_time=#{actiTime},acti_place=#{actiPlace},acti_count=#{actiCount},acti_images=#{actiImages},acti_introduction=#{actiIntroduction} where acti_id=#{actiId}")
    int updateActivity(Activity activity);

    //修改活动状态
    @Update("update activity set acti_state=#{actiState} where acti_id=#{actiId}")
    int updateActivityState(@Param("actiId") Integer actiId,@Param("actiState") Integer actiState);

    //删除活动
    @Delete("delete from activity where acti_id=#{actiId}")
    int deleteActivity(Integer actiId);

    //根据地址查询活动
    @Select("select * from activity where acti_city=#{actiCity}")
    List<Activity> selectActivityByCity(String actiCity);

    //根据活动查询参加的人数
    @Select("select count(cust_id) from  cust_acti where acti_id =#{actiId}")
    public int selectNo4PeopleByActivity(Integer actiId);

    //根据活动查询活动状态
    @Select("select acti_state from activity where acti_id=#{actiId}")
    public int selectStateByActivity(Integer actiId);

    //根据活动获得用户照片
    @Select("select cs.*\n" +
            "from activity a join cust_acti c \n" +
            "on a.acti_id = c.acti_id \n" +
            "join customer cs\n" + "on c.cust_id = cs.cust_id\n" + "where a.acti_id=#{actiId}")
    public List<Customer> selectPhotoByActivity(Integer actiId);

    //1. 查询总记录数(全国)
    @Select("select count(acti_id) from activity ")
    public Integer selectCount();
    //2. 分页查询(全国)
    @Select("select * from activity order by acti_state limit #{startRecord},#{pageSize}")
    public List<Activity> selectAllActivityByPage(PageModel<Activity> pageModel);

    //3.查询总记录数(城市)
    @Select("select count(acti_id) from activity where acti_city=#{actiCity}")
    public Integer selectCountByCity(String actiCity);
    //4.分页查询(城市)
    @Select("select * from activity where acti_city=#{actiCity} order by acti_state limit #{pageModel.startRecord},#{pageModel.pageSize}")
    public List<Activity> selectActivityByPage(@Param("pageModel") PageModel<Activity> pageModel, @Param("actiCity") String actiCity);

    //获得查询进行中或已结束的活动;(全国)
    @Select("select acti_state from activity" )
    public List<Integer> selectStateCount();

    //根据获得查询进行中或已结束的活动;(城市)
    @Select("select acti_state from activity where acti_city=#{actiCity}")
    public List<Integer> selectStateCountByCity(String actiCity);
}
