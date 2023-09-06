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
        if ((region == null || region.isEmpty() || region.equals("전체")) && (searchKeyword == null || searchKeyword.isEmpty())) {
            // 검색 키워드와 지역이 모두 없거나 지역이 "전체"인 경우 모든 독서실 목록을 반환
            return detailPageDao.getAllRooms();
        } else if (searchKeyword == null || searchKeyword.isEmpty()) {
            // 검색 키워드는 없지만 지역이 있는 경우 해당 지역의 독서실 목록을 반환
            return detailPageDao.getRoomsByRegion(region);
        } else if (region == null || region.isEmpty() || region.equals("전체")) {
            // 지역은 없지만 검색 키워드가 있는 경우 해당 키워드를 포함하는 독서실 목록을 반환
            return detailPageDao.getRoomsByKeyword(searchKeyword);
        } else {
            // 지역과 검색 키워드 둘 다 있는 경우 해당 지역에 위치하면서 키워드를 포함하는 독서실 목록을 반환
            return detailPageDao.getRoomsByRegionAndKeyword(region, searchKeyword);
        }
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