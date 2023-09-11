package com.spam9700.spam.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.RatingDto;
import com.spam9700.spam.dto.ReviewDto;


import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;

import com.spam9700.spam.service.DetailPageService;


import com.spam9700.spam.dto.WishListDto;

import com.spam9700.spam.service.WishListService;


import lombok.extern.slf4j.Slf4j;



@Slf4j   //log.info
@Controller
public class StudycafeController {

    @Autowired
    private StudycafeService studycafeService;
    @Autowired
    private DetailPageService detailPageService;
     // 상세 페이지 뷰

   



    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model, HttpSession session) {

        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        model.addAttribute("roomDetail", roomDetail);
        log.info("roomDetail:{}", roomDetail);
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
       // Session에서 customer_id 가져오기
       String customer_id = (String) session.getAttribute("customer_id");
        
       // customer_id가 null이면 로그인 안한 상태
       if (customer_id == null) {
           return "로그인 후 이용해주세요.";
       }

       // WishListDto 객체를 생성하여 room_id와 customer_id 설정
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
   }


    @GetMapping("/checkWishList/{room_id}")
    @ResponseBody
    public ResponseEntity<Boolean> checkWishList(@PathVariable("room_id") int room_id, HttpSession session) {
        String customer_id = (String) session.getAttribute("customer_id");

        if (customer_id != null && !customer_id.isEmpty()) {
            // WishlistDto 객체를 생성하여 해당 room_id와 customer_id를 설정합니다.
            WishListDto wishListDto = new WishListDto();
            wishListDto.setRoom_id(room_id);
            wishListDto.setCustomer_id(customer_id);

            // 이미 찜한 경우, true를 응답
            if (detailPageService.isRoomInWishList(wishListDto)) {
                return ResponseEntity.status(HttpStatus.OK).body(true);
            }
        }

        // 찜하지 않은 경우 또는 로그인하지 않은 경우, false를 응답
        return ResponseEntity.status(HttpStatus.OK).body(false);
    }







    // 검색 결과 뷰
      @GetMapping("/search")
    public String searchStudyRooms(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword,
                                   Model model) {
        List<DetailPageDto> searchResults = studycafeService.searchRooms(region, searchKeyword);
        model.addAttribute("detailPageDtos", searchResults);  // "readingRooms" 대신 "detailPageDtos"를 사용
        return "searchList";
    }

 // Ajax 요청을 처리하는 메서드
  @GetMapping("/searchRooms")
  @ResponseBody
  public List<DetailPageDto> searchRoomsAjax(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword) {
    return studycafeService.searchRooms(region, searchKeyword);
  }

 

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

    @GetMapping("/{room_name}/reviews")
    public ModelAndView getReviews(@PathVariable("room_name") String room_name, Model model, HttpSession session) {
        ModelAndView mav = new ModelAndView("detailPage");
        Integer room_id = (Integer) session.getAttribute("room_id");

        if (room_id != null) {
            List<ReviewDto> reviewList = detailPageService.getReviewsByRoomId(room_id);
            mav.addObject("reviewList", reviewList);
        } else {
            mav.addObject("error", "Room not found");
        }
        return mav;
    }
   

}