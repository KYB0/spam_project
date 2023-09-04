package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.SeatDto;

@Mapper
public interface SeatDao {

    SeatDto getSeat(Long id);

    List<SeatDto> getAllSeats();

}
