package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.spam9700.spam.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/main")
    public String mainPage() {
        return "main";
    }

    @GetMapping("/member/i_mypage")
    public String mypage() {
        return "mypage";
    }

    @GetMapping("/search")
    public String search() {
        return "search";
    }

    @GetMapping("/qna_list")
    public String qnaboard() {
        return "qnaBoard";
    }

    @GetMapping("/member/i_login")
    public String iLoginfrm() {
        log.info("로그인 화면");
        return "login";
    }

    @PostMapping("/member/i_login")
    public String iLogin(@RequestParam String customer_id, @RequestParam String customer_pwd) {
        log.info("개인 로그인");
        log.info("id:{}, pw:{}", customer_id, customer_pwd);
        boolean result = memberService.iLogin(customer_id, customer_pwd);
            if(result){
                log.info("개인 회원 로그인 성공");
                return "main";
            }else{
                log.info("로그인 실패");
                return "login";
            }
       
    }

    @GetMapping("/member/joinfrm")
    public String joinForm() {
        log.info("회원가입 화면");
        return "join";
    }

}