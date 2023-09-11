package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.service.StudycafeService;

@Controller
@RequestMapping("/{room_name}")
public class ReservationController {

    @Autowired
    private StudycafeService studycafeService;
    // 기존의 상세 페이지 컨트롤러와 겹치지 않도록 별도의 URL을 사용
    @GetMapping("/reservation")
    public String reservationPage(@PathVariable("room_name") String room_name, Model model) {
        //좌석 정보를 가져오는 service 메서드 호출
        List<SeatDto> seats = studycafeService.getAllSeatsOfData();

        //모델에 좌석 정보를 추가하여 jsp 페이지로 전달
        model.addAttribute("seats", seats);
        
        return "seat"; // 예약 페이지 템플릿 이름 또는 경로
    }

   
}
