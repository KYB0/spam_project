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

    public void saveReservations(ReservationDto reservationDto) {
        seatReservationDao.insertReservations(reservationDto);
    }

    // 예약 생성 서비스 메서드
    public void createReservation(ReservationDto reservationDto) {
        // 여기에서 예약 관련 비즈니스 로직을 수행하고
        // ReservationDao를 사용하여 데이터베이스에 예약 정보를 저장합니다.
        seatReservationDao.insertReservation(reservationDto);
    }

    public boolean validateAndProcessPayment(ReservationDto reservationDto) {
        // 각각의 존재 여부 확인 및 유효성 검사를 수행합니다.
        boolean customerExists = seatReservationDao.checkCustomerExistence(reservationDto.getCustomer_id());
        boolean seatExists = seatReservationDao.checkSeatExistence(reservationDto.getSeat_number());
        boolean roomExists = seatReservationDao.checkRoomExistence(reservationDto.getRoom_id());

        // 만일 모든 조건이 충족되면 결제 처리를 수행합니다.
        if (customerExists && seatExists && roomExists) {
            // 여기에서 결제 로직을 수행합니다.
            // 결제가 성공하면 true를 반환하고, 실패하면 false를 반환합니다.
            boolean paymentSuccess = performPaymentLogic(reservationDto);

            return paymentSuccess;
        } else {
            // 존재하지 않는 고객, 좌석 또는 스터디룸이 있는 경우
            return false;
        }
    }

    private boolean performPaymentLogic(ReservationDto reservationDto) {
        try {
            // 여기에서 실제 결제 처리 로직을 수행합니다.
            // 예제에서는 성공적으로 처리한다고 가정하고, 데이터베이스에 결제 정보를 저장합니다.
            
            // 결제 정보를 데이터베이스에 저장하는 코드 (예시)
            ReservationDto ReservationDto = new ReservationDto();
            reservationDto.setCustomer_id(reservationDto.getCustomer_id());
            reservationDto.setSeat_number(reservationDto.getSeat_number());
            reservationDto.setRoom_id(reservationDto.getRoom_id());
            reservationDto.setStart_time(reservationDto.getStart_time());
            reservationDto.setEnd_time(reservationDto.getEnd_time());
            
            // PaymentRecord 객체를 데이터베이스에 저장하는 서비스 호출 (예시)
            seatReservationDao.savePaymentRecord(ReservationDto);
            
            return true; // 결제 성공으로 반환
        } catch (Exception e) {
            // 결제 처리 중 오류가 발생한 경우 여기에서 예외 처리 로직을 추가할 수 있습니다.
            // 예외 처리를 통해 실패한 경우 false를 반환하고, 로그를 기록하는 등의 조치를 취합니다.
            e.printStackTrace();
            return false; // 결제 실패로 반환
        }
    }

}
