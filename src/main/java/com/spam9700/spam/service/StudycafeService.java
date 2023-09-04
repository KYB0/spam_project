package com.spam9700.spam.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.MypageDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudycafeService {

    @Autowired
    MypageDao mypageDao;

    public boolean submitReview(int review_id, int rating, String review_content) {
        try {
            // 리뷰 정보를 데이터베이스에 저장
            int rowsInserted = mypageDao.insertReview(review_id, rating, review_content);

            // 삽입된 행이 하나 이상인 경우 리뷰 저장 성공으로 간주
            return rowsInserted > 0;
        } catch (Exception e) {
            // 리뷰 저장 과정에서 예외가 발생한 경우 처리
            log.error("리뷰 저장 중 오류 발생:", e);
            return false;
        }
    }

}