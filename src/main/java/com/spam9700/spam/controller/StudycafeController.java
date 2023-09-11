package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;

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
    public String detailPage(@PathVariable("room_name") String room_name, Model model, HttpSession session) {

        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        model.addAttribute("roomDetail", roomDetail);
        log.info("roomDetail:{}", roomDetail);
        
        if (roomDetail != null) {
            // 해당 방이 존재하는 경우
            session.setAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_name", roomDetail.getRoom_name());
            model.addAttribute("room_description", roomDetail.getRoom_description());
            // 추가 데이터도 필요한 경우 모델에 추가하세요.
            return "detailPage"; // 적절한 뷰 이름을 사용하세요.
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return "redirect:/member/i_login"; // 에러 페이지로 리다이렉트
        }
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