package com.chixing.service.impl;

import com.chixing.dao.CommentDao;
import com.chixing.entity.Comments;
import com.chixing.service.CommentService;
import com.chixing.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comments> getCommentById(Integer happId) {
        return commentDao.selectCommentById(happId);
    }

    @Override
    public int getCountCommentByHappId(Integer happId) {
        return commentDao.selectCountCommentByHappId(happId);
    }

    @Override
    public int saveComments(Comments comments) {
        return commentDao.addComments(comments);
    }

    @Override
    public int deleteCommentsById(Integer commId) {
        return commentDao.deleteCommentsById(commId);
    }

    @Override
    public int deleteComments(Integer happId) {
        return commentDao.deleteComments(happId);
    }

    @Override
    public PageModel<Comments> getCommByPage(PageModel<Comments> page, Integer happId) {
        List<Comments> commentsList = this.commentDao.selectCommByPage(page,happId);
        page.setModelList(commentsList);
        return page;
    }
}
