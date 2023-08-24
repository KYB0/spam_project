package com.spam9700.spam.controller;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TimeSlotReservation {
    private int reservationId;
    private int seatId;
    private LocalDateTime startTime;
    private LocalDateTime endTime;

}
