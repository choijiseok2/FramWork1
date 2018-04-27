package notice.model.service;

import java.util.*;
import java.sql.*;
import java.sql.Date;

import static common.JDBCTemplate.*;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	
	public NoticeService() {}
	
	public List<Notice> selectTop3List() {
		return new NoticeDao().selectTop3List();
	}

	
	public List<Notice> selectList() {
		
		
		return new NoticeDao().selectList();
	}
	
	public Notice selectNotice(int noticeNo) {
				
		return  new NoticeDao().selectNotice(noticeNo);
	}
	
	public int insertNotice(Notice notice) {
	
		return  new NoticeDao().insertNotice(notice);
	}
	
	public int updateNotice(Notice notice) {
		

		return new NoticeDao().updateNotice(notice);
	}

	public int deleteNotice(int noticeNo) {
	

		
		return new NoticeDao().deleteNotice(noticeNo);
	}
	
	public List<Notice> selectSearchTitle(String keyword) {
		Connection con = getConnection();
		List<Notice> list = new NoticeDao().selectSearchTitle(con, keyword);
		close(con);
		
		return list;
	}
	
	public List<Notice> selectSearchDate(Date start, Date end) {
		
		Connection con = getConnection();
		List<Notice> list = new NoticeDao().selectSearchDate(con, start, end);
		close(con);
		
		return list;
	}
	
	public List<Notice> selectSearchWriter(String keyword) {
		
		Connection con = getConnection();
		List<Notice> list = new NoticeDao().selectSearchWriter(con, keyword);
		close(con);
		
		return list;
	}

}
