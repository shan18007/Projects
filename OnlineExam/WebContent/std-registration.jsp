<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mybeans.Organizer"%>
<%@page import="java.util.ArrayList"%>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Register</title>

<%@include file="main-navbar.jsp"%>


<!-- start header  -->

<header class="header">
	<div class="container px-6 m-auto p-4 h-100">

		<div class="row">

			<div
				class="card-body m-auto p-6 col-lg-8 col-md-6 col-sm-6 col-xs-4 lca">
				<form action="validation.jsp" method="post">
					<input type="hidden" name="page" value="std-register">

					<div class="from-group">
						<div class="text-center text-primary font-weight-bold"
							style="font-size: 25px;">Create student Acoount</div>
					</div>
					<hr>
					<div class="text-center">
						<div class="form-group row">
							<div class="form-group col-md-7">
								<input type="text" class="form-control" maxlength="40"
									placeholder="Full Name" name="full_name" Required />
							</div>
							<div class="form-group col-md-5">
								<input type="text" class="form-control" placeholder="Username"
									name="u_name" Required />

							</div>
						</div>


						<div class="form-group row">
							<div class="form-group col-md-6">
								<input type="email" class="form-control" placeholder="Email"
									name="email" Required />
							</div>
							<div class="form-group col-md-6">
								<input type="text" class="form-control" maxlength="10"
									placeholder="Mobile Number" name="mob_no" Required />
							</div>
						</div>


						<jsp:useBean class="com.helper.UserBean" id="usrOb" />

	<div class="form-group">
								<select class="form-control" id="sel1" name="sem">
									<option>--Select Semester--</option>
									<option>None</option>
									<option>I</option>
									<option>II</option>
									<option>III</option>
									<option>IV</option>
									<option>V</option>
									<option>VI</option>
									<option>VII</option>
									<option>VIII</option>
								</select> <small id="emailHelp" class="form-text"> <span
									style="color: red">note:</span>Select None if you registering
									for school and Coaching Institues.
								</small>
							</div>


						<div class="form-group">
							<select class="form-control" id="sel1" name="org_id">
								<option>-----Select Organization-----</option>

								<%
									Organizer organizer = null;
								ArrayList<Organizer> list = usrOb.orgDetails();
								//out.print(list.size());
								if (list.size() > 0) {

									for (int i = 0; i < list.size(); i++) {

										organizer = (Organizer) list.get(i);
								%>

								<option value="<%=organizer.getOrgID()%>">
									<%=organizer.getOrgName()%>
								</option>


								<%
									}
								} else {
								%>

								<option>------</option>

								<%
									}
								%>
							</select>


						</div>

	<div class="form-group row">
						<div class="form-group col-md-6">
							<input type="password" class="form-control" maxlength="20"
								placeholder="Password" name="pass" id="password" onkeyup='check();' Required />
						</div>
						<div class="form-group col-md-6">
								<input type="password" class="form-control" maxlength="20" id="retype_pass"
									placeholder="Retype Password" name="retype_pass"
									onkeyup='check();' Required /> <span id='message'></span>
							</div>
						</div>

						<input class="btn btn-outline-danger" type="reset" value="Reset">
						<button type="submit" id="crtBtn" class="btn btn-outline-success p-2">Create
							Account</button>
					</div>
				</form>
			</div>

		</div>


	</div>

</header>

<!-- end header -->
<script>
	var check = function() {
		if (document.getElementById('password').value == document
				.getElementById('retype_pass').value) {
			document.getElementById('message').style.color = 'green';
			document.getElementById('message').innerHTML = 'password match';
			document.getElementById("crtBtn").disabled = false;
		} else {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'password not match';
			document.getElementById("crtBtn").disabled = true;
		}
	}
</script>
<!-- footer section -->

<section class="footer bg-dark">
	<div class="container py-3 text-white text-center">
		<p>
			Copyright <i class="fa fa-copyright"></i> 2020 - TechQuiz
		</p>

	</div>


</section>


<!-- end footer section -->








