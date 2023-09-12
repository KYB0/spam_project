package com.spam9700.spam.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class RoomReservationDto {
    private Long id;
    private String customer_name;
    private LocalDate reservation_date;
    private LocalTime start_time;
    private LocalTime end_time;
}
