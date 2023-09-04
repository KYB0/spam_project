package com.spam9700.spam.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.spam9700.spam.dto.SeatReservationDto;
import com.spam9700.spam.service.SeatReservationService;

import java.util.List;

@Controller
@RequestMapping("/seat-reservations")
public class SeatReservationController {

    private final SeatReservationService seatReservationService;

    @Autowired
    public SeatReservationController(SeatReservationService seatReservationService) {
        this.seatReservationService = seatReservationService;
    }

    // 좌석 예약 목록 조회
    @GetMapping("/")
    public String listSeatReservations(Model model) {
        List<SeatReservationDto> seatReservations = seatReservationService.getAllSeatReservations();
        model.addAttribute("seatReservations", seatReservations);
        return "seat_reservation/list"; // 뷰 이름 반환 (templates/seat_reservation/list.jsp와 연결됨)
    }

    // 좌석 예약 페이지로 이동
    @GetMapping("/reserve")
    public String reserveSeatPage(Model model) {
        return "reserve"; // 뷰 이름 반환 (templates/seat_reservation/reserve.jsp와 연결됨)
    }

    // 좌석 예약 생성 처리
    @PostMapping("/reserve")
    public String reserveSeat(@ModelAttribute SeatReservationDto seatReservationDto) {
        seatReservationService.createSeatReservation(seatReservationDto);
        return "redirect:/seat-reservations/"; // 예약 후 목록 페이지로 리다이렉트
    }
}
