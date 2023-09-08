package com.spam9700.spam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.QnaBoardDao;
import com.spam9700.spam.dto.QnaBoardDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnABoardService {

    private final QnaBoardDao qnaBoardDao;

    public QnABoardService(QnaBoardDao qnaBoardDao) {
        this.qnaBoardDao = qnaBoardDao;
    }

    public List<QnaBoardDto> getAllQnaBoard() {
    log.info("서비스 - 목록");
        return qnaBoardDao.getAllQnaBoard();
    }

    public void insertQnaBoard(QnaBoardDto qnaBoardDto) {
        log.info("서비스 - 글 쓰기");
        qnaBoardDao.insertQnaBoard(qnaBoardDto);
    }
}
