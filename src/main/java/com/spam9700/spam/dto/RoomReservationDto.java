package com.spam9700.spam.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class RoomReservationDto {
    private Long id;
    private String customerName;
    private LocalDate reservationDate;
    private LocalTime startTime;
    private LocalTime endTime;
}
