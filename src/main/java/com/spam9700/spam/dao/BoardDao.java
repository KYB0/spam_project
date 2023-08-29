package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.BFile;
import com.spam9700.spam.dto.BoardDto;

@Mapper
public interface BoardDao {

    BoardDto getDetail = null;

    boolean boardWriteKey(BoardDto board);

    List<BFile> getFileList(Integer registration_date);
    
}
