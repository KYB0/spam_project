package com.spam9700.spam.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// import com.spam9700.spam.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

    // @Autowired
    // private MemberService memberService;

    @GetMapping("/main")
    public String mainPage(){
        return "main";
    }

    @GetMapping("/member/i_mypage")
    public String mypage(){
        return "mypage";
    }

    @GetMapping("/search")
    public String search(){
        return "search";
    }

    @GetMapping("/qna_list")
    public String qnaboard(){
        return "qnaBoard";
    }

    @GetMapping("/member/i_login")
    public String iLoginfrm(){
        log.info("로그인 화면");
        return "login";
    }



    @GetMapping("/member/joinfrm")
    public String joinForm() {
        log.info("회원가입 화면");
        return "join";
    }

}