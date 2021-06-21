
<%
	if (session.getAttribute("username") != null) {
%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>


<meta name="viewport" content="width=device-width, initial-scale=1">

<head>


</head>



<div class="container pt-4 pb-4">

	<table
		class="table table-hover table-bordered col-lg-6 col-md-6 col-sm-4 col-xs-4 m-auto">
		<tr>
			<td colspan="2" class="text-center bg-info p-3 h4 text-white">Profile</td>
		</tr>

		<%
			StudentTask stask = new StudentTask();

		String uname = (String) session.getAttribute("username");
		Users std = stask.studentProfile(uname);

		java.sql.Date dt = std.getRegDate();
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy"); // New Pattern
		String rdate = sdf1.format(dt); // Returns a Date format object with the pattern
		%>

		<tr>
			<th class="bg-secondary text-white">Name</th>
			<td><%=std.getFullname().toUpperCase()  %></td>
		</tr>

		<tr>
			<th class="bg-secondary text-white">Username</th>
			<td><%=std.getUsername()%></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Semester</th>
			<td><%=std.getSem()%></td>

		</tr>


		<tr>
			<th class="bg-secondary text-white">Email</th>
			<td><%=std.getEmail()%></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Mobile</th>
			<td><%=std.getMob_no()%></td>

		</tr>
		<tr>
			<th class="bg-secondary text-white">Registration Date</th>
			<td><%=rdate%></td>
		</tr>

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

