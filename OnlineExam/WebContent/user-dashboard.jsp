
<%
	if (session.getAttribute("username") != null) {
%>

<style>
.card-body {
	font-weight: bold
}
.proIcon{
	 font-size: 30px;
    padding: 20px;
}
a:hover {
	text-decoration: none;
}
</style>
<div class="container m-auto p-4 w-50">

	<div class="card-columns">
		<div class="card bg-info" style="height:25vh;">
			<div class="card-body text-center text-white">
			<div class="card-footer">
			<a href="std-dashboard.jsp?pgprt=exams" style="color:black">
				Upcoming Exam</a>
				</div>
			</div>
		</div>
		
		<div class="card bg-info" style="height:25vh">
			<div class="card-body text-center">
				<div class="card-footer">
				<a href="std-dashboard.jsp?pgprt=start-exam" style="color:black"> Start Exam</a></div>
			</div>
		</div>
		
		<div class="card bg-warning" style="height:25vh">
			<div class="card-body text-center">
				<div class="card-footer">
				<a href="std-dashboard.jsp?pgprt=profile" style="color:black">Profile</a>
				</div>
			</div>
		</div>
		
		<div class="card bg-light" style="height:25vh">
			<div class="card-body text-center">
				<div class="card-footer">
				<a href="std-dashboard.jsp?pgprt=result" style="color:black">Result</a>
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

