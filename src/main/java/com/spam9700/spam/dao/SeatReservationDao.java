package com.spam9700.spam.dao;
import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.ReservationDto;

@Mapper
public interface SeatReservationDao {

    boolean insertReservation(ReservationDto reservationDto);
    // void insertReservation(ReservationDto reservationDto);
}