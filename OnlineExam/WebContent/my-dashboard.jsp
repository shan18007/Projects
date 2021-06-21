<%@page import="com.helper.OrgSuppport"%>
<%
	if (session.getAttribute("username") != null) {
%>
<style>
.card {
	height: 28vh;
}

.myicon {
	font-size: 30px;
	padding: 10px;
}

.card-body {
	font-weight: bold
}

.proIcon {
	font-size: 30px;
	padding: 20px;
}

a:hover {
	text-decoration: none;
}
</style>

<%
	OrgSuppport dsob = new OrgSuppport();
int orgID = (Integer) session.getAttribute("org_id");
%>


<div class="container m-auto p-4 w-50">
	<div class="card-columns">
		<div class="card bg-info">

			<div class="card-body text-center">
				<h1><%=dsob.getTotalUserCount(orgID)%></h1>
				<i class="fa fa-users myicon" aria-hidden="true"></i>
				<div class="card-footer p-3">Total Users</div>
			</div>
		</div>

		<div class="card" style="background-color: #C71585">
			<div class="card-body text-center">
				<h1><%=dsob.getExamCount(orgID)%></h1>
				<div class="card-footer">
					<a class="btn btn-warning" href="org-dashboard.jsp?pgprt=view-exam"
						style="color: black">Exams</a>
				</div>
			</div>
		</div>

		<div class="card bg-success">
			<div class="card-body text-center">
				<h1><%=dsob.getActiveUserCount(orgID)%></h1>
				<svg width="2em" height="3em" viewBox="0 0 16 16"
					class="bi bi-person-check-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm9.854-2.854a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
</svg>
				<div class="card-footer">Active Users</div>
			</div>
		</div>

		<div class="card purple" style="background-color: #DCDCDC">
			<div class="card-body text-center">
				<i class="fa fa-user-circle-o proIcon" aria-hidden="true"></i>
				<div class="card-footer">
					<a class="btn btn-primary"
						href="org-dashboard.jsp?pgprt=org-profile">Profile</a>
				</div>
			</div>
		</div>

		<div class="card" style="background-color: #DC143C">
			<div class="card-body text-center">
				<h1><%=dsob.getDeactiveUserCount(orgID)%></h1>
				<svg width="3em" height="3em" viewBox="0 0 16 16"
					class="bi bi-person-x-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z" />
</svg>
				<div class="card-footer">Deactive Users</div>
			</div>
		</div>

		<div class="card" style="background-color: #20B2AA">
			<div class="card-body text-center">
				<br>
				<br>
				<div class="card-footer">
					<a class="btn btn-warning"
						href="org-dashboard.jsp?pgprt=mng-result">Results</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>

