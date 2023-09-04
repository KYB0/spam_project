// package com.spam9700.spam.controller;

// import com.spam9700.spam.dto.ReservationDTO;
// import com.spam9700.spam.dto.SeatDto;
// import com.spam9700.spam.service.ReservationService;
// import com.spam9700.spam.service.SeatService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.*;

// import java.util.List;

// @Controller
// @RequestMapping("/reservation")
// public class ReservationController {

//     @Autowired
//     private SeatService seatService;

//     @Autowired
//     private ReservationService reservationService;

//     // 예약 페이지 열기
//     @GetMapping("/create")
//     public String openReservationPage(Model model) {
//         List<SeatDto> seatList = seatService.getAllSeats();
//         model.addAttribute("seatList", seatList);
//         return "res"; // 이 부분은 JSP 페이지의 이름입니다.
//     }

//     // 예약 생성 처리
//     @PostMapping("/create")
//     public String createReservation(@ModelAttribute ReservationDTO reservationDTO, Model model) {
//         // 여기에서 예약 정보를 처리하고 예약 결과를 받아옵니다.
//         ReservationDTO createdReservation = reservationService.createReservation(reservationDTO);

//         // 예약 결과를 모델에 추가
//         model.addAttribute("reservationResult", createdReservation);

//         return "reservationResultPage"; // 이 부분은 예약 결과 페이지의 이름입니다.
//     }
// }

