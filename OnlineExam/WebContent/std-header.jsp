<%
	if (session.getAttribute("username") != null) {
%>



<%@include file="components/common.jsp"%>

<%@include file="components/op_js.jsp"%>

<link rel="stylesheet" href="CSS/style.css">

<!-- Staring navbar for Admin -->

<nav class="navbar navbar-expand-lg navbar-light bg-white p-3">
	<div class="container">
		<h3 class="text-left font-weight-bold qz">
			<span class="text-primary deep-pink">Online Exam System</span>
		</h3>
<div class="text-right font-weight-bold ml-6">
	<div class="text-right font-weight-bold ml-6">
			<div class="dropdown show text-primary">
				<a class="dropdown-toggle nav-link" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Welcome, <%=session.getAttribute("username") %>  </a>

				
			</div>
		</div>
	</div>
	</div>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="std-dashboard.jsp?pgprt=dashboard">Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="std-dashboard.jsp?pgprt=exams">Exams</a></li>
				<li class="nav-item"><a class="nav-link" href="std-dashboard.jsp?pgprt=result">Result</a></li>
				<li class="nav-item"><a class="nav-link" href="std-dashboard.jsp?pgprt=profile">Profile</a></li>
			</ul>
			<a class="nav-link btn btn-danger px-2 ml-auto" href="logout.jsp">Logout</a>
		</div>
		</div>
</nav>


<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");
		%>
		<%@ include file="index.jsp" %>
<%
}
%>
