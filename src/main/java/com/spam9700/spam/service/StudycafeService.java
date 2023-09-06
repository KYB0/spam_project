package com.spam9700.spam.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.MypageDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Service   // 추가한 코드
public class StudycafeService {

    @Autowired
    private DetailPageDao detailPageDao;

       // DetailPageDao 관련 메서드
    public DetailPageDto getStudyRoomByRoomName(String room_name) {
        return detailPageDao.getStudyRoomByRoomName(room_name);
    }

    public String getOpenTimeByStudyRoom(String room_name) {
        return detailPageDao.getOpenTimeByStudyRoom(room_name);
    }

    public List<DetailPageDto> searchRooms(String region, String searchKeyword) {
        // 검색 로직 구현
        return detailPageDao.getAllRooms();
    }



    //  기존 코드
    @Autowired
    MypageDao mypageDao;

    public List<ReservationDto> getReservationListByCustomerId(String customer_id) {
        return mypageDao.getReservationListByCustomerId(customer_id);
    }

    public List<ReviewDto> getReviewListByCustomerId(String customer_id) {
        return mypageDao.getReviewListByCustomerId(customer_id);
    }

    

}