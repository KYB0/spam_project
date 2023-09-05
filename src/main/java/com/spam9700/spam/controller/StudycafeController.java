package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.service.DetailPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudycafeController {


    @Autowired
    private DetailPageService detailPageService;

    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model){
        DetailPageDto studyRoom = detailPageService.getStudyRoomByRoomName(room_name);
        
        if (studyRoom != null) {
            String roomDescription = detailPageService.getOpenTimeByStudyRoom(studyRoom.getRoom_description());

            log.info("독서실 상세페이지");

            if (roomDescription != null) {
                studyRoom.setRoom_description(roomDescription);
                model.addAttribute("studyRoom", studyRoom);
            } else {
                // roomDescription이 null인 경우에 대한 처리
                model.addAttribute("error", "Study room description not found.");
            }
        } else {
            // studyRoom이 null인 경우에 대한 처리
            model.addAttribute("error", "Study room not found.");
        }
        return "detailPage";
    }

    
}
