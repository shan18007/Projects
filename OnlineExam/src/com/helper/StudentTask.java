package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;


import config.Database;
import mybeans.Exam;
import mybeans.ExamPaper;
import mybeans.Subject;
import mybeans.Users;

public class StudentTask {
		
	Database dbDatabase = new Database();
	Connection con = dbDatabase.getConnection();

	// Student Profile by users Bean
	public Users studentProfile(String unm) {
		Users users = null;
		ResultSet rSet;
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement("select * from user_info as u join user as ur where u.username=ur.username and u.username=?");
			pstmt.setString(1, unm);
			rSet = pstmt.executeQuery();

			if (rSet.next()) {
				users = new Users(rSet.getInt("org_id"), rSet.getInt("user_info_id"), rSet.getString("username"),
						rSet.getString("full_name"), rSet.getString("sem"), rSet.getString("email"),
						rSet.getString("mob_no"), rSet.getDate("reg_date"),rSet.getString("password"));
				return users;
			}
		} catch (Exception e) {
			e.toString();
		}
		return users;
	}

	// This method returns the Exams by Organizers and sem
	public ArrayList<Exam> getExam(int oid, String sem) {
		Exam exam = null;
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<Exam> list = new ArrayList<Exam>();
		try {
			pstmt = con.prepareStatement("select * from exam where org_id=? and sem=?");
			pstmt.setInt(1, oid);
			pstmt.setString(2, sem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				exam = new Exam();
				exam.setExamID(rs.getInt("ex_id"));
				exam.setExamname(rs.getString("exam_name"));
				exam.setOrgid(rs.getInt("org_id"));
				exam.setSem(rs.getString("sem"));
				exam.setUsername(rs.getString("username"));
				exam.setYear(rs.getInt("year"));
				exam.setExamstatus(rs.getString("exam_status"));
				list.add(exam);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	// this method returns all subject by using Exam_id
	public ArrayList<Subject> getSubjects(int ex_id) {
		Subject subject;
		PreparedStatement pstmt;
		ResultSet rSet;
		ArrayList<Subject> list = new ArrayList<Subject>();
		try {
			pstmt = con.prepareStatement("select * from subjects where ex_id=? and sub_status='PENDING' order by sub_date,sub_time");
			pstmt.setInt(1, ex_id);
			rSet = pstmt.executeQuery();
			while (rSet.next()) {
				subject = new Subject(rSet.getInt("sub_id"), rSet.getInt("ex_id"), rSet.getInt("org_id"),
						rSet.getString("sub_name"), rSet.getString("sub_date"), rSet.getString("sub_time"),
						rSet.getInt("duration"), rSet.getInt("min_marks"), rSet.getInt("max_marks"));
				list.add(subject);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}
	
	// this method returns todays subject by using Exam_id and todays date
	public ArrayList<ExamPaper> getTodaySubjects(int orgID,String sem) {
		ExamPaper examPaper;
		PreparedStatement pstmt;
		ResultSet rSet;
		
		SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
			
		ArrayList<ExamPaper> list = new ArrayList<ExamPaper>();
		try {
			Date date = new Date();
			String todayDtStr = outputFormat.format(date);
		
			pstmt = con.prepareStatement("select e.ex_id,e.exam_name,e.year,e.sem,e.exam_status,s.sub_id,s.sub_name,s.sub_date,s.sub_time,s.duration,s.min_marks,s.max_marks,s.sub_status from exam e,subjects s where e.org_id=? and e.ex_id=s.ex_id and e.sem=? and s.sub_date=? and s.sub_status='PENDING' order by s.sub_date,s.sub_time limit 1");
			pstmt.setInt(1, orgID);
			pstmt.setString(2, sem);
			pstmt.setString(3, todayDtStr);
			rSet = pstmt.executeQuery();
			while (rSet.next()) {
				examPaper = new ExamPaper();
				examPaper.setExamID(rSet.getInt("ex_id"));
				examPaper.setExamname(rSet.getString("exam_name"));
				examPaper.setYear(rSet.getInt("year")); 
				examPaper.setSem(rSet.getString("sem"));
				examPaper.setSub_id(rSet.getInt("sub_id"));
				examPaper.setSubName(rSet.getString("sub_name"));
				examPaper.setSubDate(rSet.getString("sub_date"));
				examPaper.setSubTime(rSet.getString("sub_time"));
				examPaper.setDuration(rSet.getInt("duration"));
				examPaper.setMinMarks(rSet.getInt("min_marks"));
				examPaper.setMaxMarks(rSet.getInt("max_marks"));
				list.add(examPaper);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}
	
	
	public  String  InsertAnswer(int exID,int subID,int userID,int queID,String ans,String ansStatus) {
		PreparedStatement pStatement;
		try {
			pStatement = con.prepareStatement("insert into user_ansers(ex_id,sub_id,user_id,que_id,ans,ans_status) values(?,?,?,?,?,?)");
			pStatement.setInt(1, exID);
			pStatement.setInt(2, subID);
			pStatement.setInt(3, userID);
			pStatement.setInt(4, queID);
			pStatement.setString(5, ans);
			pStatement.setString(6, ansStatus);
			
			int i = pStatement.executeUpdate();
			if(i>0) {
				return "success";
			}
			else {
				return "fail";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
		
		
	}
	

	public String checkDate(String dt) {
		LocalDate myObj = LocalDate.now();
		String dtToday = myObj.toString();
		if (dt.equals(dtToday)) {
			return "success";
			// return d2;
		} else {
			return "fail";
			// return d2;
		}
	}
}


