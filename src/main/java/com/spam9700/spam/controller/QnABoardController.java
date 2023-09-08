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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            @RequestParam(value = "keyword", required = false) String keyword) {
        // 게시글 리스트와 총 게시글 수 가져오기
        List<QnaBoardDto> qnaBoardDtoList;
        int totalBoardCount;

        if (keyword != null && !keyword.isEmpty()) {
            // 키워드가 제공된 경우 검색을 수행하도록 수정
            qnaBoardDtoList = qnABoardService.searchQnaBoard(keyword, page, pageSize);
            totalBoardCount = qnABoardService.getSearchResultCount(keyword);
        } else {
            // 키워드가 제공되지 않은 경우 모든 글을 가져오도록 유지
            qnaBoardDtoList = qnABoardService.getAllQnaBoard(page, pageSize);
            totalBoardCount = qnABoardService.getTotalBoardCount();
        }

        model.addAttribute("qnaBoardDtoList", qnaBoardDtoList);
        log.info("qnaBoardDtoList:{}", qnaBoardDtoList);

        // 페이징 계산
        int totalPages = (int) Math.ceil((double) totalBoardCount / pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize); // 페이지 사이즈도 모델에 추가
        model.addAttribute("keyword", keyword); // 검색어도 모델에 추가
        log.info("totalPages:{}", totalPages);
        log.info("currentPage:{}", page);
        log.info("게시판 리스트");
        return "qna/qnaBoardList"; // JSP 파일 경로를 정확하게 지정
    }

    @GetMapping("/write")
    public String writeForm(HttpServletRequest request) {
        // 현재 로그인한 사용자의 정보를 세션에서 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        if (userId == null) {
            // 사용자가 로그인하지 않았으면 로그인 페이지로 리다이렉트
            return "redirect:/member/i_login";
        }

        log.info("글쓰기 창");
        return "qna/qnaBoardWrite"; // JSP 파일 경로를 정확하게 지정
    }

    @PostMapping("/write")
    public String write(HttpServletRequest request,
            @RequestParam("board_title") String title,
            @RequestParam("board_content") String content) {
        log.info("write");

        // 현재 로그인한 사용자의 정보를 세션에서 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        QnaBoardDto qnaBoardDto = new QnaBoardDto();
        qnaBoardDto.setUser_id(userId);
        qnaBoardDto.setBoard_title(title);
        qnaBoardDto.setBoard_content(content);

        qnABoardService.insertQnaBoard(qnaBoardDto);

        return "redirect:/qna/list";
    }

    @GetMapping("/detail")
    public String detail(Model model, @RequestParam("board_id") int boardId) {
        // 글 상세 내용 가져오는 로직 추가
        QnaBoardDto board = qnABoardService.getBoardById(boardId);
        model.addAttribute("board", board);
        return "qna/qnaBoardDetail"; // JSP 파일 경로를 정확하게 지정
    }

}
