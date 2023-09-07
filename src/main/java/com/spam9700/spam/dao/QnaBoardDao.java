package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.QnaBoardDto;

@Mapper
public interface QnaBoardDao {

    public List<QnaBoardDto> getAllQnaBoard();

}
