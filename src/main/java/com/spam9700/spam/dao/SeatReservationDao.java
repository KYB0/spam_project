package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatReservationDto;

@Mapper
public interface SeatReservationDao {

    List<SeatReservationDto> getAllSeatReservations();

    void createSeatReservation(SeatReservationDto seatReservationDto);

    List<ReservationDto> getAllReservations();

    boolean createReservation(ReservationDto reservationDto);

}
