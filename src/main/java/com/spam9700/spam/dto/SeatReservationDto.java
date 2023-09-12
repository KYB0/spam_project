package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SeatReservationDto {
    private int reservation_id;

    private String customer_id;

    private String seat_number;

    private LocalDateTime start_time;

    private LocalDateTime end_time;
}