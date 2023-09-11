package com.spam9700.spam.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spam9700.spam.dto.CompanyMemberDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.RoomPageDto;
import com.spam9700.spam.dto.SeatDto;
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
    public String cMypageInsert(HttpSession session, Model model, @RequestParam(name="page", defaultValue = "1") int page) {
        String company_id = (String)session.getAttribute("company_id");
        //로그인 세션 가져오기
        if (company_id == null) {
            // 세션에 company_id가 없으면 처리할 로직 추가 (예: 로그인 페이지로 리다이렉트)
            return "redirect:/member/c_login"; // 기업로그인 페이지로 리다이렉트 또는 다른 처리
        }
        
        int pageSize = 5;
       
        List<DetailPageDto> paginatedRooms = studycafeService.getPaginatedRooms(page, pageSize, company_id);
        int totalRoomsCount = studycafeService.getTotalRoomsCount(company_id);
        // System.out.println("++++++++++++++++++++++++"+page+"+++++++++++++++++++++++++");
        // System.out.println("--------------------------"+size+"----------------------------");
    
        model.addAttribute("roomDataPage", paginatedRooms);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", (totalRoomsCount + pageSize - 1) / pageSize);

         List<DetailPageDto> roomDataList = studycafeService.getAllRoomsByCompanyId(company_id);

        // for(DetailPageDto rd : roomDataList){
        //     System.out.println(rd);
        // } //roomDataList로 데이터값이 전달되는지 확인
        model.addAttribute("roomDataList", roomDataList);
        return "companyInsert";
    }






    
    @PostMapping("/c_mypage/insert")
        public String processStudyRoomInsert(@ModelAttribute DetailPageDto detailPageDto, RedirectAttributes redirectAttributes) {
            // System.out.println("========================="+((String)s.getAttribute));
            try {
                // 스터디 룸 정보를 DB에 삽입
                studycafeService.insertStudyRoom(detailPageDto);
    
                // 입력 성공 시 메시지 설정
                redirectAttributes.addFlashAttribute("success", true);
            } catch (Exception e) {
                e.printStackTrace();
                // 입력 실패 시 메시지 설정
                redirectAttributes.addFlashAttribute("success", false);
                log.error("스터디 룸 등록 실패: " + e.getMessage());
            }
            // 입력 결과에 관계없이 등록 페이지로 리다이렉트
            return "redirect:/c_mypage/insert";
        }
    


    @GetMapping("/c_mypage/insert/write")
    public String showStudyRoomWritePage(HttpSession session, Model model) {
        // 세션에서 로그인 정보를 가져옴
        // CompanyMemberDto loggedInUser = (CompanyMemberDto) session.getAttribute("loggedInUser");
        // DetailPageDto loggedInUser = (DetailPageDto)session.getAttribute("loggedInUser");

        String company_id = (String)session.getAttribute("company_id");
    
        DetailPageDto  detailPageDto = studycafeService.getCompanyIdFromCompanyMember(company_id);
        session.setAttribute("detailPageDto", detailPageDto);
        model.addAttribute("detailPageDto", detailPageDto);

        return "studyRoomWrite";
    }

    @PostMapping("/c_mypage/insert/write")
    public String insertStudyRoomWritePage(@RequestParam("stdRName") String room_name, @RequestParam("stdRDescription") String room_description, @RequestParam("stdRTPrice") int time_price, @RequestParam("stdRDPrice") int day_price, @RequestParam("stdRRegion") String region, RedirectAttributes redirectAttributes, HttpSession session){
        // DetailPageDto 객체 생성 및 company_id 설정
        DetailPageDto detailPageDto = new DetailPageDto();
       String company_id = (String)session.getAttribute("company_id");
        detailPageDto.setCompany_id(company_id);
        detailPageDto.setRoom_name(room_name);
        detailPageDto.setRoom_description(room_description);
        detailPageDto.setTime_price(time_price);
        detailPageDto.setDay_price(day_price);
        detailPageDto.setRegion(region);

        // 서비스로 DetailPageDto 전달
        int result = studycafeService.insertStudyRoom(detailPageDto);
        System.out.println("++++++++++++++++"+result);
        if(result > 0){
            // 등록 성공 시 처리
            return "redirect:/c_mypage/insert"; // 등록 페이지로 이동
        }else{
            redirectAttributes.addFlashAttribute("errorAlert", "등록에 실패했습니다.");
            return "redirect:/spam/c_mypage/insert";
        }
    }

    @GetMapping("/c_mypage/seatInsert")
        public String seatInsert(Model model, @RequestParam("room_id") int room_id){
            //room_id를 이용해 해당 방 정보를 가져옴
            SeatDto seatDto = new SeatDto();
            seatDto.setRoom_id(room_id);
            log.info("room_id : "+room_id);
           
            List<SeatDto> seatsData = studycafeService.getAllSeats();
            //좌석 등록 페이지로 해당 방 정보 전달
            model.addAttribute("seatDto", seatDto);

            return "seatChoice";
        }

     
        @PostMapping("/c_mypage/seatInsert")
        public String insertSeats(@ModelAttribute("seatDto") SeatDto seatDto, Model model){
            // seatDto에서 seat_number 값을 가져옵니다.
            String seat_number = seatDto.getSeat_number();

            // room_id 값을 가져오기 위해 이전 페이지에서 전달된 seatDto를 사용합니다.
            int room_id = seatDto.getRoom_id();

             // 이전에 저장된 해당 room_id의 데이터를 모두 삭제합니다.
             studycafeService.deletePreviousSeatsByRoomId(room_id);
             log.info("delete room_id : "+room_id);
           
            //room_id와 seat_number 정보를 이용하여 좌석 정보를 DB에 저장
            studycafeService.saveSelectedSeats(room_id, seat_number);
            log.info("save room_id : "+room_id);

          
             
          return "redirect:/c_mypage/insert" ;
        }
    

    @GetMapping("/c_mypage/resign")
    public String cMypageResign() {
        return "companyResign";
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

    @GetMapping("/i_mypage/list/like_list")
    public String likeList() { 
        log.info("찜 목록 페이지");
        return "likeList";
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