package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.ReservationDTO;

@Mapper
public interface ReservationDao {

    List<ReservationDTO> getAllReservations();

    void createReservation(ReservationDTO reservationDTO);

    ReservationDTO getReservationById(Long reservationId);

    void updateReservation(ReservationDTO reservationDTO);

    void deleteReservation(Long reservationId);
}
