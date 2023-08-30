package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.CustomerMemberDto;

@Mapper
public interface MemberDao {

    boolean join(CustomerMemberDto customerMemberDto);

    boolean iLogin(String customer_id, String customer_pwd);

    boolean cLogin(String company_id, String company_pwd, String company_businessnum);

    boolean idCheck(String customer_id);

    List<String> findId(String customer_name, String customer_email);

    String findPwd(String customer_id, String customer_email);

    void updateMember(CustomerMemberDto updatedMember);


}
