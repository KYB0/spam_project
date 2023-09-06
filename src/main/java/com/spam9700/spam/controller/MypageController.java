package com.spam9700.spam.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.CompanyMemberDto;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

    @Autowired
    private StudycafeService studycafeService;


    @GetMapping("/c_mypage")
    public String companyMypage() {
        return "companyMypage";
    }

    @GetMapping("/c_mypage/list")
    public String cMypageList() {
        return "companyList";
    }

    @GetMapping("/c_mypage/insert")
    public String cMypageInsert() {
        return "companyInsert";
    }


    @GetMapping("/c_mypage/insert/write")
    public ModelAndView showStudyRoomWritePage(HttpSession session) {
        // 세션에서 로그인 정보를 가져옴
        CompanyMemberDto loggedInUser = (CompanyMemberDto) session.getAttribute("loggedInUser");

        // 로그인한 사용자의 회사 아이디를 가져옴
        String companyId = loggedInUser.getCompany_id();

        // ModelAndView를 이용하여 뷰 이름과 함께 데이터 전달
        ModelAndView modelAndView = new ModelAndView("studyRoomWrite"); // studyRoomWrite는 입력 페이지의 뷰 이름
        modelAndView.addObject("companyId", companyId); // 모델에 회사 아이디를 추가
        return modelAndView;
    }

    @PostMapping("/c_mypage/insert/write")
    public String processStudyRoomWrite(@ModelAttribute DetailPageDto detailPageDto, RedirectAttributes redirectAttributes){
        try {
            studycafeService.insertRoom(detailPageDto);
            redirectAttributes.addFlashAttribute("success", true); // 입력 성공 메시지를 전달
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("success", false); // 입력 실패 메시지를 전달
        }
        return "redirect:/spam/c_mypage/insert/write";
    }

    @GetMapping("/c_mypage/resign")
    public String cMypageResign() {
        return "companyResign";
    }

    @GetMapping("/i_mypage/review")
    public String reviewfrm(Model model, HttpSession session) {

        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

        if (loggedIn != null && loggedIn) {
            //로그인 상태인 경우 리뷰 작성폼으로 이동
            log.info("이용 후기 페이지");
            return "review";
        } else {
            //로그인되지 않은 경우 로그인 페이지로 리다이렉트 또는 에러 처리
            return "redirect:member/i_login";
        }
    }

    @PostMapping("/i_mypage/review")
    public String review(ReviewDto reviewDto,
                         Model model, HttpSession session) {
        log.info("이용후기 작성란");
        
        //세션에서 customer_id 가져오기
        String customer_id = (String) session.getAttribute("customer_id");

        //ReviewDto에 customer_id 설정
        reviewDto.setCustomer_id(customer_id);

        // boolean reviewSubmitted = studycafeService.submitReview(reviewDto);/

        try {
            //리뷰가 성공적으로 저장되었을 경우의 처리
            return "redirect:/member/i_mypage";
        } catch (Exception e) {
            //리뷰 저장에 실패한 경우의 처리
            model.addAttribute("error", "리뷰 작성이 되지 않았습니다.");
            return "review";
        }
    }


    @GetMapping("/i_mypage/list")
    public String myListfrm(Model model, HttpSession session) {
        log.info("예약 내역 페이지");

        String customer_id = (String) session.getAttribute("customer_id");

        // customer_id를 이용하여 예약 리스트를 가져오는 메서드를 studycafeService에서 호출
        List<ReservationDto> reservationList = studycafeService.getReservationListByCustomerId(customer_id);

        //모델에 예약 리스트를 추가
        model.addAttribute("reservationList", reservationList);
        log.info("reservationList", reservationList);

        return "myList";
    }

    @PostMapping("/i_mypage/list")
    public String reservationList() {
        log.info("예약 내역");

        return "myList";
    }

    @GetMapping("/i_mypage/list/review_list")
    public String reviewListFrm(Model model, HttpSession session) {
        log.info("리뷰 목록 페이지");

        String customer_id = (String) session.getAttribute("customer_id");

        //customer_id를 이용하여 내가 작성한 리뷰 리스트를 가져오는 메서드를 studycafeService에서 호출
        List<ReviewDto> reviewList = studycafeService.getReviewListByCustomerId(customer_id);

        //모델에 리뷰 리스트를 추가
        model.addAttribute("reviewList", reviewList);
        log.info("reviewList", reviewList);

        return "show_review";
    }

    @PostMapping("/i_mypage/list/review_list")
    public String reviewList() {
        log.info("내가 작성한 리뷰 목록");
        return "show_review";
    }

    @GetMapping("i_mypage/myqna")
    public String qnaList() {
        log.info("나의 문의 내역 페이지");
        return "myQna";
    }

}