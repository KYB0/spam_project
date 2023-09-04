package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.SeatDao;
import com.spam9700.spam.dto.SeatDto;

@Service
public class SeatService {

    @Autowired
    private final SeatDao seatDao;

    public SeatService(SeatDao seatDao) {
        this.seatDao = seatDao;
    }

    public SeatDto getSeat(Long id) {
        // DAO를 통해 해당 좌석 정보를 데이터베이스에서 조회
        return seatDao.getSeat(id);
    }

    public List<SeatDto> getAllSeats() {
        // DAO를 통해 모든 좌석 정보를 데이터베이스에서 조회
        return seatDao.getAllSeats();
    }
}
