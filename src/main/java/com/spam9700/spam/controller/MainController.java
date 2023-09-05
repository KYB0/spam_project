package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.CustomerMemberDto;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.service.DetailPageService;
import com.spam9700.spam.service.MemberService;

import jakarta.servlet.http.HttpSession;
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
    
        if (studyRoom != null) {
            String roomDescription = detailPageService.getOpenTimeByStudyRoom(studyRoom.getRoom_description());
            if (roomDescription != null) {
                studyRoom.setRoom_description(roomDescription);
                model.addAttribute("studyRoom", studyRoom);
            } else {
                // roomDescription이 null인 경우에 대한 처리
                model.addAttribute("error", "Study room description not found.");
            }
        } else {
            // studyRoom이 null인 경우에 대한 처리
            model.addAttribute("error", "Study room not found.");
        }
    
    
        return "detailPage";
    }

    


    @GetMapping("/qna_list")
    public String qnaboard() {
        return "qnaBoard";
    }

    @GetMapping("/member/i_mypage")
    public String iMypage(HttpSession session, Model model) {
        log.info("get 마이페이지");
        
        // 세션에서 저장된 회원 ID 가져오기
        String customer_id = (String) session.getAttribute("customer_id");

        CustomerMemberDto customerMemberDto = memberService.getCustomerInfoById(customer_id);
        session.setAttribute("customerMemberDto", customerMemberDto);
        model.addAttribute("customerMemberDto", customerMemberDto);

        return "iMypage";
    }

    @PostMapping("/member/i_mypage")
    public String updateMypage(CustomerMemberDto customerMemberDto, HttpSession session){
        log.info("customerMemberDto:{}", customerMemberDto);

        boolean result = memberService.updateMypage(customerMemberDto);
        if(result){
            log.info("업데이트 성공");
            return "redirect:/member/i_mypage";
        }
        log.info("업데이트 실패");
        return "redirect:/member/i_mypage";
    }

}