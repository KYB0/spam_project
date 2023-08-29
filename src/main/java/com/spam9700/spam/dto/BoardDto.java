﻿package com.spam9700.spam.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
@AllArgsConstructor
public class BoardDto {

   private String registration_id;
   private String company_id;
   private Timestamp registration_date;
   private String status;

}
