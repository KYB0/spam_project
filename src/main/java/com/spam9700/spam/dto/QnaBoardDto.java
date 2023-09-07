package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QnaBoardDto {
    private int board_id;
    private String writer_id; // 작성자 ID
    private String writer_type; // 작성자 유형 (예: Customer 또는 Company)
    private String board_title;
    private String board_content;
    private LocalDateTime board_date;

}
