// package com.spam9700.Service;

// import java.util.List;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;
// import org.springframework.web.multipart.MultipartFile;

// import com.spam9700.Common.FileManager;
// import com.spam9700.boardDao.BoardDao;
// import com.spam9700.boardDto.BFile;
// import com.spam9700.boardDto.BoardDto;
// import com.spam9700.boardDto.MemberDto;

// import jakarta.servlet.http.HttpSession;
// import lombok.extern.slf4j.Slf4j;

// @Slf4j
// @Service
// public class BoardService {
//     @Autowired
//     private BoardDao bDao;

//     @Autowired
//     private FileManager fm;

//     public boolean boardWrite(BoardDto board, List<MultipartFile> attachments, HttpSession session) {
//        boolean result = bDao.boardWriteKey(board);

//        if(result){
//         if(attachments.get(0).getSize() !=0){
//             if(fm.fileUpload(attachments,session,board.getB_num()))
//             log.info("upload ok");
//             return true;
//             };
//         }
//     }

//     public boolean Bupdate(BoardDto bod, List<MultipartFile> att, HttpSession session) {
//         return false;
//     }

//     public BoardDto getDetail(Integer b_num) {
//         return bDao.getDetail;
//     }

//     public List<BFile> getFileList(Integer b_num) {
//         List<BFile> fList = bDao.getFileList(b_num);
//         return fList;
//     }

//     public void boardDelete(Integer b_num, HttpSession session) {
//     }
    
// }
