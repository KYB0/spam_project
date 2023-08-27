package com.spam9700.spam.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberDao {
    boolean iLogin(String customer_id, String customer_pwd);

    int checkCredentials(@Param("customer_id") String customer_id, @Param("customer_pwd") String customer_pwd);
}