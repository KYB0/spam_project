// package com.spam9700.spam.controller;

// import java.util.List;
// import java.io.IOException;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestPart;
// import org.springframework.web.multipart.MultipartFile;
// import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// import com.spam9700.Exception.DBException;
// import com.spam9700.Service.BoardService;
// import com.spam9700.boardDto.BFile;
// import com.spam9700.boardDto.BoardDto;

// import jakarta.servlet.http.HttpSession;
// import lombok.extern.slf4j.Slf4j;

// @Controller
// @Slf4j
// public class BoardController {
//     @Autowired
//     private BoardService bSer;

//     @GetMapping("/insert")
//     public String boardWrite(){
//         log.info("등록창 열기");
//         return "boardWrite";
//     }

//     @PostMapping("/insert")
//     public String postWrite(BoardDto board, @RequestPart List <MultipartFile> attachments,
//     RedirectAttributes rttr , HttpSession session){
//         log.info("board={}" , board);
//         log.info("attachments={}",attachments.size());

//         boolean result = bSer.boardWrite(board,attachments,session);
//         if(result){
//             rttr.addFlashAttribute("msg", "등록 성공");
//             return "redirect:/list";
//         }else{
//             rttr.addFlashAttribute("msg", "등록 실패");
//             return "redirect:/write";
//         }
//     }
    
//     @GetMapping("/update")
//      public String BupdateFrm(Integer b_num , Model model){
//             log.info("독서실 수정창 열기");
//             BoardDto dto = bSer.getDetail(b_num);
//             List<BFile> fList = bSer.getFileList(b_num);
//             if(dto != null){
//                 model.addAttribute("dto",dto);
//                 return "update";
//             }else{
//                 return "redirect:/board/list";
//             }
//     }
//     @PostMapping("/update")
//     public String Bupdate(@RequestPart List<MultipartFile> att , BoardDto bod , HttpSession
//     session , RedirectAttributes rttr){
//       boolean result = bSer.Bupdate(bod,att,session);
//       log.info("bod:{}",bod);
//       log.info("file size:{}", att.size());
//        if(result){
//          rttr.addFlashAttribute("msg", "수정 성공");
//          return "redirect:/board/detail?_num="+bod.getB_num();
//          }else{
//           rttr.addFlashAttribute("msg", "수정 실패");
//           return "redirect:/board/update?_num="+bod.getB_num();
//           }
          
//     }

//     @GetMapping("/search")
//     public String Clist(){
//         return null;
//     }

//     @GetMapping("/delete")
// 	public String boardDelete(Integer b_num, HttpSession session, RedirectAttributes rttr) {
// 		log.info("boardDelete b_num:{}",b_num);
// 		try {
// 			bSer.boardDelete(b_num, session);
// 			rttr.addFlashAttribute("msg", b_num+"번 삭제성공");  //request영역에 1번 사용후 삭제됨 
// 			//rttr.addAttribute("msg", "삭제성공");  //request객체에 파라미터 저장 
// 			return "redirect:/board/list?pageNum=1";
// 		}catch(DBException e){
// 			log.info(e.getMessage());
// 			rttr.addFlashAttribute("msg", b_num+"번 삭제실패");  //request영역에 1번 사용후 삭제됨 
// 			return "redirect:/board/detail?b_num="+b_num;
// 		}
// 	}
// }
﻿package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.Service.BoardService;
import com.spam9700.boardDto.BFile;
import com.spam9700.boardDto.BoardDto;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
    @Autowired
    private BoardService bSer;

    @GetMapping("/board/write")
    public String boardWrite(){
        log.info("등록 열기");
        return "boardWrite";
    }
    @PostMapping("/board/write")
    public String postWrite(BoardDto board, @RequestPart List   <MultipartFile> attachments,
    RedirectAttributes rttr , HttpSession session){
        log.info("board={}" , board);
        log.info("attachments={}",attachments.size());

        boolean result = bSer.boardWrite(board,attachments,session);
        if(result){
            rttr.addFlashAttribute("msg", "등록 성공");
            return "redirect:/board/list";
        }else{
            rttr.addFlashAttribute("msg", "등록 실패");
            return "redirect:/board/write";
        }

      
    }
        @GetMapping("/update")
        public String BupdateFrm(Integer b_num , Model model){
            log.info("글 수정창 열기");
            BoardDto dto = bSer.getDetail(b_num);
            List<BFile> fList = bSer.getFileList(b_num);
            if(dto != null){
                model.addAttribute("dto",dto);
                return "Bupdate";
            }else{
                return "redirect:/board/list";
            }
     }
     @PostMapping("/update")
            public String Bupdate(@RequestPart List<MultipartFile> att , BoardDto bod , HttpSession
            session , RedirectAttributes rttr){
             boolean result = bSer.Bupdate(bod,att,session);

             log.info("bod:{}",bod);
             log.info("file size:{}", att.size());

             if(result){
                rttr.addFlashAttribute("msg", "수정 성공");
                return "redirect:/board/detail?_num="+bod.getB_num();
             }else{
                rttr.addFlashAttribute("msg", "수정 실패");
                return "redirect:/board/update?_num="+bod.getB_num();
             }
    }
    @GetMapping("/companylist")
    public String Clist(){
        return null;
    }
}
