package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.WishListDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.WishListDto;



@Service
public class DetailPageService {
    private final DetailPageDao detailPageDao;

    @Autowired
    public DetailPageService(DetailPageDao detailPageDao){
        this.detailPageDao = detailPageDao;
    }

    @Autowired
    public WishListService wishListService;
    
    @Autowired
    public WishListDao wishListDao;

    public DetailPageDto getStudyRoomByRoomName(String room_name){
        return detailPageDao.getStudyRoomByRoomName(room_name);
    }

    public String getOpenTimeByStudyRoom(String room_name) {
        String room_description = detailPageDao.getOpenTimeByStudyRoom(room_name);
    
        // 조회한 room_description 값을 반환합니다.
        return room_description;
    }

        public List<DetailPageDto>getAllRooms(){
        return detailPageDao.getAllRooms();
    }

    public DetailPageDto getRomById(int room_id){
        return detailPageDao.getRoomById(room_id);
    }

    public List<DetailPageDto> getRoomsByCategory(int category_id){
        return detailPageDao.getRoomsByCategory(category_id);
    }

    public List<DetailPageDto> getRoomsByComapny(String company_id){
        return detailPageDao.getRoomsByCompany(company_id);
    }

    public boolean reviewInsert(ReviewDto reviewDto) {
        return detailPageDao.reviewInsert(reviewDto);
    }

    public List<DetailPageDto> getRoomsByName(String room_name) {
        return detailPageDao.getRoomsByName(room_name);
    }

    public DetailPageDto getCustomerIdByName(String customer_id) {
        return detailPageDao.getCustomerIdByName(customer_id);
    }

   

    public List<WishListDto> getRIdByRoomName(String room_name) {
        return detailPageDao.getRIdByRoomName(room_name);
    }

 
    public DetailPageDto getRoomDetailByName(String room_name) {
        // WishListService를 사용하여 WishListDto 가져오기
        WishListDto wishListDto = wishListService.getRoomIdByRoomName(room_name);

        // WishListDto를 DetailPageDto로 변환
        DetailPageDto detailPageDto = new DetailPageDto();
        // 여기에서 WishListDto의 필드 값을 DetailPageDto의 필드로 복사하거나 매핑해야 합니다.

        detailPageDto.setRoom_id(wishListDto.getRoom_id());
        detailPageDto.setRoom_name(wishListDto.getRoom_name());
        // 복사 예제:
        // detailPageDto.setRoomId(wishListDto.getRoomId());
        // detailPageDto.setRoomName(wishListDto.getRoomName());
        // ...

        return detailPageDto;
    }
    
  
}
