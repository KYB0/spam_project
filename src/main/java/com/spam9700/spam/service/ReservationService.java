package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.ReservationDao;
import com.spam9700.spam.dto.ReservationDTO;
import com.spam9700.spam.dto.SeatDto;

@Service
public class ReservationService {
    @Autowired
    private ReservationDao reservationDao;

    public List<ReservationDTO> getAllReservations() {
        return reservationDao.getAllReservations();
    }

    public void createReservation(ReservationDTO reservationDTO) {
        reservationDao.createReservation(reservationDTO);
    }

    public ReservationDTO getReservationById(Long reservationId) {
        return reservationDao.getReservationById(reservationId);
    }

    public void updateReservation(ReservationDTO reservationDTO) {
        reservationDao.updateReservation(reservationDTO);
    }

    public void deleteReservation(Long reservationId) {
        reservationDao.deleteReservation(reservationId);
    }
}
