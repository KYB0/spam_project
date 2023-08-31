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

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private final MemberService memberService;

    @GetMapping("/joinfrm")
    public String joinForm() {
        log.info("회원가입 선택 화면");
        return "joinFrm";
    }

    @GetMapping("/i_join")
    public String iJoinForm() {
        log.info("개인 회원가입 화면");
        return "i_join";
    }

    @GetMapping("/c_join")
    public String cJoinForm() {
        log.info("기업 회원가입 화면");
        return "c_join";
    }

    @PostMapping("/i_join")
    public String join(CustomerMemberDto customerMemberDto, Model model, RedirectAttributes rttr) {
        model.addAttribute("cusmb", customerMemberDto);
        log.info("회원가입 처리");
        log.info("customerMemberDto:{}", customerMemberDto);
        boolean result = memberService.join(customerMemberDto);
        if (result) {
            model.addAttribute("msg", "가입성공");
            rttr.addFlashAttribute("msg", "가입성공");
            return "redirect:/member/i_login";
        } else {
            model.addAttribute("msg", "가입실패");
            return "i_join";
        }
    }

    @GetMapping("/i_login")
    public String iLoginForm() {
        log.info("개인로그인 화면");
        return "i_login";
    }

    @GetMapping("/c_login")
    public String cLoginForm() {
        log.info("기업로그인 화면");
        return "c_login";
    }

    @PostMapping("/i_login")
    public String iLogin(@RequestParam String customer_id, @RequestParam String customer_pwd, HttpSession session) {
        log.info("개인로그인 처리");
        log.info("id:{}, pwd:{}", customer_id, customer_pwd);
        boolean result = memberService.iLogin(customer_id, customer_pwd);
        if (result) {
            log.info("개인로그인 성공");
            session.setAttribute("customer_id", customer_id);
            return "redirect:/main"; // 로그인 성공 시 홈 화면으로 이동
        } else {
            log.info("로그인 실패");
            return "i_login";
        }
    }

    @PostMapping("/c_login")
    public String cLogin(@RequestParam String company_id, @RequestParam String company_pwd,
            @RequestParam String company_businessnum) {
        log.info("기업로그인 처리");
        log.info("id:{}, pwd:{}, businessnum:{}", company_id, company_pwd, company_businessnum);
        boolean result = memberService.cLogin(company_id, company_pwd, company_businessnum);
        if (result) {
            log.info("기업로그인 성공");
            return "redirect:/";
        } else {
            log.info("로그인 실패");
            return "c_login";
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

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // Remove the loggedInUser attribute from the session
        session.removeAttribute("customer_id");
        return "redirect:/main"; // 로그아웃 후 홈 화면으로 이동
    }

    @GetMapping("/res")
    public String tert() {
        return "res";
    }

}
