package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.spam9700.spam.dto.DetailPageDto;

@Mapper
public interface DetailPageDao {
    DetailPageDto getStudyRoomByRoomName(@Param("room_name") String room_name);

    String getOpenTimeByStudyRoom(@Param("room_name") String room_name);



    List<DetailPageDto> getAllRooms();

    DetailPageDto getRoomById(int room_id);

    List<DetailPageDto> getRoomsByCompany(String company_id);

    List<DetailPageDto> searchRoomsByKeyword(@Param("keyword") String keyword);

     // 지역  검색
     List<DetailPageDto> getRoomsByRegion(@Param("region") String region);

     // 키워드  검색
     List<DetailPageDto> getRoomsByKeyword(@Param("keyword") String keyword);
 
     // 지역 and 키워드 검색
     List<DetailPageDto> getRoomsByRegionAndKeyword(@Param("region") String region, @Param("keyword") String keyword);
 }
