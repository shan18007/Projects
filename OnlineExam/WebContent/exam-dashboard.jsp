
<%
	if (session.getAttribute("username") != null) {
%>
<%@page import="com.helper.ExamTask"%>
<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>
<%
	String unm = (String) session.getAttribute("username");

int totalque = Integer.parseInt(request.getParameter("totalQue"));
int exId = Integer.parseInt(request.getParameter("ex_id"));
int subId = Integer.parseInt(request.getParameter("sub_id"));

int minMarks = (Integer) session.getAttribute("minMarks");
int maxMarks = (Integer) session.getAttribute("maxMarks");
session.removeAttribute("minMarks");
session.removeAttribute("maxMarks");

ExamTask ob = new ExamTask();
String res = "";
for (int i = 0; i < totalque; i++) {
	int queId = Integer.parseInt(request.getParameter("qid" + i));
	String ans = request.getParameter("ans" + i);

	res = ob.insertAnswer(unm, exId, subId, queId, ans, totalque, maxMarks);
	//out.print(queId + "---" + ans + ","+res+" ");
}

ob.changeSubstatus(subId);
ob.attendance(exId, subId, unm);
ob.changeExamStatus(exId);
String rr = ob.evaluteMarks(exId, subId, unm, minMarks);
//out.println(rr);

if (res.equals("success")) {

	//out.println("Result submitted successfully");
	response.sendRedirect("redirect-page.jsp");
} else {
	out.println("Result not submitted");

}
%>
<%
	} else {

session.setAttribute("logmsg", "You are not logged in Please log in First");
%>

<%@include file="index.jsp"%>
<%
	}
%>