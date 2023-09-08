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
        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
    if (roomDetail != null) {
        // 해당 방이 존재하는 경우
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

    
}
