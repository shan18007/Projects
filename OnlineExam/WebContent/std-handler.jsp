
<%
	if (session.getAttribute("username") != null) {
%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.helper.PdfGenerator"%>
<%@page import="mybeans.PdfResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.OrgTask"%>
<%@page import="com.helper.ExamTask"%>
<%@page import="com.helper.AdminTask"%>
<%
	String msg = "";
String prt = request.getParameter("prt");
String unm;
String status;
String res;
String resmsg;

AdminTask mngOB = new AdminTask();

if (prt.equals("change-pass")) {
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

	response.sendRedirect("std-dashboard.jsp?pgprt=change-pass&alert=success");
		} else {
	session.setAttribute("message", "Failed to Change Password.");

	response.sendRedirect("std-dashboard.jsp?pgprt=change-pass&alert=fail");
		}
	} else {

		session.setAttribute("message", "Old Password is incorrect.");

		response.sendRedirect("std-dashboard.jsp?pgprt=change-pass&alert=fail");
	}

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
