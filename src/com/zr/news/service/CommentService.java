package com.zr.news.service;

import com.zr.news.dao.CommentDao;
import com.zr.news.dao.daoImpl.CommentDaoImpl;
import com.zr.news.entity.Comment;

/**
 * @Acthor:孙琪; date:2019/3/24;
 */
public class CommentService {

    private CommentDao dao =new CommentDaoImpl();
    public int addComment(Comment comment){
        return dao.addComment(comment);

    }
}

