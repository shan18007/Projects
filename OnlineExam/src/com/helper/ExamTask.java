package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Database;
import mybeans.Exam;
import mybeans.ResultExam;
import mybeans.ResultSubjects;

public class ExamTask {

	Database mydb = new Database();
	Connection con = mydb.getConnection();
	int mark = 0;

	public String insertAnswer(String unm, int ex_id, int sub_id, int que_id, String ans, int totalQue, int maxMarks) {

		PreparedStatement pst;
		PreparedStatement pst1;
		ResultSet rs;
		int markFor_1que = maxMarks / totalQue;

		String ansStatus = "wrong";
		try {
			pst = con.prepareStatement("select que_id,correct_op from question where que_id=?");
			pst.setInt(1, que_id);
			rs = pst.executeQuery();
			if (rs.next()) {
				if (ans.equals(rs.getString("correct_op"))) {
					mark = mark + markFor_1que;
					ansStatus = "correct";
				}
			}
			pst1 = con.prepareStatement(
					"insert into user_answers(ex_id,sub_id,username,que_id,ans,ans_status) values(?,?,?,?,?,?)");
			pst1.setInt(1, ex_id);
			pst1.setInt(2, sub_id);
			pst1.setString(3, unm);
			pst1.setInt(4, que_id);
			pst1.setString(5, ans);
			pst1.setString(6, ansStatus);
			int exStat = pst1.executeUpdate();
			if (exStat > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return e.toString();
		}
	}

	public String changeSubstatus(int sub_id) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("update subjects set sub_status='FINISH' where sub_id=?");
			pst.setInt(1, sub_id);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "S";
			} else {
				return "F";
			}
		} catch (Exception e) {
			return e.toString();
		}

	}

	public String attendance(int exID, int subID, String unm) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("insert into attend_exam(ex_id,sub_id,username,attend_status) values(?,?,?,?)");
			pst.setInt(1, exID);
			pst.setInt(2, subID);
			pst.setString(3, unm);
			pst.setString(4, "ATTEND");
			int i = pst.executeUpdate();
			if (i > 0) {
				return "S";
			} else {
				return "F";
			}
		} catch (Exception e) {
			return e.toString();
		}
	}

	public String evaluteMarks(int exID, int subID, String unm, int minMarks) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(
					"insert into evaluation(ex_id,sub_id,username,obtain_marks,subject_status) values(?,?,?,?,?)");
			pst.setInt(1, exID);
			pst.setInt(2, subID);
			pst.setString(3, unm);
			pst.setInt(4, mark);
			if (mark >= minMarks) {
				pst.setString(5, "PASS");
			} else {
				pst.setString(5, "FAIL");
			}

			int i = pst.executeUpdate();
			if (i > 0) {
				return "S";
			} else {
				return "F";
			}
		} catch (Exception e) {
			return e.toString();
		}
	}

	public String calculateResult(int examID) {
		int sum = getSubjectMarkSum(examID);
		PreparedStatement pst;
		ResultSet rs;
		float p = 0;
		String unm = "";
		String failUsername;
		String status;
		float obtainMarks = 0;
		String returnMsg = "";
		try {
			pst = con.prepareStatement(
					"select distinct(username),sum(obtain_marks) from evaluation where ex_id=? group by username");
			pst.setInt(1, examID);
			rs = pst.executeQuery();
			while (rs.next()) {
				unm = rs.getString(1);
				obtainMarks = rs.getInt(2);
				p = (obtainMarks / sum) * 100;

				failUsername = getFailStudenName(examID);
				if (unm.equals(failUsername)) {
					status = "FAIL";
				} else {
					status = "PASS";
				}
				pst = con.prepareStatement(
						"insert into result(percentage,ex_id,username,obtain_marks,total_marks,result_status) values(?,?,?,?,?,?)");
				pst.setFloat(1, p);
				pst.setInt(2, examID);
				pst.setString(3, unm);
				pst.setFloat(4, obtainMarks);
				pst.setFloat(5, sum);
				pst.setString(6, status);
				int j = pst.executeUpdate();
				if (j > 0) {
					returnMsg = "success";
				} else {
					returnMsg = "fail";
				}
			}
			return returnMsg;
		} catch (Exception e) {
			return e.toString();
		}
	}

	// change the exam status if all subject status is finish
	public String changeExamStatus(int examID) {
		String sub_stat;
		PreparedStatement pst;
		try {
			
			pst = con.prepareStatement(
					"select * from subjects where ex_id=? and sub_status=?");
			pst.setInt(1, examID);
			pst.setString(2, "PENDING");
			ResultSet rSet = pst.executeQuery();
			if (rSet.next()) {
				sub_stat = "PENDING";
				return sub_stat;
			} else {
				sub_stat = "FINISH";
				pst = con.prepareStatement("update exam set exam_status=? where ex_id=?");
				pst.setString(1, sub_stat);
				pst.setInt(2, examID);
				int k = pst.executeUpdate();
				if (k > 0) {
					return "s";
				}
				return "FINISH";
			}
		} catch (Exception e) {
			return e.toString();
		}

	}

	public int getSubjectMarkSum(int examID) {

		PreparedStatement pst;
		int sum = 0;
		try {
			pst = con.prepareStatement("select sum(max_marks) from subjects where ex_id=?");
			pst.setInt(1, examID);
			ResultSet rSet = pst.executeQuery();
			if (rSet.next()) {
				sum = rSet.getInt(1);
				return sum;
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return sum;
	}

	public String getFailStudenName(int examID) {

		PreparedStatement pst;
		String name = "";
		try {
			pst = con.prepareStatement(
					"select distinct(username) from evaluation where ex_id=? and subject_status='FAIL'");
			pst.setInt(1, examID);
			ResultSet rSet = pst.executeQuery();
			if (rSet.next()) {
				name = rSet.getString(1);
				return name;
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return name;
	}

	public String changeExamDisplayStatus(int examID, String status) {
		PreparedStatement pst;

		try {
			pst = con.prepareStatement("update exam set display_result=? where ex_id=?");
			pst.setString(1, status);
			pst.setInt(2, examID);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return e.toString();
		}
	}

	public String checkResultDeclareStatus(int examID) {
		PreparedStatement pst;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("select * from result where ex_id=?");
			pst.setInt(1, examID);
			rs = pst.executeQuery();
			if (rs.next()) {
				return "declared";
			} else {
				return "not-declare";
			}
		} catch (Exception e) {
			return e.toString();
		}

	}


// This method returns the exam by org id and sem
public ArrayList<Exam> getExamsBySem(int oid,String sem) {
	Exam exam = null;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<Exam> list = new ArrayList<Exam>();
	try {
		pstmt = con.prepareStatement("select * from exam where org_id=? and sem=? and exam_status='FINISH'");
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
			exam.setDisplayStatus(rs.getString("display_result"));
			list.add(exam);
		}
		pstmt.close();
	} catch (Exception e) {
		e.toString();
	}

	return list;
}


//this method returns exam result final
public ArrayList<ResultExam> getResultExamDetails(int exID,String unm) {
	ResultExam resultexam = null;
	PreparedStatement pst;
	ResultSet rs;
	ArrayList<ResultExam> list = new ArrayList<ResultExam>();
	try {
		pst = con.prepareStatement(""
				+ "select e.exam_name,e.sem,r.obtain_marks,r.total_marks,r.percentage,r.result_status from exam as e join result as r where e.ex_id=r.ex_id and r.ex_id=? and r.username=?");
		pst.setInt(1, exID);
		pst.setString(2, unm);
		rs = pst.executeQuery();
		while (rs.next()) {
			resultexam =new ResultExam(rs.getString("exam_name"),rs.getString("sem") ,rs.getFloat("obtain_marks"), rs.getFloat("total_Marks"), rs.getFloat("percentage"), rs.getString("result_status"));
			System.out.println("Object"+resultexam);
			list.add(resultexam);
		}
		return list;
	}catch (Exception e) {
	e.toString();
	}
return list;
}

public ArrayList<ResultSubjects> getResultSubjects(int exID,String unm) {
	ResultSubjects resultsubjects = null;
	PreparedStatement pstmt;
	ResultSet rs;
	ArrayList<ResultSubjects> list = new ArrayList<ResultSubjects>();
	try {
		pstmt = con.prepareStatement("select distinct s.sub_id,s.sub_name,s.min_marks,s.max_marks,ev.obtain_marks from subjects as s JOIN evaluation as ev JOIN result as r where ev.sub_id=s.sub_id and ev.ex_id=r.ex_id and s.ex_id=? and ev.username=?");
		pstmt.setInt(1, exID);
		pstmt.setString(2, unm);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			resultsubjects =new ResultSubjects(rs.getString("sub_name"),rs.getInt("min_marks"),rs.getInt("max_marks"),rs.getInt("obtain_marks"));
			list.add(resultsubjects);
		}	
	}catch (Exception e) {
	e.toString();
	}
return list;
}
}

