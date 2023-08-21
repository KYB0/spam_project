package com.spam9700.spam.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.MemberDao;
import com.spam9700.spam.dto.CustomerMemberDto;

@Service
public class MemberService {
    @Autowired
    MemberDao memberDao;

    public boolean join(CustomerMemberDto customerMemberDto) {
        // customerMemberDto.se
        // customerMemberDto.setCustomerBirth(LocalDate.of(Year, Month, Day));
        return memberDao.join(customerMemberDto);
    }

    public boolean login(String customer_id, String customer_pwd) {
        return memberDao.login(customer_id, customer_pwd);
    }

    public boolean idCheck(String customer_id) {
        return memberDao.idCheck(customer_id);
    }

}
