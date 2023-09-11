package com.spam9700.spam.controller;

import java.util.ArrayList;
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

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/{room_name}")
public class ReservationController {

    
    @Autowired
    private StudycafeService studycafeService;
    // 기존의 상세 페이지 컨트롤러와 겹치지 않도록 별도의 URL을 사용
    @GetMapping("/reservation")
    public String reservationPage(HttpSession session, @PathVariable("room_name") String room_name, Model model) {
       
        
        // studycafeService를 이용하여 room_name을 기반으로 좌석 정보를 가져오는 service 메서드 호출
        List<SeatDto> seats = studycafeService.getSeatsByRoomName(room_name);
        //모델에 좌석 정보를 추가하여 jsp 페이지로 전달
        // for(SeatDto sd : seats){
        //     System.out.println(sd);
        // }

        List<Integer> seatNumbersList = new ArrayList<>();
        for (SeatDto seat : seats) {
            String seatNumber = seat.getSeat_number();
            String[] seatNumbers = seatNumber.split(",");
            for (String number : seatNumbers) {
                seatNumbersList.add(Integer.parseInt(number.trim()));
            }
        }
        

     
        model.addAttribute("seats", seats);
        model.addAttribute("room_name", room_name);
        model.addAttribute("seatNumbersList", seatNumbersList);

        
        
        return "seat"; // 예약 페이지 템플릿 이름 또는 경로
    }

  
}
