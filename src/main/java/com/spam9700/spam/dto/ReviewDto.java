package com.spam9700.spam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
    
    private int review_id;
    private String review_content;
    private int rating;
    private String customer_id;
    private int room_id;
}
