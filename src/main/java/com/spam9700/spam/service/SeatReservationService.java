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
        // 세션에서 가져온 customer_id
        String customerIdFromSession = "customer_id"; // 실제 세션에서 가져오는 코드로 대체해야 합니다.

        // 데이터베이스에서 customer_id 조회
        String customerIdFromDatabase = seatReservationDao.getCustomerById(customerIdFromSession);

        if (customerIdFromDatabase != null) {
            // customer_member 테이블에 해당 customer_id가 존재하면 예약을 수행
            reservationDto.setCustomer_id(customerIdFromSession);
            reservationDto.setStatus("1"); // 결제가 완료되었음을 나타내는 상태
            // 시작 시간과 종료 시간을 문자열에서 LocalDateTime으로 변환
            reservationDto.setStart_time(LocalDateTime.parse(startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm")));
            reservationDto.setEnd_time(LocalDateTime.parse(endTime, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm")));

            // 데이터베이스에 저장
            seatReservationService.saveReservation(reservationDto);
        } else {
            // customer_member 테이블에 해당 customer_id가 없으면 예약을 거부하거나 적절한 오류 처리를 수행
            // 여기에서 예약을 거부하거나 오류 처리를 수행하는 로직을 추가하세요.
        }
    }
    }

    public String getRoomNameByRoomId(String room_id) {
        return seatReservationDao.getRoomNameByRoomId(room_id);
    }

    // public void saveReservation(ReservationDto reservationDto) {
    //     // 필요한 로직이 있다면 여기에 추가
    //     reservationDto.setStatus("1");
    //     seatReservationDao.insertReservation(reservationDto);
    // }
}
