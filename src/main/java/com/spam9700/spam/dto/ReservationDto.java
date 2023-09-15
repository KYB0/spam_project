package com.spam9700.spam.dto;

import lombok.Data;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class ReservationDto {
    private int reservation_id;
    private String customer_id;
    private int room_id;
    private String seat_number;
    private String room_name;
    private String status;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime start_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime end_time;
    
}
