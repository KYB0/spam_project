package com.spam9700.spam.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.service.SeatReservationService;
import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/{room_name}")
public class ReservationController {

    @Autowired
    private StudycafeService studycafeService;

    @Autowired
    private SeatReservationService seatReservationService;

    // 기존의 상세 페이지 컨트롤러와 겹치지 않도록 별도의 URL을 사용
    @GetMapping("/reservation")
    public String reservationPage(HttpSession session, @PathVariable("room_name") String room_name, Model model) {

        // studycafeService를 이용하여 room_name을 기반으로 좌석 정보를 가져오는 service 메서드 호출
        List<SeatDto> seats = studycafeService.getSeatsByRoomName(room_name);
        // 모델에 좌석 정보를 추가하여 jsp 페이지로 전달
        // for(SeatDto sd : seats){
        // System.out.println(sd);
        // }

        List<Integer> seatNumbersList = new ArrayList<>();
        String seatNumber = null;
        String[] seatNumbers = null;
        for (SeatDto seat : seats) {
            seatNumber = seat.getSeat_number();
            seatNumbers = seatNumber.split(",");

            for (String number : seatNumbers) {
                try {
                    int parsedNumber = Integer.parseInt(number.trim());
                    seatNumbersList.add(parsedNumber);
                    // System.out.println("Extracted number: " + parsedNumber); // 숫자가 올바르게 추출되었을 때
                    // 출력
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number format: " + number); // 숫자로 변환할 수 없는 경우 오류 메시지 출력
                }
            }
        }

        model.addAttribute("seats", seats);
        model.addAttribute("room_name", room_name);
        // model.addAttribute("seatNumber", seatNumber);
        model.addAttribute("seatNumbersList", seatNumbersList);

        return "seat"; // 예약 페이지 템플릿 이름 또는 경로
    }

    // 방 ID를 세션에서 가져오는 메서드
    private int getRoomIdFromSession(HttpSession session) {
        // 세션에서 방 ID를 가져오는 로직을 구현해야 합니다.
        // 세션에서 "room_id" 속성을 가져오도록 변경합니다.
        Object roomIdObj = session.getAttribute("room_id");
        if (roomIdObj != null && roomIdObj instanceof Integer) {
            return (Integer) roomIdObj;
        }
        // 세션에서 "room_id" 속성을 찾을 수 없는 경우 예외 처리 또는 기본값 반환
        return 1; // 기본값으로 1을 반환합니다. 수정이 필요한 경우 예외 처리 등을 수행하세요.
    }

    // 고객 ID를 세션에서 가져오는 메서드
    private String getCustomerIdFromSession(HttpSession session) {
        // 세션에서 고객 ID를 가져오는 로직을 구현해야 합니다.
        // 세션에서 "customer_id" 속성을 가져오도록 변경합니다.
        Object customerIdObj = session.getAttribute("customer_id");
        if (customerIdObj != null && customerIdObj instanceof String) {
            return (String) customerIdObj;
        }
        // 세션에서 "customer_id" 속성을 찾을 수 없는 경우 예외 처리 또는 기본값 반환
        return "default_customer_id"; // 기본값으로 "default_customer_id"를 반환합니다. 수정이 필요한 경우 예외 처리 등을 수행하세요.
    }

    // 예약 폼 제출 처리
    @PostMapping("/reservation")
    public String submitReservation(@PathVariable("room_name") String room_name,
            @RequestParam("seat_number") String seatNumber,
            @RequestParam("start_time") String startTimeStr,
            @RequestParam("end_time") String endTimeStr,
            HttpSession session, Model model) {

        // 여기서 폼 데이터를 이용하여 ReservationDto를 생성합니다.
        // ReservationDto reservationDto = new ReservationDto();
        // reservationDto.setCustomer_id(getCustomerIdFromSession(session)); // 세션에서 고객 ID 가져오도록 변경
        // reservationDto.setSeat_number(seatNumber);
        // reservationDto.setRoom_id(getRoomIdFromSession(session)); // 세션에서 방 ID 가져오도록 변경
        // reservationDto.setStatus("0"); // 상태 설정 (예: 'ACTIVE', 'CANCELLED' 등)
        
        session.setAttribute("seatNumber", seatNumber);
        session.setAttribute("startTime", startTimeStr);
        session.setAttribute("endTime", endTimeStr);
        


        // 문자열로 받은 날짜와 시간을 LocalDateTime으로 변환
        // 문자열로 받은 날짜와 시간을 LocalDateTime으로 변환
        LocalDateTime startTime = LocalDateTime.parse(startTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm"));
        LocalDateTime endTime = LocalDateTime.parse(endTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm"));
        // reservationDto.setStart_time(startTime);
        // reservationDto.setEnd_time(endTime);
                session.setAttribute("endTime", endTime);
                session.setAttribute("startTime", startTime);

        log.info("Received reservation submission for room '{}'", room_name);
        log.info("Customer ID: {}", getCustomerIdFromSession(session)); // 세션에서 가져오도록 변경
        log.info("Seat Number: {}", seatNumber);
        log.info("Start Time: {}", startTimeStr);
        log.info("End Time: {}", endTimeStr);

        // 예약 정보를 모델에 추가
        model.addAttribute("room_name", room_name);
        model.addAttribute("seatNumber", seatNumber);
        model.addAttribute("startTime", startTimeStr);
        model.addAttribute("endTime", endTimeStr);
        

    
        // 이제 이 예약 정보를 임시로 저장하거나 처리할 수 있습니다.

        // 예약 정보를 임시로 저장하고, 예약 목록 페이지로 리다이렉트 또는 다른 작업 수행
        // 저장 방법에 따라 예를 들면 데이터베이스에 저장하거나 세션에 저장할 수 있습니다.

        // return "redirect:/" + roomName + "/reservation";
                return "payment";
    }       

    
    
    @GetMapping("/getRoomName")
    public String getRoomName(String room_id, Model model) {
        String roomName = seatReservationService.getRoomNameByRoomId(room_id);
        model.addAttribute("room_name", room_name);
        return "yourViewName"; // 적절한 뷰 이름으로 변경
    }

    // 결제 완료 처리
    @PostMapping("/payment")
    public String processPayment(@PathVariable String room_name,
            @RequestParam("room_id") int roomId,
            @RequestParam("seatNumber") String seatNumber,
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime) {

        // 폼 데이터를 이용하여 데이터베이스에 데이터 저장
        ReservationDto reservationDto = new ReservationDto();
        reservationDto.setCustomer_id("customer_id"); // 고객 ID 설정 (세션에서 가져오거나 임시로 설정)
        reservationDto.setSeat_number(seatNumber);
        reservationDto.setRoom_id(roomId);
        reservationDto.setStatus("1"); // 결제가 완료되었음을 나타내는 상태
        // 시작 시간과 종료 시간을 문자열에서 LocalDateTime으로 변환
        reservationDto.setStart_time(LocalDateTime.parse(startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm")));
        reservationDto.setEnd_time(LocalDateTime.parse(endTime, DateTimeFormatter.ofPattern("yyyy-MM-dd H:mm")));

        // 데이터베이스에 저장
        seatReservationService.saveReservation(reservationDto);

        return "redirect:/main"; // 결제가 성공적으로 완료되면 메인 페이지로 리다이렉트
    }
}       