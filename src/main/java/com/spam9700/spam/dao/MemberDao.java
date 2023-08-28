package com.spam9700.spam.dao;

import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spam9700.spam.dto.CustomerDto;

@Mapper
public interface MemberDao {
    boolean iLogin(String customer_id, String customer_pwd);

    int checkCredentials(@Param("customer_id") String customer_id, @Param("customer_pwd") String customer_pwd);

    CustomerDto getCustomerByUsername(String customer_id);

}