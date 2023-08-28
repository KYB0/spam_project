package com.spam9700.spam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.MemberDao;

@Service
public class MemberService {

    @Autowired
   private MemberDao memberDao;

    public boolean iLogin(String customer_id, String customer_pwd) {
        return memberDao.checkCredentials(customer_id, customer_pwd) > 0;
    }

    
}
