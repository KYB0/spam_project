package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.WishListDto;

@Mapper
public interface WishListDao {
    void deleteRoomFavorite(@Param("room_id") int room_id, @Param("customer_id") String customer_id);
    void insertRoomFavorite(@Param("room_id") int room_id, @Param("customer_id") String customer_id);
    boolean isRoomFavorited(@Param("room_id") int room_id, @Param("customer_id") String customer_id);
    List<WishListDto> getIdByRoom(@Param("room_id") int room_id);
    WishListDto getRoomIdByRoom(@Param("room_id") int room_id);
    
  
}
