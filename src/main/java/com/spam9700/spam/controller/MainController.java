package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spam9700.spam.dto.CustomerMemberDto;
import com.spam9700.spam.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/main")
    public String mainPage() {
        log.info("메인 페이지");
        return "main";
    }

    @GetMapping("/search")
    public String search() {
        log.info("검색창");
        return "search";
    }

    @GetMapping("/qna_list")
    public String qnaboard() {
        return "qnaBoard";
    }


    @RequestMapping("/member/i_mypage")
    public String iMypage(HttpSession session, Model model) {
        log.info("마이페이지");

        // 세션에서 저장된 회원 ID 가져오기
        String customer_id = (String) session.getAttribute("customer_id");

        CustomerMemberDto customerMemberDto = memberService.getCustomerInfoById(customer_id);

        session.setAttribute("customerMemberDto", customerMemberDto);

        return "iMypage"; // 마이페이지로 이동

    }
}