package com.spam9700.spam.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.spam9700.spam.service.MemberService;
import com.spam9700.spam.service.StudycafeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
    
    @Autowired
    private StudycafeService studycafeService;

    @GetMapping("/c_mypage")
    public String companyMypage(){
        return "companyMypage";
    }

    @GetMapping("/c_mypage/list")
    public String  cMypageList(){
        return "companyList";
    }

    @GetMapping("/c_mypage/insert")
    public String  cMypageInsert(){
        return "companyInsert";
    }

    @GetMapping("/c_mypage/resign")
    public String  cMypageResign(){
        return "companyResign";
    }   

    @GetMapping("/i_mypage/review")
    public String reviewfrm() {
        log.info("이용 후기 페이지");
        return "review";
    }

    @PostMapping("/i_mypage/review")
    public String review(@ModelAttribute("review_id") int review_id,
                         @ModelAttribute("rating") int rating,
                         @ModelAttribute("review_content") String review_content, Model model){
        log.info("이용후기 작성란");

        boolean reviewSubmitted = studycafeService.submitReview(review_id, rating, review_content);
        
        if(reviewSubmitted) {
            //리뷰가 성공적으로 저장되었을 경우의 처리
            return "redirect:/member/i_mypage";
        } else {
            //리뷰 저장에 실패한 경우의 처리
            model.addAttribute("error", "리뷰 작성이 되지 않았습니다.");
        return "review";
        }
    }


    @GetMapping("/i_mypage/list")
    public String myListfrm() {
        log.info("예약 및 리뷰내역 페이지");

        return "myList";
    }

    @PostMapping("/i_mypage/list")
    public String reservationList() {
        log.info("예약 내역");
        return "myList";
    }

    @GetMapping("/i_mypage/list/review_list")
    public String reviewListFrm() {
        log.info("리뷰 목록 페이지");
        return "show_review";
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
