package com.spam9700.spam.common;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Component
public class FileManager {

    public boolean fileUpload(List<MultipartFile> attachments, HttpSession session, Object b_num) {
        return false;
    }
    
}
