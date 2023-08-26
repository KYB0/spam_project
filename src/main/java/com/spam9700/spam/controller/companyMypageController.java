package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class companyMypageController {
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
}
