package com.spam9700.spam.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.MypageDao;
import com.spam9700.spam.dao.SeatDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.QnaBoardDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.RoomPageDto;
import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.dto.WishListDto;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Service   // 추가한 코드
public class StudycafeService {

    @Autowired
    private DetailPageDao detailPageDao;

    @Autowired
    private SeatDao seatDao;
    
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



    @Autowired
    private MypageDao mypageDao;
    
    //예약 내역 리스트 불러오기
    public List<ReservationDto> getReservationListByCustomerId(String customer_id, int offset, int pageSize) {
        return mypageDao.getReservationListByCustomerId(customer_id, offset, pageSize);
    }
    // 예약 내역 페이징
     public int getTotalReservationsByCustomerId(String customer_id) {
        return mypageDao.getTotalReservationsByCustomerId(customer_id);
    }


    public List<ReviewDto> getReviewListByCustomerId(String customer_id, int offset, int pageSize) {
        return mypageDao.getReviewListByCustomerId(customer_id, offset, pageSize);
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

     //좌석 등록
    public void saveSelectedSeats(int room_id, String seat_number) {
        seatDao.saveSelectedSeats(room_id, seat_number);
    }

    //전체 좌석 조회
    public List<SeatDto> getAllSeats() {
        return seatDao.getAllSeats();
    }

    //새로운 데이터 저장 후 이전 데이터 삭제
    @Transactional
    public void deletePreviousSeatsByRoomId(int room_id) {
        seatDao.deletePreviousSeatsByRoomId(room_id);
    }

    public List<QnaBoardDto> getQnaListByUserId(String customer_id, int offset, int pageSize) {
        return mypageDao.getQnaListByUserId(customer_id, offset, pageSize);
    }

    public int getTotalReviewsByCustomerId(String customer_id) {
        return mypageDao.getTotalReviewsByCustomerId(customer_id);
    }

    public int getTotalQnaListByCustomerId(String customer_id) {
        return mypageDao.getTotalQnaListByCustomerId(customer_id);
    }

    public List<WishListDto> getWishListWithRoomNameByCustomerId(String customer_id, int offset, int pageSize) {
        return mypageDao.getWishListWithRoomNameByCustomerId(customer_id, offset, pageSize);
    }

    public int getTotalWishListByCustomerId(String customer_id) {
        return mypageDao.getTotalWishListByCustomerId(customer_id);
    }

    public int getTotalReviewsByRoomId(Integer room_id) {
        return 0;
    }

  

   

   

   






}