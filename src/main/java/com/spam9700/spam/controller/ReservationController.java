package com.spam9700.spam.controller;

import com.spam9700.spam.dto.ReservationDTO;
import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.service.ReservationService;
import com.spam9700.spam.service.SeatReservationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import java.util.List;

@Controller
public class ReservationController {
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/reservations")
    public String getAllReservations(Model model) {
        List<ReservationDTO> reservations = reservationService.getAllReservations();
        model.addAttribute("reservations", reservations);
        return "reservations"; // 예약 목록 페이지의 뷰 이름
    }

    @GetMapping("/reservations/{reservationId}")
    public String getReservation(@PathVariable Long reservationId, Model model) {
        ReservationDTO reservation = reservationService.getReservationById(reservationId);
        model.addAttribute("reservation", reservation);
        return "reservation"; // 예약 상세 정보 페이지의 뷰 이름
    }

    @PostMapping("/reservations")
    public String createReservation(@ModelAttribute ReservationDTO reservationDTO) {
        reservationService.createReservation(reservationDTO);
        return "redirect:/reservations";
    }

    @PutMapping("/reservations/{reservationId}")
    public String updateReservation(@PathVariable Long reservationId, @ModelAttribute ReservationDTO reservationDTO) {
        reservationDTO.setReservationId(reservationId);
        reservationService.updateReservation(reservationDTO);
        return "redirect:/reservations";
    }

    @DeleteMapping("/reservations/{reservationId}")
    public String deleteReservation(@PathVariable Long reservationId) {
        reservationService.deleteReservation(reservationId);
        return "redirect:/reservations";
    }
}
