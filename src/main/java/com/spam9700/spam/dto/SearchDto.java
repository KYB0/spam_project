package com.spam9700.spam.dto;

import lombok.Data;

@Data
public class SearchDto {
    private int category_id;
    private String category_name;
    private String region;

    // 독서실 검색 필드
    private String readingRoomKeyword;

}

