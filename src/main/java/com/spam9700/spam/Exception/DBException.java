﻿package com.spam9700.spam.Exception;

public class DBException extends RuntimeException {
	
	public DBException() {
		super("@Transactional은 기본적으로 RuntimeException 예외 발생하면 rollback처리함");
	}
	
}