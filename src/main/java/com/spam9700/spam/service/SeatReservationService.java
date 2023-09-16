package com.spam9700.spam.service;
import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.ReservationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatReservationService {

    @Autowired
    private SeatReservationDao seatReservationDao;

    public boolean saveReservation(ReservationDto reservationDto) {
        return seatReservationDao.insertReservation(reservationDto);
    }

    // public void saveReservation(ReservationDto reservationDto) {
    //     // 필요한 로직이 있다면 여기에 추가
    //     reservationDto.setStatus("1");
    //     seatReservationDao.insertReservation(reservationDto);
    // }
}
