package com.spam9700.spam.controller;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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

  @GetMapping("/member/i_mypage")
    public String editMember(Model model, HttpSession session) {
        CustomerMemberDto member = (CustomerMemberDto) session.getAttribute("member");
        model.addAttribute("member", member);
        return "iMypage";
    }

    @PostMapping("/member/i_mypage")
    public String updateMember(@ModelAttribute("member") CustomerMemberDto updatedMember, HttpSession session) {
        CustomerMemberDto member = (CustomerMemberDto) session.getAttribute("member");
        // 업데이트 로직 수행 (예: 서비스를 통한 DB 업데이트)
        // ...

        // 세션에 업데이트된 정보 반영
        member.setCustomer_name(updatedMember.getCustomer_name());
        member.setCustomer_email(updatedMember.getCustomer_email());
        member.setCustomer_phone(updatedMember.getCustomer_phone());

        memberService.updateMember(member); //데이터베이스 업데이트 수행

        session.setAttribute("member", member); //세션에 업데이트된 정보반영

        return "redirect:/member/i_mypage";
    }
}