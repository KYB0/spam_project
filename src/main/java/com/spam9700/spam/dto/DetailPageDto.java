package com.spam9700.spam.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailPageDto {
    private int room_id;
    private String company_id;
    private String room_name;
    private String room_description;
    private int time_price;
    private int day_price;
    private String region;
}
