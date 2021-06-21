
<%@include file="main-navbar.jsp"%>

<div class="fluid-container p-4"
	style="margin-top: 80px; margin-bottom: 80px;">

		<div class="card col-md-4 col-sm-6 col-xs-6 m-auto">

		<div class="card-body">
		

	<%

	 String otpmsg = (String)session.getAttribute("otpmsg");
		if(otpmsg!=null){
			%>
			<div class="alert alert-danger p-2">
			<%= otpmsg %>
			</div>
			
			<%
			session.removeAttribute("otpmsg");
		}
%>

			<form action="validation.jsp" method="post">
				<input type="hidden" name="page" value="forgot-pass">
				<div class="from-group">
					<div class="text-center" style="font-size: 25px;">Recover
						Password</div>
				</div>
			
				<hr>
				<div class="form-group">
					<input type="text" class="form-control" required="required"
						maxlength="25" class="input-fields" name="username"
						placeholder="Enter Username" id="exampleInputEmail1"
						aria-describedby="emailHelp">
				</div>

				<div class="form-group">
					<input type="email" class="form-control" required="required"
						maxlength="25" class="input-fields" name="email"
						placeholder="Enter Email" id="exampleInputEmail1"
						aria-describedby="emailHelp">
				</div>
				<div class="from-group pb-2">

					<select class="form-control" name="user_role">
						<option value="Student">Student</option>
						<option value="Organizer">Organizer</option>
					</select>
				</div>
				
				<button type="submit" class="btn btn-primary p-2"
					style="width: 100%">Sent OTP</button>
			</form>

		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>
