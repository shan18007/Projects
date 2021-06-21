
<%@include file="main-navbar.jsp"%>

<div class="fluid-container p-4"
	style="margin-top: 100px; margin-bottom: 80px;">

	<div class="table col-md-4 col-sm-6 col-xs-6"
		style="border: 1px solid #fff; box-shadow: 5px 10px 20px dodgerblue; margin: auto">
		<div class="card-body">



	<%

	 String otpmsg = (String)session.getAttribute("otpmsg");
		if(otpmsg!=null){
			%>
			<div class="alert alert-success p-2">
			<%= otpmsg %>
			</div>
			
			<%
			session.removeAttribute("otpmsg");
		}
%>

			<form action="validation.jsp" method="post">
				<input type="hidden" name="page" value="otp-verify">

				<div class="from-group">
					<div class="text-center" style="font-size: 25px;">Recover
						Password</div>
				</div>
				<hr>
				<div class="form-group">
					<input type="text" class="form-control" required="required"
						maxlength="25" class="input-fields" name="otp"
						placeholder="Enter OTP" id="exampleInputEmail1"
						aria-describedby="emailHelp">
				</div>
				
				<input type="hidden" name="generatedOtp" value="<%=session.getAttribute("OTP") %>">
				
				

				
				<button type="submit" class="btn btn-primary p-2"
					style="width: 100%">Verify OTP</button>
			</form>

		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>
