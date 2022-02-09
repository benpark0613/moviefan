package com.jhta.moviefan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jhta.moviefan.form.Criteria;
import com.jhta.moviefan.vo.Notice;
import com.jhta.moviefan.vo.NoticeCategory;
import com.jhta.moviefan.vo.NoticeImage;

@Mapper
public interface NoticeDao {

	void insertNotice(Notice notice);
	void updateNotice(Notice notice);
	int getNoticeTotalRows(Criteria criteria);
	Notice getNoticeDetailByNo(int no);
	List<Notice> getAllNoticeList();
	List<Notice> searchNoticeList(Criteria criteria);
//	List<Notice> searchNoticeListByTitle(String title);
//	List<Notice> searchNoticeListByContent(String content);
	
	void insertNoticeImage(NoticeImage image);
	NoticeImage getNoticeImageByNo(int no);
	
	List<NoticeCategory> getAllNoticeCategories();
	
	
}
