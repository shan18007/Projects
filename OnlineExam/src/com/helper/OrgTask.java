package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import config.Database;
import mybeans.Exam;
import mybeans.PdfResult;
import mybeans.Question;
import mybeans.Subject;
import mybeans.SubjectDetail;

public class OrgTask {

	Database mydb = new Database();
	Connection con = mydb.getConnection();

	// This method add exam in database by organizers
	public String addExam(String ex_name, int o_id, int year, String sem, String unm) {
		try {
			PreparedStatement pstmt = con
					.prepareStatement("insert into exam(exam_name,org_id, year,sem,username) values(?,?,?,?,?)");
			pstmt.setString(1, ex_name);
			pstmt.setInt(2, o_id);
			pstmt.setInt(3, year);
			pstmt.setString(4, sem);
			pstmt.setString(5, unm);
			int i = pstmt.executeUpdate();
			if (i > 0) {

				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}

	}

	// This method returns the Created Exams by Organizers
	public ArrayList<Exam> getExamDetails(int oid) {
		Exam exam = null;
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<Exam> list = new ArrayList<Exam>();
		try {
			pstmt = con.prepareStatement("select * from exam where org_id=?");
			pstmt.setInt(1, oid);
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
				exam.setDisplayStatus(rs.getString("display_result"));
				list.add(exam);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}

		return list;
	}


	// This returns the FINISH Exams and Result is declared by Organizers
	public ArrayList<Exam> getExamForDownloadResult(int oid) {
		Exam exam = null;
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<Exam> list = new ArrayList<Exam>();
		try {
			pstmt = con.prepareStatement("select * from exam where org_id=? and exam_status='FINISH'");
			pstmt.setInt(1, oid);
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
				exam.setDisplayStatus(rs.getString("display_result"));
				list.add(exam);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}

		return list;
	}

	// This method returns the Created Exams and subject by Organizers
	public ArrayList<SubjectDetail> getExamSubjectDetails(int oid) {
		SubjectDetail subdetail = null;
		PreparedStatement pstmt;
		ResultSet rs;
		ArrayList<SubjectDetail> list = new ArrayList<SubjectDetail>();
		try {
			pstmt = con.prepareStatement(
					"select exam.ex_id,exam.exam_name,subjects.sub_id,subjects.sub_name from exam join subjects where exam.ex_id=subjects.ex_id and subjects.org_id=?");
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				subdetail = new SubjectDetail(rs.getInt("ex_id"), rs.getString("exam_name"), rs.getInt("sub_id"),
						rs.getString("sub_name"));
				list.add(subdetail);
			}
			pstmt.close();
		} catch (Exception e) {
			e.toString();
		}

		return list;
	}

	// Delete Exam from Database
	public String deleteExam(int exID) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("delete from exam where ex_id=?");

			pst.setInt(1, exID);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	// Delete Question from Database
	public String deleteQuestion(int queID) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("delete from question where que_id=?");

			pst.setInt(1, queID);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	// method to add subject
	public String addSubject(int orgId, int exId, String subName, String subDate, String subTime, int duration,
			int minMark, int maxMark) {

		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

		try {
			Date date = inputFormat.parse(subDate);
			String outputDateStr = outputFormat.format(date);
			//String subtm = OrgSuppport.getTimeinAMPM(subTime); 
			PreparedStatement pstmt = con.prepareStatement(
					"insert into subjects(org_id,ex_id,sub_name,sub_date,sub_time,duration,min_marks,max_marks) values(?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, orgId);
			pstmt.setInt(2, exId);
			pstmt.setString(3, subName);
			pstmt.setString(4, outputDateStr);
			pstmt.setString(5, subTime);
			pstmt.setInt(6, duration);
			pstmt.setInt(7, minMark);
			pstmt.setInt(8, maxMark);
			int i = pstmt.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	// this method returns all subject by using Exam_id
	public ArrayList<Subject> getSubjectDetails(int ex_id) {
		Subject subject;
		PreparedStatement pstmt;
		ResultSet rSet;
		ArrayList<Subject> list = new ArrayList<Subject>();
		try {
			pstmt = con.prepareStatement("select * from subjects where ex_id=? order by sub_date,sub_time");
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

	// this method returns all subject by using org_id
	public ArrayList<Subject> getSubjectDetailsByOrg(int org_id) {
		Subject subject;
		PreparedStatement pstmt;
		ResultSet rSet;
		ArrayList<Subject> list = new ArrayList<Subject>();
		try {
			pstmt = con.prepareStatement("select * from subjects where org_id=? order by sub_date,sub_time");
			pstmt.setInt(1, org_id);
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

	// return organization name name by orgID
	public String getOrgName(int orgID) {
		PreparedStatement pr;
		ResultSet rs = null;
		String orgName="";
		try {
			pr = con.prepareStatement("select org_name from organizers where org_id=?");
			pr.setInt(1, orgID);
			rs = pr.executeQuery();
			if (rs.next()) {
				orgName =rs.getString(1);
				return orgName;
			}
		} catch (Exception e) {
			return e.toString();
		}
		return orgName;
	}

	// Delete subject from Database
	public String deleteSubject(int subID) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("delete from subjects where sub_id=?");

			pst.setInt(1, subID);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	// method to add Question
	public String addQuestion(int orgId, int exId, int subId, String question, String op1, String op2,
			String op3, String op4, String corrAns) {
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(
					"insert into question(org_id,ex_id,sub_id,question,op1,op2,op3,op4,correct_op) values(?,?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, orgId);
			pstmt.setInt(2, exId);
			pstmt.setInt(3, subId);
			pstmt.setString(4, question);
			pstmt.setString( 5 , op1);
			pstmt.setString(6, op2);
			pstmt.setString( 7, op3);
			pstmt.setString(8, op4);
			pstmt.setString(9, corrAns);
			int i = pstmt.executeUpdate();
			pstmt.close();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	public ArrayList<Question> getQuestions(int subID) {
		PreparedStatement pstmt;
		ArrayList<Question> list = new ArrayList<Question>();
		Question question;
		ResultSet rSet;
		try {
			pstmt = con.prepareStatement("select * from question where sub_id=?");
			pstmt.setInt(1, subID);
			rSet = pstmt.executeQuery();
			while (rSet.next()) {
				question = new Question(rSet.getInt("org_id"), rSet.getInt("ex_id"), rSet.getInt("sub_id"),
						rSet.getInt("que_id"), rSet.getString("question"), rSet.getString("op1"),
						rSet.getString("op2"), rSet.getString("op3"), rSet.getString("op4"), rSet.getString("correct_op"));
				list.add(question);
			}
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	public int getSubMark(int subId) {
		PreparedStatement pstmt;
		ResultSet rs;
		int maxMarks = 0;
		try {
			pstmt = con.prepareStatement("Select max_marks from subjects where sub_id=?");
			pstmt.setInt(1, subId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxMarks = rs.getInt(1);
			}
		} catch (Exception e) {
			{
				e.getMessage();
			}

		}
		return maxMarks;
	}

	//This methods data is used to create PDF as Result of conducted exam for organizer
	
	public ArrayList<PdfResult> getresultForPdf(int orgId,int examID){
		PreparedStatement pstmt;
		ArrayList<PdfResult> list = new ArrayList<PdfResult>();
		PdfResult pdfresult;
		ResultSet rSet;
		try {
			pstmt=con.prepareStatement("select * from pdfresult where org_id=? and ex_id=?");
			pstmt.setInt(1, orgId);
			pstmt.setInt(2, examID);
			rSet = pstmt.executeQuery();
			while(rSet.next()) {
				pdfresult = new PdfResult(rSet.getInt("org_id"), rSet.getString("exam_name"), rSet.getString("year"), rSet.getString("sem"), rSet.getFloat("obtain_marks"), rSet.getFloat("percentage"), rSet.getString("result_status"), rSet.getString("full_name"));
				list.add(pdfresult);
			}
		} catch (Exception e) {
			
			e.toString();
		}
		return list;
	}
 
}  
