package com.chixing.dao;

import com.chixing.entity.CustMessBean;
import com.chixing.entity.Message;
import com.chixing.util.PageModel;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MessageDao {
    //根据收发信息的用户的Id查询
    @Select("select * from message where mess_from_id=#{messFromId} and mess_to_id=#{messToId} order by mess_time")
    List<Message> selectMessageById(@Param("messFromId") int messFromId, @Param("messToId") int messToId);

    //增加信息
    @Insert("insert into message(mess_content,mess_from_id,mess_to_id) values(#{messContent},#{messFromId},#{messToId})")
    int insertMessage(Message message);

    //根据messfromId删除该的所有未读信件
    @Delete("delete from message where mess_from_id=#{0} and mess_to_id=#{1} and mess_state=0")
    int deleteUnreadByTofromId(Integer messFromId,Integer messToId);

    //根据messfromId删除该的所有未读信件
    @Delete("delete from message where mess_from_id=#{0} and mess_to_id=#{1} and mess_state=1")
    int deleteReadByfromId(Integer messFromId,Integer messToId);
    //根据messToId删除该用户发给某个用户信件
    @Delete("delete from message where mess_from_id=#{0} and mess_to_id=#{1} ")
    int deleteByToId(Integer messFromId,Integer messToId);


    //1. 查询除去相同用户的总记录数
    @Select("select count(DISTINCT mess_from_id) from message  where mess_to_id=#{messToId} and mess_state=0")
    public Integer selectCount(Integer messToId);

    //2. 分页查询
    //根据messToId查询该用户收到的所有信件
    @Select("select cust_id,cust_photo,cust_nickname,cust_birthday,cust_marriage,cust_province,cust_height,mess_time messTime,count(mess_from_id) countMsg  from customer c join message m on c.cust_id=m.mess_from_id where mess_to_id=#{messToId} and mess_state=0 group by mess_from_id order by messTime desc  limit #{startRecord},#{pageSize}")
    List<CustMessBean> selectSendrByPage(PageModel<CustMessBean> pageModel);

    //1. 查询除去相同用户已读的总记录数
    @Select("select count(DISTINCT mess_from_id) from message where mess_to_id=#{messToId} and mess_state=1")
    public Integer selectReadCount(Integer messToId);

    //2. 分页查询
    //根据messToId查询该用户已读收到的所有信件
    @Select("select cust_id,cust_photo,cust_nickname,cust_birthday,cust_marriage,cust_province,cust_height,mess_time messTime,count(mess_from_id) countMsg  from customer c join message m on c.cust_id=m.mess_from_id where mess_to_id=#{messToId} and mess_state=1 group by mess_from_id order by messTime desc  limit #{startRecord},#{pageSize}")
    List<CustMessBean> selectSenderReadByPage(PageModel<CustMessBean> pageModel);


    //1. 查询除去相同用户已发送的总记录数
    @Select("select count(DISTINCT mess_to_id) from message where mess_from_id=#{messFromId}")
    public Integer selectSendCount(Integer messFromId);

    //2. 分页查询
    //根据messfromId查询该用户已发送的所有信件
    @Select("select cust_id,cust_photo,cust_nickname,cust_birthday,cust_marriage,cust_province,cust_height,mess_time messTime,count(mess_to_id) countMsg  from customer c join message m on c.cust_id=m.mess_to_id where mess_from_id=#{messFromId}  group by mess_to_id order by messTime desc  limit #{startRecord},#{pageSize}")
    List<CustMessBean> selectCustSendByPage(PageModel<CustMessBean> pageModel);

    //根据messToId删除该用户收到的未读消息mess_state=0;
    @Delete("delete from message where mess_to_id=#{messToId} and mess_state=0")
    int deleteAllMsgByToId(Integer messToId);

    //根据messToId删除所有已读消息mess_state=1;
    @Delete("delete from message where mess_to_id=#{messToId} and mess_state=1")
    int deleteReadByToId(Integer messToId);

    //根据messFromId删除该用户发的所有信件
    @Delete("delete from message where mess_from_id=#{messFromId}")
    int deleteByFromId(Integer messFromId);

    //获取未读信息数量
    @Select("select count(mess_id) from message where mess_to_id=#{messToId} and mess_state=0 ")
    Integer selectNotReadCount(Integer messToId);

    //设为已读
    @Update("update  message  set mess_state=1 where mess_from_id=#{messFromId} and mess_to_id=#{messToId} ")
    Integer updateRead(@Param("messFromId") Integer messFromId, @Param("messToId") Integer messToId);

    //查询双方所有的信息
    @Select("select * from message where (mess_from_id=#{messFromId} and mess_to_id=#{messToId}) or (mess_from_id=#{messToId} and mess_to_id=#{messFromId}) order by mess_time")
    List<Message> selectAllMessage(@Param("messFromId") Integer messFromId, @Param("messToId") Integer messToId);
}
