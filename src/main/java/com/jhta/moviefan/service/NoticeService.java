package com.jhta.moviefan.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.moviefan.dao.NoticeDao;
import com.jhta.moviefan.dto.NoticeDto;
import com.jhta.moviefan.exception.AdminErrorException;
import com.jhta.moviefan.form.CriteriaNotice;
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
	
	static final Logger logger = LogManager.getLogger(NoticeService.class);
	
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
	
	public int getTotalRows(CriteriaNotice criteria) {
		logger.info("검색조건: " + criteria);
		return noticeDao.getNoticeTotalRows(criteria);
	}
	
	public List<Notice> searchNoticeList(CriteriaNotice criteria) {
		logger.info("검색조건: " + criteria);
		return noticeDao.searchNoticeList(criteria);
	}	
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
	
	public List<NoticeDto> getNoticeDtos(CriteriaNotice criteria) {
		List<NoticeDto> dtos = new ArrayList<NoticeDto>();
		
		List<Notice> noticeList = noticeDao.searchNoticeList(criteria);
		List<NoticeCategory> noticeCategories = getAllNoticeCategories();
		logger.info("검색조건: " + criteria);
		logger.info("noticeList의 값: " + noticeList);
		
		if (!noticeList.isEmpty()) {
			for (Notice notice : noticeList) {
				NoticeDto dto = new NoticeDto();
				BeanUtils.copyProperties(notice, dto);
				for (NoticeCategory category : noticeCategories) {	
					if (category.getCategoryNo() == dto.getCategoryNo()) {
						dto.setCategoryName(category.getName());
					}
				}
				if (getNoticeImageByNoticeNo(dto.getNo()) != null) {
					dto.setImage(getNoticeImageByNoticeNo(dto.getNo()).getImage());
				}
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	public NoticeDto getNoticeDto(int noticeNo) {
		NoticeDto dto = new NoticeDto();
		Notice notice = getNoticeDetailByNoticeNo(noticeNo);
		notice.setViewCount(notice.getViewCount() + 1);
		updateNotice(notice);
		List<NoticeCategory> noticeCategories = getAllNoticeCategories();
		
		BeanUtils.copyProperties(notice, dto);
		for (NoticeCategory category : noticeCategories) {	
			if (category.getCategoryNo() == dto.getCategoryNo()) {
				dto.setCategoryName(category.getName());
			}
		}
		if (getNoticeImageByNoticeNo(dto.getNo()) != null) {
			dto.setImage(getNoticeImageByNoticeNo(dto.getNo()).getImage());
		}
		return dto;
	}
}

















