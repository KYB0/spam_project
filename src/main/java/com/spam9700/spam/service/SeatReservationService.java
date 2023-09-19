package com.spam9700.spam.service;
import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.ReservationDto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatReservationService {

    @Autowired
    private SeatReservationDao seatReservationDao;

    public void saveReservation(ReservationDto reservationDto) {
    
            seatReservationDao.saveReservation(reservationDto);
        
    }

    public String getRoomNameByRoomId(String room_id) {
        return seatReservationDao.getRoomNameByRoomId(room_id);
    }

    // 예약 생성 서비스 메서드
    public void createReservation(ReservationDto reservationDto) {
        // 여기에서 예약 관련 비즈니스 로직을 수행하고
        // ReservationDao를 사용하여 데이터베이스에 예약 정보를 저장합니다.
        seatReservationDao.insertReservation(reservationDto);
    }

    public void saveReservations(ReservationDto reservationDto) {
        seatReservationDao.saveReservation(reservationDto);
    }



}
