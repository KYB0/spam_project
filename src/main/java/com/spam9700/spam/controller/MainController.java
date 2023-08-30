package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.service.DetailPageService;
import com.spam9700.spam.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

    @Autowired
    private MemberService memberService;

    MainController(DetailPageService detailPageService) {
        this.detailPageService = detailPageService;
    }

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

    @Autowired
    private DetailPageService detailPageService;

    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model){
       DetailPageDto studyRoom = detailPageService.getStudyRoomByRoomName(room_name);
       model.addAttribute("studyRoom", studyRoom);
        return "detailPage";
    }

    @GetMapping("/qna_list")
    public String qnaboard() {
        return "qnaBoard";
    }

    @RequestMapping("/member/i_mypage")
    public String iMypage(Model model) {
        return "iMypage";
    }

    @RequestMapping("/member/c_mypage")
    public String cMypage(Model model) {
        return "cMypage";
    }
}