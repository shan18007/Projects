<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">


<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.helper.OrgTask"%>

<div class="container  text-center m-auto  pt-4 pb-4">


	

		<%
			OrgTask aTask = new OrgTask();

		int oid = (Integer) session.getAttribute("org_id");
		ArrayList<Exam> list = aTask.getExamDetails(oid);
		Exam exam;
		if (list.size() > 0) {
		%>
		<table
		class="table text-center align-items-centertable-hover table-bordered col-lg-8 col-md-6 col-sm-4 col-xs-3 m-auto">

		<tr>
			<td colspan="10" class="text-center bg-info p-3 h4 text-white">Exams</td>
		</tr>
			<tr class="bg-secondary text-white">
			<th>Exam Name</th>
			<th>Year</th>
			<th>Semester</th>
			<th>Exam Status</th>
			<th colspan="2">Action</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
			exam = (Exam) list.get(i);
		%>


		<tr>
			<td><%=exam.getExamname()%></td>
			<td><%=exam.getYear()%></td>
			<td><%=exam.getSem()%></td>
			<td><%=exam.getExamstatus()%></td>
			<td><a class="btn btn-danger"
				href="org-handler.jsp?prt=delete-exam&exID=<%=exam.getExamID()%>">Delete
					Exam</a></td>
			<td><a class="btn btn-info"
				href="view-subject.jsp?exID=<%=exam.getExamID()%>&exName=<%=exam.getExamname()%>">View
					Subject</a></td>
		</tr>
		<%
			}

		} else {
		%>
		<div class="alert alert-danger m-auto p-3 w-50" role="alert">No Exam Found</div>
		<%
			}
		%>
	</table>

</div>

<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");
		%>
		<%@ include file="index.jsp" %>
<%
}
%>
