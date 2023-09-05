package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.spam9700.spam.dto.SeatReservationDto;
import com.spam9700.spam.service.SeatReservationService;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/seat-reservations")
public class SeatReservationController {

    private final SeatReservationService seatReservationService;

    @Autowired
    public SeatReservationController(SeatReservationService seatReservationService) {
        this.seatReservationService = seatReservationService;
    }

    @GetMapping("/")
    public String listSeatReservations(Model model) {
        List<SeatReservationDto> seatReservations = seatReservationService.getAllSeatReservations();
        model.addAttribute("seatReservations", seatReservations);
        log.info("seatReservations:{}", seatReservations);
        return "seat-list";
    }

    @GetMapping("/reserve")
    public String reserveSeatPage(Model model) {
        return "reserve";
    }

    @PostMapping("/reserve")
    public String reserveSeat(@ModelAttribute SeatReservationDto seatReservationDto, Model model) {
        try {
            // Check for overlapping reservations
            if (seatReservationService.isOverlappingReservation(seatReservationDto)) {
                model.addAttribute("error", "중복 예약이 있습니다.");
                return "reserve";
            }
            seatReservationService.createSeatReservation(seatReservationDto);
            return "redirect:/seat-reservations/";
        } catch (Exception e) {
            model.addAttribute("error", "예약을 생성하는 동안 오류가 발생했습니다.");
            return "reserve";
        }
    }
}
