package com.spam9700.spam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.spam9700.spam.dao.EquipmentDAO;
import com.spam9700.spam.dao.EquipmentReservationDAO;
import com.spam9700.spam.dto.EquipmentDTO;
import com.spam9700.spam.dto.EquipmentReservationDTO;

public class EquipmentService {    
    
    private final EquipmentDAO equipmentDAO;  // DB 접근 
    private final EquipmentReservationDAO equipmentReservationDAO; //DB 접근 

    @Autowired
    public EquipmentService(EquipmentDAO equipmentDAO, EquipmentReservationDAO equipmentReservationDAO) {
        this.equipmentDAO = equipmentDAO;
        this.equipmentReservationDAO = equipmentReservationDAO;
    }

    @Transactional
    public void reserveEquipment(int equipmentId) {  
        // equipmentId를 파라미터로 받아 해당 비품의 available_quantity 1 감소 시키고,
        // 새로운 예약을 EquipmentReservation 테이블에 추가하는 메서드 

        EquipmentDTO equipment = equipmentDAO.getEquipmentById(equipmentId);
        
        if (equipment != null && equipment.getAvailableQuantity() > 0) {
            equipment.setAvailableQuantity(equipment.getAvailableQuantity() - 1);
            equipmentDAO.updateEquipment(equipment);
            
            EquipmentReservationDTO reservation = new EquipmentReservationDTO();
            reservation.setEquipmentId(equipmentId);
            equipmentReservationDAO.insertReservation(reservation);
        } else {
            throw new IllegalStateException("No available equipment");
        }
    }

    @Transactional
    public void returnEquipment(int reservationId) { 
        //  reservationId 를 파라미터로 받아 해당 예약 삭제, available_quantity 1 증가
        EquipmentReservationDTO reservation = equipmentReservationDAO.getReservationById(reservationId);
        
        if (reservation == null) {
            throw new IllegalStateException("Invalid reservation");
        }
        
        int equipmentId = reservation.getEquipmentId();
        EquipmentDTO equipment = equipmentDAO.getEquipmentById(equipmentId);
        
        if (equipment != null) {
            equipment.setAvailableQuantity(equipment.getAvailableQuantity() + 1);
            equipmentDAO.updateEquipment(equipment);
            
            equipmentReservationDAO.deleteReservation(reservationId);
        } else {
            throw new IllegalStateException("Invalid equipment");
        }
    }
}
