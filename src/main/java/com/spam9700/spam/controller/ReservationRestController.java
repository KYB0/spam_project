package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.spam9700.spam.service.SeatReservationService;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatReservationDto;

import java.util.List;

@RestController
@RequestMapping("/api/reservations")
public class ReservationRestController {

    @Autowired
    private SeatReservationService seatReservationService;

    // 모든 좌석 예약을 가져오는 엔드포인트 정의
    @GetMapping
    public List<ReservationDto> getAllReservations() {
        // seatReservationService를 사용하여 데이터베이스에서 예약 정보를 가져옵니다.
        List<ReservationDto> reservations = seatReservationService.getAllReservations();
        return reservations;
    }

    // 새로운 좌석 예약을 생성하는 엔드포인트 정의
    @PostMapping
    public String createReservation(@RequestBody ReservationDto reservationDto) {
        // seatReservationService를 사용하여 제공된 DTO를 기반으로 새로운 예약을 생성합니다.
        boolean created = seatReservationService.createReservation(reservationDto);
        if (created) {
            return "예약이 성공적으로 생성되었습니다";
        } else {
            return "예약 생성에 실패했습니다";
        }
    }

    // 다른 엔드포인트를 정의하여 예약을 업데이트하거나 취소하는 등의 작업을 수행할 수 있습니다.

}
