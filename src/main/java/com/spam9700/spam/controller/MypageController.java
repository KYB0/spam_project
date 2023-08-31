package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spam9700.spam.service.StudycafeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/i_mypage")
public class MypageController {
    
    @Autowired
    private StudycafeService studycafeService;

    @GetMapping("/review")
    public String review() {
        log.info("이용 후기 페이지");
        return "review";
    }

    @GetMapping("/list")
    public String mylist() {
        log.info("예약 및 리뷰내역 페이지");
        return "myList";
    }

    @GetMapping("/myqna")
    public String qnaList() {
        log.info("나의 문의 내역 페이지");
        return "myQna";
    }
}
