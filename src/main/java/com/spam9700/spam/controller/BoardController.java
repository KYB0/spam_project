package com.spam9700.spam.controller;

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
