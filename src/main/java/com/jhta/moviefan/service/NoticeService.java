package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.NoticeDao;
import com.jhta.moviefan.dto.NoticeDto;
import com.jhta.moviefan.exception.AdminErrorException;
import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.vo.Notice;
import com.jhta.moviefan.vo.NoticeCategory;
import com.jhta.moviefan.vo.NoticeImage;

@Service
@Transactional
public class NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private CustomerService customerService;
	
	public void insertNewNotice(Notice notice, NoticeImage noticeImage) {
		if (!customerService.isAdmin(notice.getCustomerNo())) {
			throw new AdminErrorException("관리자 인증 후 사용해주세요.");
		}
		
		noticeDao.insertNotice(notice);
		noticeImage.setNoticeNo(notice.getNo());
		if (noticeImage.getImage() != null) {
			noticeDao.insertNoticeImage(noticeImage);
		}
	}
	
	public Notice getNoticeDetailByNoticeNo(int noticeNo) {
		return noticeDao.getNoticeDetailByNo(noticeNo);
	}
	
	public List<Notice> getAllNoticeList() {
		return noticeDao.getAllNoticeList();
	}
	
	public int getTotalRows(Criteria criteria) {
		return noticeDao.getNoticeTotalRows(criteria);
	}
	
	public List<Notice> searchNoticeList(Criteria criteria) {
		return noticeDao.searchNoticeList(criteria);
	};
	
	public List<NoticeCategory> getAllNoticeCategories() {
		return noticeDao.getAllNoticeCategories();
	}
	
	public List<NoticeImage> getAllNoticeImages() {
		return noticeDao.getAllNoticeImages();
	}
	
	public NoticeImage getNoticeImageByNoticeNo(int noticeNo) {
		NoticeImage noticeImage = noticeDao.getNoticeImageByNo(noticeNo);
		return noticeImage;
	}
	
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}
	
	public List<NoticeDto> getNoticeDtos(Criteria criteria) {
		NoticeDto dto = new NoticeDto();
		List<NoticeDto> dtos = new ArrayList<NoticeDto>();
		
		List<Notice> NoticeList = noticeDao.searchNoticeList(criteria);
		List<NoticeImage> noticeImages = noticeDao.getAllNoticeImages();
		List<NoticeCategory> noticeCategories = getAllNoticeCategories();
		
		for (Notice notice : NoticeList) {
			BeanUtils.copyProperties(notice, dto);
			for (NoticeImage noticeImage : noticeImages) {
				if (noticeImage.getNoticeNo() == notice.getNo()) {
					dto.setImage(noticeImage.getImage());
				}
			}
			for (NoticeCategory category : noticeCategories) {	
				if (notice.getCategoryNo() == category.getCategoryNo()) {
					dto.setCategoryNo(category.getCategoryNo());
					dto.setCategoryName(category.getName());
				}
			}
			dtos.add(dto);
		}
		
		return dtos;
	}
}

















