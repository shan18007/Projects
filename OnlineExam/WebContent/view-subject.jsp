

<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<%@page import="com.helper.OrgSuppport"%>
<%@include file="org-header.jsp"%>
<%@page import="mybeans.Subject"%>
<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.helper.OrgTask"%>

<jsp:useBean id="orgOb" class="com.helper.OrgTask" scope="page" />



<div class="container m-auto pt-4 pb-4 text-center">


	<%
		String ExamName = request.getParameter("exName");
	int examID = Integer.parseInt((request.getParameter("exID")));
	%>



	<h1><%=ExamName%></h1>
	<hr>




	<%
		ArrayList<Subject> list = orgOb.getSubjectDetails(examID);
	Subject subject;
	if (list.size() > 0) {
	%>

	<table
		class="table table-hover table-bordered col-lg-10 col-md-8 col-sm-6 col-xs-4 m-auto text-center">

		<tr class="bg-secondary text-white">
			<th>Subject Name</th>
			<th>Date</th>
			<th>Time</th>
			<th>Duration</th>
			<th>Minimum Marks</th>
			<th>Maximum Marks</th>
			<th>Action</th>
		</tr>


		<%
			for (int i = 0; i < list.size(); i++) {
			subject = (Subject) list.get(i);
			String subtm = OrgSuppport.getTimeinAMPM(subject.getSubTime());
		%>
		<tr>
			<td><%=subject.getSubName()%></td>
			<td><%=subject.getSubDate()%></td>
			<td><%=subtm%></td>
			<td><%=subject.getDuration()%></td>
			<td><%=subject.getMinMarks()%></td>
			<td><%=subject.getMaxMarks()%></td>
			<td><a class="btn btn-danger"
				href="org-handler.jsp?prt=delete-subject&subID=<%=subject.getSub_id()%>">Delete
					Subject</a></td>
		</tr>
		<%
			}

		}

		else {
		%>
		<div class="alert alert-danger m-auto p-3 w-50" role="alert">No
			Subject Added</div>
		<%
			}
		%>
	</table>
</div>

<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>
