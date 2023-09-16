package com.spam9700.spam.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatReservationDto;

import lombok.extern.slf4j.Slf4j;

@Service
public class SeatReservationService {

    // 데이터베이스 연동을 위한 DAO 클래스를 주입받습니다.
    @Autowired
    private SeatReservationDao seatReservationDao;

    public boolean isDuplicateReservation(int roomId, String seatNumber, LocalDateTime startTime, LocalDateTime endTime) {
        // 중복 예약을 확인하는 쿼리를 호출하고 결과를 받아옵니다.
        List<SeatReservationDto> reservations = seatReservationDao.findReservationsBySeatNumberAndTimeRange(roomId, seatNumber, startTime, endTime);
    
        // 조회된 예약 목록이 비어있지 않으면 중복 예약이 있음을 나타냅니다.
        return !reservations.isEmpty();
    }

    public List<String> getReservedTimes(Long roomId, String date) {
        // roomId와 date를 이용하여 예약된 시간 목록을 데이터베이스에서 조회합니다.
        List<String> reservedTimes = seatReservationDao.findReservedTimesByRoomAndDate(roomId, date);

        // 조회된 예약된 시간 목록을 반환합니다.
        return reservedTimes;
    }
    


}
