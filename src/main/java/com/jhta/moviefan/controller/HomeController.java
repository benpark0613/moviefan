package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/*
 * @Controller
 * 		+ 클라이언트의 HTTP 요청을 처리하는 요청핸들러 메소드를 포함하고 있는 컨트롤러 클래스임을 나타낸다.
 * 		+ 스프링은 컨트롤러에서 정의된 @RequestMapping, @GetMapping, @PostMapping 어노테이션 정보를 분석해서
 *        요청URL와 요청핸들러 메소드를 매핑시킨다.
 *      + 클라이언트의 요청이 접수되면 요청URL을 분석해서 매핑된 요청핸들러 메소드를 실행한다.
 * @SessionAttributes
 * 		+ 지정된 이름으로 Model에 객체가 저장되면, 해당 객체를 HttpSession에 저장시킨다.
 * 
 * 		사용예)
 * 		public String login(String id, String password) {
 			// UserService의 사용자 인증 서비스 호출
			User user = userService.login(id, password);
			// 인증된 사용자정보를 Model에 저장
			// @SessionAttributes(names = {"LOGIN_USER"}) 이 설정 때문에 
			// user객체는 HttpSession객체에 저장된다.
			model.addAttribute("LOGIN_USER", user);
		
			return "redirect:home.do";
		}
 * SessionStatus
 * 		+ @SessionAttributes로 HttpSession객체에 저장된 객체를 삭제한다.
 * 	 	+ 동일한 컨트롤러안에서 @SessionAttributes로 저장한 것만 삭제된다.
 * 		+ SessionStatus의 setComplete() 메소드는 동일한 컨트롤러 안에서 @SessionAttributes 어노테이션 설정으로
 *        HttpSession에 저장된 속성을 삭제한다.
 * 	
 */
@Controller
public class HomeController {

	@GetMapping("/home")
	public String home() {
		return "home";
	}
}
