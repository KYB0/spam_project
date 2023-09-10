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

    @Autowired
    private WishListService wishListService;

    @GetMapping("/{room_name}")
    public String detailPage(HttpSession session, @PathVariable("room_name") String room_name, Model model){
        String customer_id = (String)session.getAttribute("customer_id");
        DetailPageDto detailPageDto = detailPageService.getCustomerIdByName(customer_id);
        session.setAttribute("detailPageDto", detailPageDto);
        model.addAttribute("detailPageDto", detailPageDto);
        

        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        WishListDto  roomIdWish = wishListService.getRoomIdByRoomName(room_name);
       int room_id = roomIdWish.getRoom_id();
        List<DetailPageDto> rnData = detailPageService.getRoomsByName(room_name);
        List<WishListDto> riWish = detailPageService.getRIdByRoomName(room_name);

          for(WishListDto riw : riWish){
            System.out.println(riw);
        } //rnData 데이터값이 전달되는지 확인
        
        model.addAttribute("riWish", riWish);
        model.addAttribute("rnData", rnData);
        model.addAttribute("room_id", room_id);
        

        if (roomDetail != null) {
            // 해당 방이 존재하는 경우
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

    @PostMapping("/wishList/{room_id}")
    public ResponseEntity<String> toggleFavorite(@RequestParam("room_id") int room_id, HttpSession session, Model model){
        
        String customer_id = (String) session.getAttribute("customer_id");
       
        List<WishListDto> wlData = wishListService.getIdByRoom(room_id);
        for(WishListDto wld : wlData){
            System.out.println("room_id: " + wld);
            System.out.println("customer_id: " + customer_id);
        }
        model.addAttribute("wlData", wlData);
        model.addAttribute("room_id", room_id); // room_id를 모델에 추가
        
        if(customer_id == null){
            return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }

        

        wishListService.toggleRoomFavorite(room_id, customer_id);
        return new ResponseEntity<>("찜하기 상태가 업데이트되었습니다.", HttpStatus.OK);
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

