package com.spam9700.spam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.MemberDao;

@Service
public class StudycafeService {
    
    @Autowired
    private MemberDao memberDao;
}
