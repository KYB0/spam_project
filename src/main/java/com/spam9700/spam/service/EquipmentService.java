package com.spam9700.spam.service;

import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.EquipmentDAO;
import com.spam9700.spam.dao.EquipmentReservationDAO;
import com.spam9700.spam.dto.EquipmentDTO;
import com.spam9700.spam.dto.EquipmentReservationDTO;

public class EquipmentService {
    
    private final EquipmentDAO equipmentDAO;
    private final EquipmentReservationDAO equipmentReservationDAO;

    public EquipmentService(EquipmentDAO equipmentDAO, EquipmentReservationDAO equipmentReservationDAO) {
        this.equipmentDAO = equipmentDAO;
        this.equipmentReservationDAO = equipmentReservationDAO;
    }

    @Transactional
    public void reserveEquipment(int equipmentId) {
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
        // 여기서는 실제로 EquipmentReservationDTO를 가져와야 합니다.
        // 예를 들어: EquipmentReservationDTO reservation = equipmentReservationDAO.getReservationById(reservationId);

        EquipmentDTO equipment = equipmentDAO.getEquipmentById(reservationId/* 여기에 equipmentId를 넣어야 합니다. */);
        
        if (equipment != null) {
            equipment.setAvailableQuantity(equipment.getAvailableQuantity() + 1);
            equipmentDAO.updateEquipment(equipment);
            
            equipmentReservationDAO.deleteReservation(reservationId);
        } else {
            throw new IllegalStateException("Invalid equipment");
        }
    }
}
