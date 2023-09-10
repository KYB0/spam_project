package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.WishListDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.WishListDto;

@Service
public class WishListService {
    
    @Autowired
    private WishListDao wishListDao;

    @Autowired
    private DetailPageDao detailPageDao;

    // 방 이름을 기반으로 스터디 룸 정보를 가져옵니다.
    public DetailPageDto getStudyRoomByRoomName(String room_name){
        return detailPageDao.getStudyRoomByRoomName(room_name);
    }


    @Transactional
    public void toggleRoomFavorite(int room_id, String customer_id) {
        if (isRoomFavorited(room_id, customer_id)){
            wishListDao.deleteRoomFavorite(room_id, customer_id);
        }else{
            wishListDao.insertRoomFavorite(room_id, customer_id);
        }
    }


    private boolean isRoomFavorited(int room_id, String customer_id) {
        return wishListDao.isRoomFavorited(room_id, customer_id);
    }


    public List<WishListDto> getIdByRoom(int room_id) {
        return wishListDao.getIdByRoom(room_id);
    }


    public WishListDto getRoomIdByRoom(int room_id) {
        return wishListDao.getRoomIdByRoom(room_id);
    }



    public DetailPageDto getCustomerIdByName(String customer_id) {
        return detailPageDao.getCustomerIdByName(customer_id);
    }


    public WishListDto getRoomIdByRoomName(String room_name) {
        WishListDto wishListDto = new WishListDto();
        wishListDto.setRoom_name(room_name);
        
        return wishListDto;
    }
 


    
}
