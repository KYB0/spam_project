package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spam9700.spam.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class LogController {
    
    @Autowired
    private MemberService memberService;

    @PostMapping("/i_login")
    public String iLogin(HttpServletRequest request, @RequestParam String customer_id, @RequestParam String customer_pwd){
        //로그인 처리 로직
        log.info("개인 로그인");
        log.info("id:{}, pw:{}", customer_id, customer_pwd);

        boolean result = memberService.iLogin(customer_id, customer_pwd);
        if(result){
            log.info("개인 회원 로그인 성공");

        //로그인에 성공한 경우 사용자 정보를 세션에 저장
        HttpSession session = request.getSession();
        session.setAttribute("customer_id", customer_id);

            return "redirect:/main";
        }else{
            log.info("로그인 실패");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        log.info("로그아웃");

        HttpSession session = request.getSession();
        session.invalidate(); // 세션 무효화
        log.info("세션무효화");

        return "redirect:/main"; //로그아웃 후 메인 페이지로 리다이렉트
    }

}
