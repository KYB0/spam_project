// package com.spam9700.spam.service;

// import com.spam9700.spam.dao.ReservationDao;
// import com.spam9700.spam.dto.ReservationDTO;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;
// import org.springframework.transaction.annotation.Transactional;

// import java.util.List;

// @Service
// public class ReservationService {

//     @Autowired
//     private final ReservationDao reservationDao;

//     public ReservationService(ReservationDao reservationDao) {
//         this.reservationDao = reservationDao;
//     }

//     // 좌석별 예약 목록 조회
//     public List<ReservationDTO> getReservationsBySeat(Long seatId) {
//         return reservationDao.getReservationsBySeat(seatId);
//     }

//     @Transactional // 트랜잭션 처리를 위해 필요한 어노테이션
//     public ReservationDTO createReservation(ReservationDTO reservationDTO) {
//         // 예약 생성 로직을 구현
//         try {
//             // 예약 정보를 데이터베이스에 저장
//             reservationDao.createReservation(reservationDTO);

//             // 예약 정보를 저장한 후 필요한 로직을 추가로 처리할 수 있습니다.
//             // 예: 결제 처리, 예약 알림 등

//             // 예약이 성공적으로 생성되었으므로 DTO를 반환
//             return reservationDTO;
//         } catch (Exception e) {
//             // 예약 생성 중에 예외가 발생한 경우 처리할 코드를 추가하세요.
//             // 예: 예외 로깅, 예외 처리 등
//             throw new RuntimeException("예약 생성 중에 오류가 발생했습니다.", e);
//         }
//     }
// }
