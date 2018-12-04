package com.chixing.service;

import com.chixing.entity.Comments;
import com.chixing.util.PageModel;

import java.util.List;

public interface CommentService {
    List<Comments> getCommentById(Integer happId);

    int getCountCommentByHappId(Integer happId);

    int saveComments(Comments comments);

    int deleteCommentsById(Integer commId);

    int deleteComments(Integer happId);

    public PageModel<Comments> getCommByPage(PageModel<Comments> page, Integer happId);
}
