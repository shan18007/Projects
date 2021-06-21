
<%@page import="mybeans.Organizer"%>
<%
	if (session.getAttribute("username") != null) {
%>


<%@page import="com.helper.UserBean"%>

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
			UserBean ub = new UserBean();

		String uname = (String)session.getAttribute("username");
		Organizer org = ub.orgProfile(uname);
		%>
		<tr>
			<th class="bg-secondary text-white">Name</th>
			<td><%= org.getOrdinatorName().toUpperCase()  %></td>
		</tr>

		<tr>
			<th class="bg-secondary text-white">Username</th>
			<td><%= org.getUnm() %></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Organization Name</th>
			<td><%=  org.getOrgName() %></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Course</th>
			<td><%= org.getCourse() %></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Course Duration</th>
			<td><%= org.getDuration() %></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Email</th>
			<td><%= org.getEmail()  %></td>

		</tr>

		<tr>
			<th class="bg-secondary text-white">Mobile</th>
			<td><%= org.getMob_no()  %></td>

		</tr>
		<tr>
			<th class="bg-secondary text-white">Registration Date</th>
			<td><%= org.getRegDate() %></td>
		</tr>

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
