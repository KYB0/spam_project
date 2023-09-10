package com.spam9700.spam.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.RatingDto;
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

    // //리뷰 
    // @PostMapping("/{room_name}/addreview")
    // public ResponseEntity<String> addReview(@PathVariable String room_name, @RequestBody ReviewDto reviewDto) {
    //     detailPageService.addReview(reviewDto);
     
    //     return ResponseEntity.ok("Review added successfully");
    // }

    // @GetMapping("/{room_name}/list")
    // public List<ReviewDto> listReviews(ReviewDto reviewDto) {
    //     return detailPageService.listReviews(reviewDto);
    // }

    //별점
    // @PostMapping("/{room_name}/rate")
    // public ResponseEntity<String> rateProduct(@RequestBody RatingDto ratingDto) {
    //     detailPageService.rateProduct(ratingDto);
    //     return ResponseEntity.ok("Rating added successfully");
    // }


 

    @PostMapping(value = "/{room_name}/review", consumes = "application/x-www-form-urlencoded")
    @Transactional
    public ResponseEntity<String> review(@PathVariable("room_name") String room_name,
                                         @RequestParam("rating") int rating,
                                         @RequestParam("review_content") String review_content,
                                         @RequestParam("customer_id") String customer_id,
                                          Model model, HttpSession session) {

        // 세션에서 독서실 아이디를 가져옵니다.
        Integer room_id = (Integer) session.getAttribute("room_id");
        log.info("room_id:{}", room_id);

        // 해당 방이 존재하는 경우
        if (room_id != null) {
            // reviewDto 객체 생성
            ReviewDto reviewDto = new ReviewDto();
            reviewDto.setCustomer_id(customer_id);
            reviewDto.setRoom_id(room_id);
            reviewDto.setRating(rating);
            reviewDto.setReview_content(review_content);

            boolean result = detailPageService.reviewInsert(reviewDto);

            if (result) {
                // 리뷰 작성이 성공한 경우
                return ResponseEntity.ok("success");
            } else {
                // 리뷰 작성이 실패한 경우
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
            }
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Room not found");
        }
    }
}