package com.spam9700.spam.service;

import java.util.List;

import com.spam9700.spam.dao.CommentDao;
import com.spam9700.spam.dto.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

    private final CommentDao commentDao;

    @Autowired
    public CommentService(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    public int addComment(CommentDto commentDto) {
        return commentDao.addComment(commentDto);
    }

    public CommentDto getCommentById(int commentId) {
        return commentDao.getCommentById(commentId);
    }

    public int updateComment(CommentDto commentDto) {
        return commentDao.updateComment(commentDto);
    }

    public int deleteComment(int commentId) {
        return commentDao.deleteComment(commentId);
    }

    public List<CommentDto> getCommentsByBoardId(int boardId) {
        return commentDao.getCommentsByBoardId(boardId);
    }
}
