package com.spam9700.spam.dto;

import lombok.Data;

@Data
public class MypageDto {
    private String customer_id;
    private String customer_name;
    private String customer_pwd;
    private String customer_email;
    private String customer_phone;


   public String getcustomer_id(){
    return this.customer_id;
   }
}
