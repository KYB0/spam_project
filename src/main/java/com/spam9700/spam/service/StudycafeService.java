package com.spam9700.spam.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.MypageDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.RoomPageDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudycafeService {

    @Autowired
    private DetailPageDao detailPageDao;
    private SqlSessionFactory sqlSessionFactory;
    public StudycafeService(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public List<ReservationDto> getReservationListByCustomerId(String customer_id) {
        return detailPageDao.getReservationListByCustomerId(customer_id);
    }

    public List<ReviewDto> getReviewListByCustomerId(String customer_id) {
        return detailPageDao.getReviewListByCustomerId(customer_id);
    }


    // 스터디 룸 정보를 DB에 삽입하는 메서드 추가
    public int insertStudyRoom(DetailPageDto detailPageDto) {
        return detailPageDao.insertStudyRoom(detailPageDto);
    }

    public DetailPageDto getCompanyIdFromCompanyMember(String company_id) {
        return detailPageDao.getCompanyIdFromCompanyMember(company_id);
    }

    public List<DetailPageDto> getAllRooms() {
        return detailPageDao.getAllRooms();
    }

    public RoomPageDto getRoomsByPage(int page, int size) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()){
            DetailPageDao detailPageDao = sqlSession.getMapper(DetailPageDao.class);

            int offset = (page - 1) * size;
            List<DetailPageDto> roomDataPage = detailPageDao.getRoomsByPage(offset, size);
            int totalRooms = detailPageDao.getTotalRoomCount();

            int totalPages = (int) Math.ceil((double) totalRooms / size);

            RoomPageDto roomPageDto = new RoomPageDto();
            roomPageDto.setRoomDataPage(roomDataPage);
            roomPageDto.setCurrentPage(page);
            roomPageDto.setTotalPages(totalPages);

            return roomPageDto;
        }

        
    }
    

}