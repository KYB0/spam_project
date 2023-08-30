package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
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

    public boolean iLogin(String customer_id, String customer_pwd) {
        return memberDao.iLogin(customer_id, customer_pwd);
    }

    public boolean cLogin(String company_id, String company_pwd, String company_businessnum) {
        return memberDao.cLogin(company_id, company_pwd, company_businessnum);
    }

    public boolean idCheck(String customer_id) {
    return memberDao.idCheck(customer_id);
    }


    public List<String> findId(String customer_name, String customer_email) {
        return memberDao.findId(customer_name, customer_email);
    }

    public String findPwd(String customer_id, String customer_email) {
        return memberDao.findPwd(customer_id, customer_email);
    }

    public String updateMember(CustomerMemberDto updateMember) {
        memberDao.updateMember(updateMember);

        return "redirect:/member/i_mypage"; // 리다이렉트 경로 반환
    }

    

}
