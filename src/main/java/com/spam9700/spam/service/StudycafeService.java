package com.spam9700.spam.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.MypageDao;
import com.spam9700.spam.dao.SeatDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.RoomPageDto;
import com.spam9700.spam.dto.SeatDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudycafeService {

    @Autowired
    private DetailPageDao detailPageDao;
    private SeatDao seatDao;
    

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




    public RoomPageDto getRoomsByPage(int page, int pageSize, String company_id) {
        RoomPageDto roomPageDto = new RoomPageDto();

        int offset = (page - 1) * pageSize;
        List<DetailPageDto> roomDataPage = detailPageDao.getRoomsByCompanyId(company_id, offset, pageSize);
        int totalRooms = detailPageDao.getTotalRoomCountByCompanyId(company_id);

        int totalPages = (int) Math.ceil((double) totalRooms/pageSize);

        roomPageDto.setRoomDataPage(roomDataPage);
        roomPageDto.setCurrentPage(page);
        roomPageDto.setTotalPages(totalPages);

        return roomPageDto;
        }

        
    

    public List<DetailPageDto> getAllRoomsByCompanyId(String company_id) {
        return detailPageDao.getAllRoomsByCompanyId(company_id);
    }

    public List<DetailPageDto> getPaginatedRooms(int page, int pageSize, String company_id) {
       int startIdx = (page -1)*pageSize;
        return detailPageDao.getPaginatedRooms(startIdx, pageSize, company_id);
    }

    public int getTotalRoomsCount(String company_id) {
        return detailPageDao.getTotalRoomsCount(company_id);
    }


    //기업고객 좌석 등록
    public List<SeatDto> getAllSeats() {
        return seatDao.getAllSeats();
    }
    //기업고객 좌석 등록    
    public void insertSeats(int roomId, List<String> selectedSeats) {
       // room_id와 선택한 좌석 정보를 이용하여 DB에 삽입
    List<SeatDto> seatDtos = new ArrayList<>();
    for (String seatNumber : selectedSeats) {
        SeatDto seatDto = new SeatDto();
        seatDto.setRoom_id(roomId);
        seatDto.setSeat_number(seatNumber);
        seatDtos.add(seatDto);
    }
    seatDao.insertSeats(seatDtos);
    }
    


}