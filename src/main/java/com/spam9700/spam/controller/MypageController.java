// package com.spam9700.spam.controller;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.ModelAttribute;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestMapping;

// import com.spam9700.spam.dto.MypageDto;
// import com.spam9700.spam.service.MypageService;



// @Controller
// @RequestMapping("/member")
// public class MypageController {

//     @Autowired
//     private MypageService mypageService;

//     @GetMapping("/i_mypage/{customer_id}")
//     public String showMyPage(@PathVariable String customer_id, Model model){
//         MypageDto user = mypageService.getUserInfo(customer_id);
//         model.addAttribute("user", user);

//         return "i_mypage";
//     }

//     @PostMapping("/i_mypage/{customer_id}")
//     public String updateUserInfo(@ModelAttribute MypageDto user){
//         mypageService.updateUserInfo(user);

//         return "redirect:/i_mypage/" + user.getcustomer_id();
//     }
 
// }
