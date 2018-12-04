package com.chixing;

import com.chixing.entity.Comments;
import com.chixing.service.CommentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommentsServiceTest {
    @Autowired
    private CommentService commentService;

    @Test
    public void testSelectCommentById(){
        List<Comments> list=commentService.getCommentById(1);
        for (Comments comments : list) {
            System.out.println(comments);
        }
    }

    @Test
    public void testSelectCountCommentByHappId(){
        int count=commentService.getCountCommentByHappId(1);
        System.out.println(count);
    }

    @Test
    public void testAddComment(){
        Comments comment=new Comments();
        comment.setCommContent("hhhhhhhhh");
        comment.setCustId(1);
        comment.setHappId(2);
        int rows=commentService.saveComments(comment);
        System.out.println(rows);
    }

    @Test
    public void testDeleteCommentsById(){
         int rows=commentService.deleteCommentsById(5);
        System.out.println(rows);
    }

    @Test
    public void testDeleteComments(){
        int rows=commentService.deleteComments(2);
        System.out.println(rows);
    }
}
