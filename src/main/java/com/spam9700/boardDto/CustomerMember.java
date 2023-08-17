package com.spam9700.boardDto;

import lombok.Data;

@Data
public class CustomerMember {
    private String customer_id;
    private String customer_pwd;
    private String customer_name;
    private String customer_email;
    private String customer_birth;
    private String customer_phone;
}
