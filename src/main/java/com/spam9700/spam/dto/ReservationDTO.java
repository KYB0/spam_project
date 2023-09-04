package com.spam9700.spam.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReservationDto {
    private int reservationId;
    private String customerId;
    private int roomId;
    private int seatId;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}

