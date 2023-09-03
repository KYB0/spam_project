package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.ReserveDao;
import com.spam9700.spam.dto.ReservationDTO;
import com.spam9700.spam.dto.SeatDto;

@Service
public class SeatReservationService {

    @Autowired
    ReserveDao reserveDao;

    public List<SeatDto> getAllSeats() {
        return reserveDao.getAllSeats();
    }

    public boolean makeReservation(ReservationDTO reservationDTO) {
        return reserveDao.makeReservation(reservationDTO);
    }

}
