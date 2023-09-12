package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.SeatDto;

@Mapper
public interface SeatDao {
    List<SeatDto> getAllSeats();

    List<SeatDto> getSeatsByRoomId(int room_id);

    SeatDto reserveSeat(int seat_id);

}
