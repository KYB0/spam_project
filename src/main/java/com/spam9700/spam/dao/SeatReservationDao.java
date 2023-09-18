package com.spam9700.spam.dao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.ReservationDto;

@Mapper
public interface SeatReservationDao {

    boolean insertReservation(ReservationDto reservationDto);
    // void insertReservation(ReservationDto reservationDto);

    void saveReservation(ReservationDto reservationDto);

    String getRoomNameByRoomId(String room_id);

    String getCustomerById(@Param("customer_id") String customerId);
}