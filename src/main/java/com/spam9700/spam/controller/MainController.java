package com.spam9700.spam.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

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
        return "/search";
    }

    @GetMapping("/qna_list")
    public String qnaboard(){
        return "qnaBoard";
    }
}