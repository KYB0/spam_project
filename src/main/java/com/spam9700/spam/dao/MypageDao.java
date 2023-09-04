package com.spam9700.spam.dao;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDao {

    int insertReview(int review_id, int rating, String review_content);

    
}
