package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.SeatReservationDto;

@Service
public class SeatReservationService {

    // 데이터베이스 연동을 위한 DAO 클래스를 주입받습니다.
    private final SeatReservationDao seatReservationDao;

    @Autowired
    public SeatReservationService(SeatReservationDao seatReservationDao) {
        this.seatReservationDao = seatReservationDao;
    }

    // 모든 좌석 예약 목록 조회
    public List<SeatReservationDto> getAllSeatReservations() {
        return seatReservationDao.getAllSeatReservations();
    }

    // 좌석 예약 생성
    public void createSeatReservation(SeatReservationDto seatReservationDto) {
        seatReservationDao.createSeatReservation(seatReservationDto);
    }
}
// @Service
// public class SeatReservationService {

// @Autowired
// ReserveDao reserveDao;

// public List<SeatDto> getAllSeats() {
// return reserveDao.getAllSeats();
// }

// public boolean makeReservation(ReservationDTO reservationDTO) {
// return reserveDao.makeReservation(reservationDTO);
// }

// }
