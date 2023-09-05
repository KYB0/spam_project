package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{room_name}")
public class ReservationController {
    // 기존의 상세 페이지 컨트롤러와 겹치지 않도록 별도의 URL을 사용
    @GetMapping("/reservation")
    public String reservationPage(@PathVariable("room_name") String room_name, Model model) {
        // 예약 페이지 관련 로직을 여기에 추가
        
        return "seat"; // 예약 페이지 템플릿 이름 또는 경로
    }
}
