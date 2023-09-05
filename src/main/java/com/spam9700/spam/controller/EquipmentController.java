package com.spam9700.spam.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller 
public class EquipmentController {

    @GetMapping("/return")  // "/return" URL에 대한 GET 요청을 이 메서드가 처리.
    public String showReturnPage(Model model) {  // Model 객체에 어트리뷰트 추가
        // 이 부분은 데이터베이스에서 값을 가져오는 코드로 대체해야ㅏㅎㅁ.
        String roomName = "Room 101";
        String equipmentName = "Charger";
        String startTime = "2023-09-04 09:00:00";
        String returnTime = "2023-09-04 18:00:00";

        model.addAttribute("roomName", roomName);
        model.addAttribute("equipmentName", equipmentName);
        model.addAttribute("startTime", startTime);
        model.addAttribute("returnTime", returnTime);

        return "equipment_return";  // 이 부분 뷰 이름, resources/templates 폴더 내에 해당하는 HTML 파일이 있어야 함
    }
}
