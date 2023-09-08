package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spam9700.spam.dto.QnaBoardDto;
import com.spam9700.spam.service.QnABoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnABoardController {

    private final QnABoardService qnABoardService;

    public QnABoardController(QnABoardService qnABoardService) {
        this.qnABoardService = qnABoardService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<QnaBoardDto> qnaBoardDtoList = qnABoardService.getAllQnaBoard();
        model.addAttribute("qnaBoardDtoList", qnaBoardDtoList);
        log.info("qnaBoardDtoList:{}", qnaBoardDtoList);

        log.info("게시판 리스트");
        return "qnaBoardList";
    }

    @GetMapping("/write")
    public String writeForm() {
        log.info("글쓰기 창");
        return "qnaBoardWrite";
    }

    @PostMapping("/write")
    public String write(@RequestParam("user_id") String userId,
            @RequestParam("board_title") String title,
            @RequestParam("board_content") String content) {
        log.info("write");
        QnaBoardDto qnaBoardDto = new QnaBoardDto();
        qnaBoardDto.setUser_id(userId);
        qnaBoardDto.setBoard_title(title);
        qnaBoardDto.setBoard_content(content);

        qnABoardService.insertQnaBoard(qnaBoardDto);

        return "redirect:/qna/list";
    }

    @GetMapping("/detail")
    public String detailForm() {
        log.info("글 상세");
        return "qnaBoardDetail";
    }
}
