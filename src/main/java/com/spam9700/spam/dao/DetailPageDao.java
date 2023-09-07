﻿package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;

@Mapper
public interface DetailPageDao {
    DetailPageDto getStudyRoomByRoomName(@Param("room_name") String room_name);

    String getOpenTimeByStudyRoom(@Param("room_name") String room_name);



    DetailPageDto getRoomById(int room_id);

    List<DetailPageDto> getRoomsByCategory(int category_id);

    List<DetailPageDto> getRoomsByCompany(String company_id);

    // 스터디 룸 정보를 DB에 삽입하는 메서드 추가
    int insertStudyRoom(DetailPageDto detailPageDto);

    List<ReservationDto> getReservationListByCustomerId(String customer_id);

    List<ReviewDto> getReviewListByCustomerId(String customer_id);

    // company_id 가져오기
    DetailPageDto getCompanyIdFromCompanyMember(String company_id);



    List<DetailPageDto> getAllRooms();

    List<DetailPageDto> getRoomsByPage(int offset, int limit);
    int getTotalRoomCount();

}