package com.spam9700.spam.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatReservationDto;

@Mapper
public interface SeatReservationDao {

    List<SeatReservationDto> findReservationsBySeatNumberAndTimeRange(int roomId, String seatNumber, LocalDateTime startTime,
            LocalDateTime endTime);

    List<String> findReservedTimesByRoomAndDate(Long roomId, String date);

}
