package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.spam9700.spam.service.SeatReservationService;

import lombok.extern.slf4j.Slf4j;

import com.spam9700.spam.dto.ReservationDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class ReservationRestController {

    @Autowired
    private SeatReservationService seatReservationService;

    @PostMapping("/checkDuplicateReservation")
    @ResponseBody
    public Map<String, Object> checkDuplicateReservation(@RequestBody ReservationDto reservationDto) {
        Map<String, Object> response = new HashMap<>();

        boolean isDuplicate = seatReservationService.isDuplicateReservation(
                reservationDto.getRoom_id(),
                reservationDto.getSeat_number(),
                reservationDto.getStart_time(),
                reservationDto.getEnd_time()

        );

        response.put("isDuplicate", isDuplicate);
        return response;
    }

    @GetMapping("/getReservedTimes")
    public List<String> getReservedTimes(
            @RequestParam Long roomId,
            @RequestParam String date) {
        // 예약된 시간 목록을 가져오는 서비스 메서드를 호출합니다.
        List<String> reservedTimes = seatReservationService.getReservedTimes(roomId, date);
        log.info("reservedTimes: {}", reservedTimes);
        // 클라이언트에게 예약된 시간 목록을 응답으로 반환합니다.
        return reservedTimes;
    }

}
