package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spam9700.spam.service.StudycafeService;
import com.spam9700.spam.service.DetailPageService;
import com.spam9700.spam.dto.DetailPageDto;


import java.util.List;

import lombok.extern.slf4j.Slf4j;



@Slf4j   //log.info
@Controller
public class StudycafeController {


    @Autowired
    private StudycafeService studycafeService;
    @Autowired
    private DetailPageService detailPageService;
     // 상세 페이지 뷰

    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model) {
        DetailPageDto studyRoom = detailPageService.getStudyRoomByRoomName(room_name);
        if (studyRoom != null) {
            String roomDescription = detailPageService.getOpenTimeByStudyRoom(studyRoom.getRoom_description());

            log.info("독서실 상세페이지");

            if (roomDescription != null) {
                studyRoom.setRoom_description(roomDescription);
                model.addAttribute("studyRoom", studyRoom);
            } else {
                model.addAttribute("error", "Study room description not found.");
            }
        } else {
            model.addAttribute("error", "Study room not found.");
        }
        return "detailPage";
    }

    // 검색 결과 뷰
      @GetMapping("/search")
    public String searchStudyRooms(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword,
                                   Model model) {
        List<DetailPageDto> searchResults = studycafeService.searchRooms(region, searchKeyword);
        model.addAttribute("detailPageDtos", searchResults);  // "readingRooms" 대신 "detailPageDtos"를 사용
        return "searchList";
    }

 // Ajax 요청을 처리하는 메서드
  @GetMapping("/searchRooms")
  @ResponseBody
  public List<DetailPageDto> searchRoomsAjax(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword) {
    return studycafeService.searchRooms(region, searchKeyword);
  }
}