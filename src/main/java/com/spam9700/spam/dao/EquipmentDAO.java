package com.spam9700.spam.dao;

import java.util.List;

import com.spam9700.spam.dto.EquipmentDTO;

public interface EquipmentDAO {
    EquipmentDTO getEquipmentById(int id);
    void updateEquipment(EquipmentDTO equipment);
    // ... (Other methods)
}
