<%
	if (session.getAttribute("username") != null) {
%>



<%@include file="components/common.jsp"%>

<%@include file="components/op_js.jsp"%>

<link rel="stylesheet" href="CSS/style.css">

<!-- Staring navbar for Admin -->


<nav class="navbar navbar-expand-lg navbar-light p3">
	<div class="container">
		<h3 class="text-left font-weight-bold qz">
			<span class="text-primary purple">Online Exam System</span>
		</h3>


		<div class="text-right font-weight-bold ml-6 admn">
			<h3>Admin</h3>
		</div>
	</div>
</nav>



<!-- main nav bar -->

<nav class="navbar navbar-expand-lg navbar-light bg-info">
	<div class="container">
	<a class="navbar-brand" href="#">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
		
		
					<li class="nav-item"><a class="nav-link" href="Admin-dashboard.jsp?pgprt=view-user">Show users
				
			</a></li>
	
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout
					<span class="sr-only">(current)</span>
			</a></li>
			
		</ul>
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
