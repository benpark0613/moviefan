package com.jhta.moviefan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {

	@GetMapping("/myticket/bookinglist")
	public String ticketBookingList() {
		return "myaccount/myticket/bookinglist";
	}
	
	@GetMapping("/myticket/orderlist")
	public String ticketOrderList() {
		return "myaccount/myticket/orderlist";
	}
	
	@GetMapping("/myticket/canclelist")
	public String ticketCancleList() {
		return "myaccount/myticket/canclelist";
	}
	
	@GetMapping("/movielog/wish")
	public String movieWishList() {
		return "myaccount/movielog/wish";
	}
	
	@GetMapping("/movielog/watched")
	public String movieWatchedList() {
		return "myaccount/movielog/watched";
	}
	
	@GetMapping("/movietalk/myscrap")
	public String movietalkScrapList() {
		return "myaccount/movietalk/myscrap";
	}
	
	@GetMapping("/movietalk/mydocuments")
	public String movietalkDocumentList() {
		return "myaccount/movietalk/mydocuments";
	}
	
	@GetMapping("/movietalk/mycomments")
	public String movietalkCommentList() {
		return "myaccount/movietalk/mycomments";
	}
	
	@GetMapping("/movietalk/myreplies")
	public String movietalkReplyList() {
		return "myaccount/movietalk/myreplies";
	}
	
	@GetMapping("/mypoint/info")
	public String pointInfo() {
		return "myaccount/mypoint/info";
	}
	
	@GetMapping("/mypoint/history")
	public String pointList() {
		return "myaccount/mypoint/history";
	}
	
	@GetMapping("/myinfo/modify")
	public String modifyMyInfo() {
		return "myaccount/myinfo/modify";
	}
	
	@GetMapping("/myinfo/delete")
	public String deleteMyInfo() {
		return "myaccount/myinfo/delete";
	}
	
}
