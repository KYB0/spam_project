package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReservationDTO {
    private Long seatId;
    private String customerName;
    private LocalDateTime reservationTime;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime startTime;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime endTime;
    private String paymentMethod;

    // 생성자, Getter 및 Setter 메서드
}
