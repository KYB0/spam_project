package com.spam9700.spam.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SeatReservationDto {
    private int reservation_id;
    private String customer_id;
    private String seat_number;
    private Date start_time;
    private Date end_time;
    private int room_id;
    private String status;
}