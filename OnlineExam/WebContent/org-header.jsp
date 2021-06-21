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
			<span class="text-primary depp-pink">Online Exam System</span>
		</h3>


		<div class="text-right font-weight-bold ml-6">
			<div class="dropdown show text-primary">
				<a class="dropdown-toggle nav-link" href="#" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Welcome, <%=session.getAttribute("username") %>  </a>

				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="org-dashboard.jsp?pgprt=change-pass">Change Password</a>
				</div>
			</div>
		</div>
	</div>
</nav>



<!-- main nav bar -->

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:Teal">
	<div class="container">
		<a class="navbar-brand" href="org-dashboard.jsp?pgprt=my-dashboard">Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Manage Course </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="org-dashboard.jsp?pgprt=add-exam">Add
							exam</a> <a class="dropdown-item"
							href="org-dashboard.jsp?pgprt=view-exam">View exam</a> <a
							class="dropdown-item"
							href="org-dashboard.jsp?pgprt=view-exam-details">View Exam
							Details</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink3" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Manage Subject </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item"
							href="org-dashboard.jsp?pgprt=add-subject">Add Subject</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink4" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Manage Question </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item"
							href="org-dashboard.jsp?pgprt=add-question">Add Question</a> <a
							class="dropdown-item"
							href="org-dashboard.jsp?pgprt=view-question">View Question</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink5" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Manage User </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="org-dashboard.jsp?pgprt=view-user">Show
							User</a>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					href="org-dashboard.jsp?pgprt=org-profile">Profile
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="org-dashboard.jsp?pgprt=pdf-result">Download Result<span
						class="sr-only">(current)</span>
				</a></li>
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
