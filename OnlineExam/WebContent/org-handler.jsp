
<%
	if (session.getAttribute("username") != null) {
%>


<%@page import="com.helper.PdfGenerator"%>
<%@page import="mybeans.PdfResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="com.util.MailBean"%>
<%@page import="com.helper.ExamTask"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.helper.AdminTask"%>
<%@page import="com.helper.OrgTask"%>

<%
	OrgTask orgOB = new OrgTask();

String msg = "";
String prt = request.getParameter("prt");
String unm;
String status;
String res;
String resmsg;
int orgID;
int examID;
int subID;
AdminTask mngOB = new AdminTask();
int o_id = (Integer) session.getAttribute("org_id");

if (prt.equals("add-exam")) {
	String exName = request.getParameter("exam_name");
	int year = Integer.parseInt(request.getParameter("year"));
	String sem = request.getParameter("sem");
	unm = (String) session.getAttribute("username");

	String result = orgOB.addExam(exName, o_id, year, sem, unm);

	if (result.equals("success")) {
		msg = "Exam added successfully";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-exam&alert=success");
	} else if (result.equals("fail")) {
		msg = "course already exist";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-exam&alert=fail");
	}

} else if (prt.equals("mng-user")) {

	unm = request.getParameter("unm");
	status = request.getParameter("status");
	res = mngOB.changeAccStatus(status, unm);
	if (res.equals("success")) {

		resmsg = "Account " + status.toLowerCase() + " successfull.";
		session.setAttribute("message", resmsg);

		response.sendRedirect("org-dashboard.jsp?pgprt=view-user&alert=success");
	} else {
		session.setAttribute("message", "Account status Change Failed");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-user&alert=fail");
	}
} else if (prt.equals("delete-user")) {
	unm = request.getParameter("unm");
	res = mngOB.deleteAcc(unm);
	if (res.equals("success")) {
		session.setAttribute("message", "Account Deleted Successfully.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-user&alert=success");
	} else {
		session.setAttribute("message", "Failed to Delete Account.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-user&alert=fail");
	}
} else if (prt.equals("change-pass")) {
	unm = (String) session.getAttribute("username");
	String Pwd = request.getParameter("old_pass");
	String confPwd = request.getParameter("conf_pass");
	//first validate old password
	res = mngOB.validatePassword(unm, Pwd);
	if (res.equals("success")) {
		//if old pwd correct new pwd will be update.
		res = mngOB.changePass(unm, confPwd);
		if (res.equals("success")) {
	session.setAttribute("message", "Password Changed Successfully.");

	response.sendRedirect("org-dashboard.jsp?pgprt=change-pass&alert=success");
		} else {
	session.setAttribute("message", "Failed to Change Password.");

	response.sendRedirect("org-dashboard.jsp?pgprt=change-pass&alert=fail");
		}
	} else {

		session.setAttribute("message", "Old Password is incorrect.");

		response.sendRedirect("org-dashboard.jsp?pgprt=change-pass&alert=fail");
	}

} else if (prt.equals("add-subject")) {
	int exId = Integer.parseInt(request.getParameter("ex_id"));
	String s_name = request.getParameter("sub_name");
	String inpstrDt = (String) request.getParameter("sub_date");

	String time = request.getParameter("sub_time");
	int duration = Integer.parseInt(request.getParameter("duration"));
	int minMark = Integer.parseInt(request.getParameter("min_marks"));
	int maxMark = Integer.parseInt(request.getParameter("max_marks"));

	res = orgOB.addSubject(o_id, exId, s_name, inpstrDt, time, duration, minMark, maxMark);

	if (res.equals("success")) {
		msg = "Subject added successfully";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-subject&alert=success");
	} else if (res.equals("fail")) {
		msg = "subject already exist";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-subject&alert=fail");
	}
}

else if (prt.equals("delete-exam")) {
	int exId = Integer.parseInt(request.getParameter("exID"));
	res = orgOB.deleteExam(exId);
	if (res.equals("success")) {
		session.setAttribute("message", "Exam Deleted Successfully.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-exam&alert=success");
	} else {
		session.setAttribute("message", res);

		response.sendRedirect("org-dashboard.jsp?pgprt=view-exam&alert=fail");
	}
}

else if (prt.equals("delete-subject")) {
	int subId = Integer.parseInt(request.getParameter("subID"));
	res = orgOB.deleteSubject(subId);
	if (res.equals("success")) {
		session.setAttribute("message", "Subject Deleted Successfully.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-exam&alert=success");
	} else {
		session.setAttribute("message", "Failed to Delete Subject.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-exam&alert=fail");
	}
}

else if (prt.equals("delete-question")) {
	int exId = Integer.parseInt(request.getParameter("exID"));
	res = orgOB.deleteQuestion(exId);
	if (res.equals("success")) {
		session.setAttribute("message", "Question Deleted Successfully.");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-question&alert=success");
	} else {
		session.setAttribute("message", "Failed to Delete Question");

		response.sendRedirect("org-dashboard.jsp?pgprt=view-question&alert=fail");
	}
} else if (prt.equals("declare-result")) {
	int exId = Integer.parseInt(request.getParameter("exam_id"));
	ExamTask etask = new ExamTask();
	res = etask.calculateResult(exId);
	if (res.equals("success")) {
		session.setAttribute("message", "Result Declared Successfully.");

		response.sendRedirect("org-dashboard.jsp?pgprt=mng-result&alert=success");
	} else {
		session.setAttribute("message", "Exam Not Finish Yet.");

		response.sendRedirect("org-dashboard.jsp?pgprt=mng-result&alert=fail");
	}
} else if (prt.equals("forgot-pass")) {
	String email = request.getParameter("email");
	MailBean mailBean = new MailBean();
	Random random = new Random();
	int otp = random.nextInt(999999);
	res = mailBean.sendMail(email, "Forgot Password", "Your OTP for Forgot Password is: " + otp);
	if (res.equals("Message Sent")) {
		out.print("OTP Generated" + otp);
	} else {
		out.print("OTP failed");
	}
}

else if (prt.equals("display-result")) {
	int exId = Integer.parseInt(request.getParameter("exam_id"));
	String dispStatus = request.getParameter("status");
	String inpStat = "";
	if (dispStatus.equals("Show")) {
		inpStat = "TRUE";
	} else if (dispStatus.equals("Hide")) {
		inpStat = "FALSE";
	}

	ExamTask etask = new ExamTask();
	res = etask.changeExamDisplayStatus(exId, inpStat);
	if (res.equals("success")) {
		session.setAttribute("message", "Display Result changed to " + dispStatus + ".");

		response.sendRedirect("org-dashboard.jsp?pgprt=mng-result&alert=success");
	} else {
		session.setAttribute("message", "Failed to change Display Status.");

		response.sendRedirect("org-dashboard.jsp?pgprt=mng-result&alert=fail");
	}
} else if (prt.equals("add-question")) {
	orgID = (Integer) session.getAttribute("org_id");
	examID = Integer.parseInt(request.getParameter("exam_id"));
	subID = Integer.parseInt(request.getParameter("subject_id"));
	String que = request.getParameter("que");
	String op1 = request.getParameter("op1");
	String op2 = request.getParameter("op2");
	String op3 = request.getParameter("op3");
	String op4 = request.getParameter("op4");
	String correctAns = request.getParameter("correct_ans");

	//if(orgOB.getMarkSum(orgID,examID,subID) < orgOB.getSubMark(subID)){
	String result = orgOB.addQuestion(orgID, examID, subID, que.trim(), op1.trim(), op2.trim(), op3.trim(), op4.trim(),
	correctAns.trim());

	if (result.equals("success")) {
		msg = "Question added successfully";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-question&alert=success");
	} else if (result.equals("fail")) {
		msg = "Question already exist";
		session.setAttribute("message", msg);
		response.sendRedirect("org-dashboard.jsp?pgprt=add-question&alert=fail");
	}
	//}
	//else{

	//	msg="Subject Marks Overflow";
	//	session.setAttribute("message",msg);
	//	response.sendRedirect("org-dashboard.jsp?pgprt=add-question&alert=fail");

	//}

} else {

}
%>

<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>
