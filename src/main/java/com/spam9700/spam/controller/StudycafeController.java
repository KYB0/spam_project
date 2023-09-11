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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.WishListDto;
import com.spam9700.spam.service.DetailPageService;
import com.spam9700.spam.service.WishListService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudycafeController {


    @Autowired
    private DetailPageService detailPageService;



    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model, HttpSession session) {

        DetailPageDto roomDetail = (DetailPageDto) session.getAttribute("roomDetail"); // 세션에서 가져오기

    if (roomDetail == null) { // 세션에 데이터가 없는 경우에만 DB에서 가져옴
        roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        session.setAttribute("roomDetail", roomDetail); // 세션에 저장
    }

    log.info("roomDetail:{}", roomDetail);

        if (roomDetail != null) {
            // 해당 방이 존재하는 경우
            session.setAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_id", roomDetail.getRoom_id());
            model.addAttribute("room_name", roomDetail.getRoom_name());

            // 추가 데이터도 필요한 경우 모델에 추가하세요.
            return "detailPage"; // 적절한 뷰 이름을 사용하세요.
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return "redirect:/member/i_login"; // 에러 페이지로 리다이렉트
        }
    }

    @PostMapping("/wishList/{room_id}")
    @ResponseBody
    public String addToWishList(@PathVariable("room_id") int room_id, HttpSession session){
       String customer_id =  (String)  session.getAttribute("customer_id");
       if (customer_id != null && !customer_id.isEmpty()) {
        // WishlistDto 객체를 생성하여 해당 room_id와 customer_id를 설정합니다.
        WishListDto wishListDto = new WishListDto();
        wishListDto.setRoom_id(room_id);
        wishListDto.setCustomer_id(customer_id);
        
        // 이미 찜한 경우, DB에서 삭제
        if (detailPageService.isRoomInWishList(wishListDto)) {
            detailPageService.removeFromWishList(wishListDto);
            return "찜이 해제되었습니다.";
        } else {
            // 찜하지 않은 경우, DB에 추가
            detailPageService.addToWishList(wishListDto);
            return "찜이 추가되었습니다.";
        }
    } else {
        return "로그인 후 이용해주세요.";
    }
    }





}

    // @PostMapping("/{room_name}/review")
    // public ResponseEntity<Object> review(ReviewDto reviewDto, Model model) {
    //     model.addAttribute("reviewDto", reviewDto);
    //     boolean result = detailPageService.reviewInsert(reviewDto);

    //     if (result) {
    //         log.info("댓글 쓰기 성공");
    //         return "redirect:/{room_name}";
    //     }
    //     log.info("댓글 작성 실패");
    //     return null;

    // }

