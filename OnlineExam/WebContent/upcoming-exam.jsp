
<%
	if (session.getAttribute("username") != null) {
%>
<%@page import="com.helper.OrgSuppport"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>
<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.Subject"%>


<meta name="viewport" content="width=device-width, initial-scale=1">


<hr>

<%
	StudentTask stask = new StudentTask();

String uname = (String) session.getAttribute("username");
Users std = stask.studentProfile(uname);
String sem = std.getSem();

int orgID = std.getOrgid();
ArrayList<Exam> list = stask.getExam(orgID, sem);
Exam exam;
if (list.size() > 0) {

	for (int i = 0; i < list.size(); i++) {
		exam = (Exam) list.get(i);
%>


<div class="col text-center">

	<h3 class="text-align-left">
		Exam Name:
		<%=exam.getExamname()%>
	</h3>
	<h4>
		Year :
		<%=exam.getYear()%>
	</h4>
	<h4>
		Semester :
		<%=exam.getSem()%>
	</h4>


</div>
<div
	class="card align-items-center m-auto col-lg-10 col-md-8 col-sm-12 col-xsm-12">

	<table
		class="table table-hover table-bordered col-lg-10 col-md-8 col-sm-6 col-xs-4 text-center mt-2 mb-2">

		<%
			ArrayList<Subject> sublist = stask.getSubjects(exam.getExamID());
		Subject subject;
		if (sublist.size() > 0) {
		%>


		<tr class="bg-secondary text-white">
			<th>Subject Name</th>
			<th>Date</th>
			<th>Time</th>
			<th>Duration</th>
			<th>Minimum Marks</th>
			<th>Maximum Marks</th>
		</tr>


		<%
			for (int j = 0; j < sublist.size(); j++) {
			subject = (Subject) sublist.get(j);
			String subtm = OrgSuppport.getTimeinAMPM(subject.getSubTime());
		%>
		<tr>
			<td><%=subject.getSubName()%></td>
			<td><%=subject.getSubDate()%></td>
			<td><%=subtm%></td>
			<td><%=subject.getDuration()%></td>
			<td><%=subject.getMinMarks()%></td>
			<td><%=subject.getMaxMarks()%></td>
		</tr>
		<%
			}

		}

		else {
		%>
		<td>No Subject Added</td>
		<%
			}
		%>
	</table>
</div>
<br>
<%
	}

} else {
%>
<h1>No Exam Added</h1>
<%
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
