package com.spam9700.boardDao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.boardDto.BFile;
import com.spam9700.boardDto.BoardDto;

@Mapper
public interface BoardDao {

    BoardDto getDetail = null;

    boolean boardWriteKey(BoardDto board);

    List<BFile> getFileList(Integer registration_date);
    
}
