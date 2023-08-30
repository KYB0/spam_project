package com.spam9700.spam.service;

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

    public String detailPageById(String room_name) {
        return null;
    }


}
