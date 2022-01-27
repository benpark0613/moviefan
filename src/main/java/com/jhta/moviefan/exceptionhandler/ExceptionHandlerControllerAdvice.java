/*
 * package com.jhta.moviefan.exceptionhandler;
 * 
 * import org.springframework.dao.DataAccessException; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.ControllerAdvice; import
 * org.springframework.web.bind.annotation.ExceptionHandler;
 * 
 * import com.jhta.moviefan.exception.CustomException; import
 * com.jhta.moviefan.exception.LoginErrorException;
 * 
 * @ControllerAdvice public class ExceptionHandlerControllerAdvice {
 * 
 * // TODO 에러페이지가 아니라 에러메세지를 보여주는 방식으로 변경 예정
 * 
 * @ExceptionHandler(LoginErrorException.class) public String
 * handleLoginErrorException(LoginErrorException e, Model model){
 * e.printStackTrace(); model.addAttribute("error", e.getMessage()); return
 * "/error/loginError"; }
 * 
 * @ExceptionHandler(CustomException.class) public String
 * handleCustomException(CustomException e) { e.printStackTrace(); return
 * "/error/customError"; }
 * 
 * @ExceptionHandler(DataAccessException.class) public String
 * handleDataAccessException(DataAccessException e) {
 * 
 * return "/error/databaseError"; }
 * 
 * @ExceptionHandler(Exception.class) public String handleException(Exception e)
 * { e.printStackTrace(); return "/error/serverError"; } }
 */