// package com.spam9700.spam.controller;

// import com.spam9700.spam.dto.SeatDto;
// import com.spam9700.spam.service.SeatService;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.http.ResponseEntity;
// import org.springframework.web.bind.annotation.*;

// import java.util.List;

// @RestController
// @RequestMapping("/backend/seats")
// public class SeatController {
//     private final SeatService seatService;

//     @Autowired
//     public SeatController(SeatService seatService) {
//         this.seatService = seatService;
//     }

//     @GetMapping
//     public List<SeatDto> getAllSeats() {
//         return seatService.getAllSeats();
//     }

//     @GetMapping("/{room_id}")
//     public List<SeatDto> getSeatsByRoomId(@PathVariable int room_id) {
//         return seatService.getSeatsByRoomId(room_id);
//     }

//     @PostMapping("/reserve/{seat_id}")
//     public ResponseEntity<String> reserveSeat(@PathVariable int seat_id) {
//         SeatDto reservedSeat = seatService.reserveSeat(seat_id);
//         if (reservedSeat != null) {
//             return ResponseEntity.ok("Seat reserved successfully.");
//         } else {
//             return ResponseEntity.badRequest().body("Seat is already reserved or does not exist.");
//         }
//     }
// }
