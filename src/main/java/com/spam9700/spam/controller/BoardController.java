package com.spam9700.spam.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.BoardDto;
import com.spam9700.spam.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
    @Autowired
    private BoardService bSer;

    @GetMapping("/insert")
    public String boardWrite() {
        log.info("등록창 열기");
        return "write";
    }

    @PostMapping("/insert")
    public String postWrite(BoardDto bod, @RequestPart List<MultipartFile> attachments,
            RedirectAttributes rttr, HttpSession session) {
        log.info("bod={}", bod);
        log.info("attachments={}", attachments.size());

        boolean result = bSer.write(bod, attachments, session);
        if (result) {
            rttr.addFlashAttribute("msg", "등록 성공");
            return "redirect:/list";
        } else {
            rttr.addFlashAttribute("msg", "등록 실패");
            return "redirect:/write";
        }
    }

}