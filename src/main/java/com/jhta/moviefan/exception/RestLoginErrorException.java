package com.jhta.moviefan.exception;

public class RestLoginErrorException extends CustomException {

	private static final long serialVersionUID = 3068806034630940979L;

	public RestLoginErrorException(String message) {
		super(message);
	}
}
