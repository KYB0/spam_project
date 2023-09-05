package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spam9700.spam.common.FileManager;
import com.spam9700.spam.dao.BoardDao;
// import com.spam9700.board.common.Paging;
import com.spam9700.spam.dto.BFile;
import com.spam9700.spam.dto.BoardDto;
import com.spam9700.spam.dto.ReviewDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {

    @Autowired
    private BoardDao bDao;

    @Autowired
    private FileManager fm;

    public boolean write(BoardDto bod, List<MultipartFile> attachments,
            HttpSession session) {
        boolean result = bDao.boardWriteKey(bod);
        if (result) {
            if (attachments.get(0).getSize() != 0) {
                if (fm.fileUpload(attachments, session, bod.getRegistration_date())) {
                    log.info("upload Ok");
                    return true; // 글쓰기+첨부파일 성공
                }
            }
        }
        return false;
    }

    public boolean Bupdate(BoardDto bod, List<MultipartFile> att, HttpSession session) {
        return false;
    }

    public BoardDto getDetail(Integer b_num) {
        return bDao.getDetail;
    }

    public List<BFile> getFileList(Integer b_num) {
        List<BFile> fList = bDao.getFileList(b_num);
        return fList;
    }

    public void boardDelete(Integer b_num, HttpSession session) {
    }

    public boolean write(BoardDto bod) {
        return false;
    }

    
}