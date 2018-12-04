package com.chixing.dao;

import com.chixing.entity.Comments;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CommentDao {
    //根据幸福id查询所有评论,按时间降序
    @Select("select * from comments  where happ_id=#{happId} order by comm_time desc")
    List<Comments> selectCommentById(Integer happId);

    //根据幸福id查询幸福评论人数
    @Select("select count(cust_id) from comments where happ_id=#{happId}")
    int selectCountCommentByHappId(Integer happId);

    //添加评论
    @Insert("insert into comments(comm_content,cust_id,happ_id) values(#{commContent},#{custId},#{happId})")
    int addComments(Comments comments);

    //删除评论
    @Delete("delete from comments where comm_id= #{commId}")
    int deleteCommentsById(Integer commId);

    //删除所有评论
    @Delete("delete from comments where happ_id= #{happId}")
    int deleteComments(Integer happId);

    //分页查询
    @Select("select * from comments where happ_id=#{happId} order by comm_time desc limit #{pageModel.startRecord},#{pageModel.pageSize}")
    List<Comments> selectCommByPage(@Param("pageModel") PageModel<Comments> pageModel, @Param("happId") Integer happId);
}
