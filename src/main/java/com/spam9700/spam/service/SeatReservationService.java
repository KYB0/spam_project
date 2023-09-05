package com.spam9700.spam.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.SeatReservationDto;
import com.spam9700.spam.exception.ReservationException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SeatReservationService {

    @Autowired
    private SeatReservationDao seatReservationDao;

    public SeatReservationService(SeatReservationDao seatReservationDao) {
        this.seatReservationDao = seatReservationDao;
    }

    public List<SeatReservationDto> getAllSeatReservations() {
        return seatReservationDao.getAllSeatReservations();
    }

    public void createSeatReservation(SeatReservationDto seatReservationDto) throws ReservationException {
        // 중복 예약 확인
        if (!isReservationValid(seatReservationDto)) {
            throw new ReservationException("중복 예약이 있습니다.");
        }

        seatReservationDao.createSeatReservation(seatReservationDto);
    }

    // 중복 예약 확인 메서드
    public boolean isReservationValid(SeatReservationDto newReservation) {
        List<SeatReservationDto> existingReservations = seatReservationDao.getSeatReservationsBySeatNumber(newReservation.getSeat_number());

        for (SeatReservationDto existingReservation : existingReservations) {
            LocalDateTime existingStartTime = existingReservation.getStart_time();
            LocalDateTime existingEndTime = existingReservation.getEnd_time();
            LocalDateTime newStartTime = newReservation.getStart_time();
            LocalDateTime newEndTime = newReservation.getEnd_time();

            // 새 예약의 시작 시간이 기존 예약의 종료 시간보다 이전이거나
            // 새 예약의 종료 시간이 기존 예약의 시작 시간보다 이후인 경우 중복 예약이 아닙니다.
            if (!(newEndTime.isBefore(existingStartTime) || newStartTime.isAfter(existingEndTime))) {
                return false;
            }
        }

        return true;
    }

    public boolean isOverlappingReservation(SeatReservationDto newReservation) {
        List<SeatReservationDto> existingReservations = seatReservationDao.getSeatReservationsBySeatNumber(newReservation.getSeat_number());
    
        for (SeatReservationDto existingReservation : existingReservations) {
            LocalDateTime existingStartTime = existingReservation.getStart_time();
            LocalDateTime existingEndTime = existingReservation.getEnd_time();
            LocalDateTime newStartTime = newReservation.getStart_time();
            LocalDateTime newEndTime = newReservation.getEnd_time();
    
            // 새 예약의 시작 시간이 기존 예약의 종료 시간보다 이전이거나
            // 새 예약의 종료 시간이 기존 예약의 시작 시간보다 이후인 경우 중복 예약입니다.
            if (!(newEndTime.isBefore(existingStartTime) || newStartTime.isAfter(existingEndTime))) {
                return true; // 중복 예약
            }
        }
    
        return false; // 중복 예약 없음
    }
    
}
