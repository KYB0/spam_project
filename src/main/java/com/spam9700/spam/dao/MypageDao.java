package com.spam9700.spam.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;

@Mapper
public interface MypageDao {

    int insertReview(ReviewDto reviewDto);

    List<ReservationDto> getReservationListByCustomerId(String customer_id);

    List<ReviewDto> getReviewListByCustomerId(String customer_id);

    
}
