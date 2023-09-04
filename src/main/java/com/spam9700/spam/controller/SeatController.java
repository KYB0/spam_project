package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.service.SeatService;

import java.util.List;

@RestController
@RequestMapping("/seats")
public class SeatController {

    @Autowired
    private SeatService seatService;

    @GetMapping("/{id}")
    public SeatDto getSeat(@PathVariable Long id) {
        return seatService.getSeat(id);
    }

    @GetMapping
    public List<SeatDto> getAllSeats() {
        return seatService.getAllSeats();
    }

}
