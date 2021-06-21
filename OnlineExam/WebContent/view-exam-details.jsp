
<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<%@page import="com.helper.OrgSuppport"%>
<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.helper.OrgTask"%>
<%@page import="mybeans.Subject"%>




<div class="container m-auto  pt-3 pb-3">
	<h1 class="text-center">Exams</h1>
	<hr>





	<%
		OrgTask orgObject = new OrgTask();
	int oid = (Integer) session.getAttribute("org_id");
	ArrayList<Exam> list = orgObject.getExamDetails(oid);
	Exam exam;
	if (list.size() > 0) {

		for (int i = 0; i < list.size(); i++) {
			exam = (Exam) list.get(i);
	%>

	<div class="card align-items-center">


		<h3 class="card-title"><%=exam.getExamname()%>
		</h3>
		<div class="d-flex justify-content-start">
			<h4 class="text-align-left">
				Year :
				<%=exam.getYear()%></h4>
		</div>
		<h4>
			Semester :
			<%=exam.getSem()%><span> Status : <%=exam.getExamstatus()%></span>
		</h4>
		<br>


		<table
			class="table table-hover table-bordered col-lg-8 col-md-6 col-sm-4 col-xs-4 mt-4 mb-4 text-center">



			<%
				ArrayList<Subject> sublist = orgObject.getSubjectDetails(exam.getExamID());
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
			<div class="alert alert-danger m-auto p-3 w-50 text-center"
				role="alert">No Subject Added</div>
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
</div>


<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>
