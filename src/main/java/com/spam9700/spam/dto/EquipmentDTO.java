package com.spam9700.spam.dto;

public class EquipmentDTO {
    private int id;
    private String name;
    private int totalQuantity;
    private int availableQuantity;

    public int getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(int availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    // Other getters and setters
}
