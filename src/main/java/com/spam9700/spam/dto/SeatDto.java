package com.spam9700.spam.dto;

import lombok.Data;


@Data
public class SeatDto {
    private int seat_id;
    private int room_id;
    private String seat_number;
    private boolean is_reserved;
}


