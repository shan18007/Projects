<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<div class="container m-auto p-3 w-50">

	<div class="card text-center">
		<div class="card-header bg-info">

	<div class="card body align-items-center">
		<form action="org-handler.jsp?prt=change-pass" method="post">
			<div class="col-auto p-4">

				<div class="form-group">
					<input type="password" class="form-control" placeholder="Old Password"
						name="old_pass" Required />
				</div>
				<div class="form-group">
					<input type="password" id="password" class="form-control" placeholder="New Password"
						name="new_pass"  Required />
				</div>
				<div class="form-group">
					<input type="password" id="confirm_password" class="form-control"
						placeholder="Confirm Password" onkeyup='check();' name="conf_pass" Required />
						<span id='message'></span>
				</div>
				<button id="changeBtn" class="btn btn-primary" type="submit" disabled>Change</button>
			</div>
		</form>
		</div>
		</div>
	</div>
	</div>
<script>
var check = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('confirm_password').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'password match';
	    document.getElementById("changeBtn").disabled = false;
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'password not match';
	    document.getElementById("changeBtn").disabled = true;
	  }
	}
</script>

<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");
		%>
		<%@ include file="index.jsp" %>
<%

}
%>
