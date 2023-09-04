package com.spam9700.spam.dto;

import lombok.Data;

import java.time.LocalTime;

@Data
public class SeatDto {
    private Long id;
    private String seatNumber;
    private boolean isReserved;
    private LocalTime startTime;
    private LocalTime endTime;

    // 생성자, Getter 및 Setter 메서드
}


