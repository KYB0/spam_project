package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.CustomerMemberDto;
import com.spam9700.spam.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class CustomerController {

    @Autowired
    private final MemberService memberService;

    @GetMapping("/join")
    public String joinForm() {
        log.info("회원가입 화면");
        return "join";
    }

    @PostMapping("/join")
    public String join(CustomerMemberDto customerMemberDto, Model model, RedirectAttributes rttr) {
        model.addAttribute("cusmb", customerMemberDto);
        log.info("회원가입 처리");
        log.info("customerMemberDto:{}", customerMemberDto);
        boolean result = memberService.join(customerMemberDto);
        if (result) {
            model.addAttribute("msg", "가입성공");
            rttr.addFlashAttribute("msg", "가입성공");
            return "redirect:/member/login";
        } else {
            model.addAttribute("msg", "가입실패");
            return "join";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        log.info("로그인 화면");
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String customer_id, @RequestParam String customer_pwd) {
        log.info("로그인 처리");
        log.info("id:{}, pwd:{}", customer_id, customer_pwd);
        boolean result = memberService.login(customer_id, customer_pwd);
        if (result) {
            log.info("로그인 성공");
            return "home";
        } else {
            log.info("로그인 실패");
            return "login";
        }
    }

    @GetMapping("/check/id")
    public ResponseEntity<String> checkId(@RequestParam String customer_id) {
        boolean idCheck = memberService.idCheck(customer_id);

        if (idCheck) {
            return ResponseEntity.ok("exists");
        } else {
            return ResponseEntity.ok("available");
        }
    }

    @GetMapping("/find/id")
    public String findIdForm() {
        return "findId"; // 아이디 찾기 뷰 페이지 이름
    }

    @PostMapping("/find/id")
    public String findId(@RequestParam String customer_name, @RequestParam String customer_email, Model model) {
        List<String> foundId = memberService.findId(customer_name, customer_email);

        if (foundId != null) {
            model.addAttribute("foundId", foundId);
        } else {
            model.addAttribute("notFound", true);
        }
        return "findIdResult"; // 아이디 찾기 결과를 보여주는 뷰 페이지 이름
    }

    @GetMapping("/find/pwd")
    public String findPwdForm() {
        return "findPwd"; 
    }

    @PostMapping("/find/pwd")
    public String findPwd(@RequestParam String customer_id, @RequestParam String customer_email, Model model) {
        String foundPwd = memberService.findPwd(customer_id, customer_email);

        if (foundPwd != null) {
            model.addAttribute("foundPwd", foundPwd);
        } else {
            model.addAttribute("notFound", true);
        }
        return "findPwdResult";
    }
}
