package com.spam9700.spam.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.service.DetailPageService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudycafeController {


    @Autowired
    private DetailPageService detailPageService;

    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model, HttpSession session) {

        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        model.addAttribute("roomDetail", roomDetail);
        log.info("roomDetail:{}", roomDetail);

        if (roomDetail != null) {
            // 해당 방이 존재하는 경우
            session.setAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_name", roomDetail.getRoom_name());
            model.addAttribute("room_description", roomDetail.getRoom_description());
            // 추가 데이터도 필요한 경우 모델에 추가하세요.
            return "detailPage"; // 적절한 뷰 이름을 사용하세요.
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return "redirect:/member/i_login"; // 에러 페이지로 리다이렉트
        }
    }


    @PostMapping("/{room_name}/review")
    @Transactional
    public ResponseEntity < Object > review(
            @PathVariable("room_name") String room_name,
            @RequestBody ReviewDto reviewDto,
            Model model, HttpSession session) {

        Integer room_id = (Integer) session.getAttribute("room_id"); // 세션에서 독서실 아이디를 가져옵니다.
        log.info("room_id:{}", room_id);

        if (room_id != null) {
            //해당 방이 존재하는 경우
            reviewDto.setRoom_id(room_id); //리뷰에 방 아이디 설정

            boolean result = detailPageService.reviewInsert(reviewDto);

            if (result) {
                // 리뷰 작성이 성공한 경우
                return ResponseEntity.ok().body("{\"success\": true}");
            } else {
                // 리뷰 작성이 실패한 경우
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"success\":false}");
            }
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"error\": \"Room not found\"}");
        }
    }
}