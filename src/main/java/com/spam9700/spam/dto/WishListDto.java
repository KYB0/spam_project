package com.spam9700.spam.dto;

import java.util.List;

import lombok.Data;

@Data
public class WishListDto {
    private List<DetailPageDto> roomDataPage;
    private int wishlist_id;
    private String customer_id;
    private int room_id;
    private String room_name;

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }
}
