package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class SeatReservationDto {
    private int reservationId;

    private String customerId;

    private int seatId;

    private LocalDateTime startTime;

    private LocalDateTime endTime;
}