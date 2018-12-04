package com.chixing.controller;

import com.chixing.entity.Activity;
import com.chixing.entity.Comments;
import com.chixing.service.CommentService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.xml.stream.events.Comment;
import java.util.Date;

@RestController
@RequestMapping("/comments")
public class CommentController {
    public CommentController(){
        System.out.println("CommentController constructor....");
    }
    @Autowired
    private CommentService commentService;

    @GetMapping("getCommByPage")
    public PageModel<Comments> getCommByPage (Integer pagecode,Integer happId){
        PageModel<Comments> page = new PageModel<Comments>();
        System.out.println("pagecode = " + pagecode);
        if (pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else {
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.commentService.getCountCommentByHappId(happId));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() : page.getTotalRecord()/page.getPageSize()+1);
        page.setStartRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        page = this.commentService.getCommByPage(page,happId);
        return page;
    }
    @GetMapping("getCommByPage/page/{page}/{hppdId}")
    public PageModel<Comments> pageByPage(@PathVariable Integer page, @PathVariable Integer hppdId){
        System.out.println("pageByPage#$%^&*()" + page);
        return getCommByPage(page,hppdId);
    }

    //添加评论
    @PostMapping("saveComments")
    public int saveComments(Comments comments){
        comments.setCommTime(new Date());
        int result = this.commentService.saveComments(comments);
        System.out.println("@#$%^&*(*&^%$#$%^&*((*&^comments = " + comments);
        return result;
    }
}
