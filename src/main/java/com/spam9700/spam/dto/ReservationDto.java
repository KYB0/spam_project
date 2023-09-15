package com.spam9700.spam.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReservationDto {
    private int seat_number;
    private int reservation_id;
    private String customer_id;
    private int room_id;
    private int seat_id;
    private LocalDateTime start_time;
    private LocalDateTime end_time;
}
