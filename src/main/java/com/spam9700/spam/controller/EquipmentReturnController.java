// import java.time.LocalDateTime;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;

// import com.spam9700.spam.service.EquipmentService;

// import ch.qos.logback.core.model.Model;

// @Controller
// public class EquipmentReturnController {

//     @Autowired
//     private EquipmentService equipmentService;

//     @GetMapping("/equipment-return")
//     public String showEquipmentReturnPage(Model model) {
//         // DB에서 필요한 데이터 조회
//         String roomName = equipmentService.getRoomName();
//         String equipmentName = equipmentService.getEquipmentName();
//         LocalDateTime startTime = equipmentService.setStartTime();
//         LocalDateTime returnTime = equipmentService.getReturnTime();  

//         // 모델에 데이터 추가
//         model.addAttribute("roomName", roomName);
//         model.addAttribute("equipmentName", equipmentName);
//         model.addAttribute("startTime", startTime);
//         model.addAttribute("returnTime", returnTime);

//         return "equipment_return"; // 해당 뷰(JSP 파일)의 이름
//     }
// }
