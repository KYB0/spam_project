package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @PostMapping("/review")
    public String review(){

    }

    @GetMapping("/i_mypage/list")
    public String mylist() {
        log.info("예약 및 리뷰내역 페이지");
        return "myList";
    }

    @GetMapping("i_mypage/myqna")
    public String qnaList() {
        log.info("나의 문의 내역 페이지");
        return "myQna";
    }

    

    
}
