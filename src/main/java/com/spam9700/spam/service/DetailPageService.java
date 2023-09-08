package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dto.DetailPageDto;



@Service
public class DetailPageService {
    private final DetailPageDao detailPageDao;

    @Autowired
    public DetailPageService(DetailPageDao detailPageDao){
        this.detailPageDao = detailPageDao;
    }

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
}
