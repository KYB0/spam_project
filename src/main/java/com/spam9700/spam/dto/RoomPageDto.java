package com.spam9700.spam.dto;

import java.util.List;

import lombok.Data;

@Data
public class RoomPageDto {
    private List<DetailPageDto> roomDataPage;
    private int currentPage;
    private int totalPages;

        // 페이징에 필요한 새로운 필드 추가
        private int startRow;
        private int size;
}
