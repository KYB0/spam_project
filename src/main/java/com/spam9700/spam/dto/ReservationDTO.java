package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReservationDTO {
    private Long reservationId;
    private String customerId;
    private int seatNumber;
    private LocalDateTime reservationTime;

}

