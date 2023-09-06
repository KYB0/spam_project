package com.spam9700.spam.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

    @Autowired
    private StudycafeService studycafeService;


    @GetMapping("/c_mypage")
    public String companyMypage() {
        return "companyMypage";
    }

    @GetMapping("/c_mypage/list")
    public String cMypageList() {
        return "companyList";
    }

    @GetMapping("/c_mypage/insert")
    public String cMypageInsert() {
        return "companyInsert";
    }

    @GetMapping("/c_mypage/resign")
    public String cMypageResign() {
        return "companyResign";
    }

    @GetMapping("/i_mypage/list")
    public String myListfrm(Model model, HttpSession session) {
        log.info("예약 내역 페이지");

        String customer_id = (String) session.getAttribute("customer_id");

        // customer_id를 이용하여 예약 리스트를 가져오는 메서드를 studycafeService에서 호출
        List<ReservationDto> reservationList = studycafeService.getReservationListByCustomerId(customer_id);

        //모델에 예약 리스트를 추가
        model.addAttribute("reservationList", reservationList);
        log.info("reservationList", reservationList);

        return "myList";
    }

    @PostMapping("/i_mypage/list")
    public String reservationList() {
        log.info("예약 내역");

        return "myList";
    }

    @GetMapping("/i_mypage/list/review_list")
    public String reviewListFrm(Model model, HttpSession session) {
        log.info("리뷰 목록 페이지");

        String customer_id = (String) session.getAttribute("customer_id");

        //customer_id를 이용하여 내가 작성한 리뷰 리스트를 가져오는 메서드를 studycafeService에서 호출
        List<ReviewDto> reviewList = studycafeService.getReviewListByCustomerId(customer_id);

        //모델에 리뷰 리스트를 추가
        model.addAttribute("reviewList", reviewList);
        log.info("reviewList", reviewList);

        return "show_review";
    }

    @GetMapping("/i_mypage/list/like_list")
    public String likeList() { 
        log.info("찜 목록 페이지");
        return "likeList";
    }

    @PostMapping("/i_mypage/list/review_list")
    public String reviewList() {
        log.info("내가 작성한 리뷰 목록");
        return "show_review";
    }

    @GetMapping("i_mypage/myqna")
    public String qnaList() {
        log.info("나의 문의 내역 페이지");
        return "myQna";
    }

}