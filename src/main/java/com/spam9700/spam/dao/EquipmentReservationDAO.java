package com.spam9700.spam.dao;

import com.spam9700.spam.dto.EquipmentReservationDTO;

public interface EquipmentReservationDAO {
    void insertReservation(EquipmentReservationDTO reservation);
    void deleteReservation(int reservationId);
    // ... (Other methods)
}
