<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>Register Organizer</title>


<%@include file="main-navbar.jsp"%>


<!-- start header  -->

<header class="header">
	<div class="container px-6 m-auto p-4 h-100">

		<div class="row">

			<div
				class="card-body m-auto p-6  col-lg-9 col-md-6 col-sm-6 col-xs-4 lca">
				<form action="validation.jsp" method="post">
					<input type="hidden" name="page" value="org-register">

					<div class="from-group">
						<div class="text-center text-primary font-weight-bold"
							style="font-size: 25px;">Register Organization</div>
					</div>

					<hr>
					<div class="text-center">
						<div class="form-group">
							<select class="form-control" id="sel1" name="org_type">
								<option>--------Select Organization Type--------</option>
								<option>school</option>
								<option>college</option>
								<option>coaching</option>

							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Organization Name" name="org_name" Required /> <small><span
								style="color: red">note:</span>For College Enter Department name
								at the end of organization name.</small> <br> <small><span
								style="color: red">Ex:</span> Narsimha college Amravati_BCA</small>
						</div>

						<div class="form-group row">
							<div class="form-group col-md-4">
								<input type="text" class="form-control"
									placeholder="Course Name" name="course_name" Required />
							</div>

							<div class="form-group col-md-4">
								<select class="form-control" id="sel1" name="duration">
									<option>--Select Course Duration--</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<input type="text" class="form-control" maxlength="35"
									placeholder="Organizer Full Name" name="ord_name" Required />
							</div>
						</div>


						<div class="form-group row">
							<div class="form-group col-md-4">
								<input type="text" class="form-control" placeholder="Username"
									name="u_name" Required />

							</div>



							<div class="form-group col-md-4">
								<input type="email" class="form-control" placeholder="Email"
									name="email" Required />
							</div>
							<div class="form-group col-md-4">
								<input type="text" class="form-control" maxlength="10"
									placeholder="Mobile Number" name="mob_no" Required />
							</div>
						</div>
						<div class="form-group row">
							<div class="form-group col-md-6">
								<input type="password" class="form-control" id="password"
									placeholder="Password" name="pass" onkeyup='check();' Required />
							</div>
							<div class="form-group col-md-6">
								<input type="password" class="form-control" id="retype_pass"
									placeholder="Retype Password" name="retype_pass"
									onkeyup='check();' Required /> <span id='message'></span>
							</div>
						</div>

						<input class="btn btn-outline-danger" type="reset" value="Reset">

						<button type="submit" id="crtBtn"
							class="btn btn-outline-success p-2">Create Account</button>
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

<%@include file="footer.jsp"%>

<!-- end footer section -->

