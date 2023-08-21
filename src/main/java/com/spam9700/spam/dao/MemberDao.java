package com.spam9700.spam.dao;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.CustomerMemberDto;

@Mapper
public interface MemberDao {

    boolean join(CustomerMemberDto customerMemberDto);

    boolean login(String customer_id, String customer_pwd);

    boolean idCheck(String customer_id);

}
