

<meta name="viewport" content="width=device-width, initial-scale=1">


<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.OrgTask"%>

<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6">

	<div class="card text-center">
		<div class="card-header bg-info">

			<h3>Forgot Password</h3>
		</div>
		<div class="card body align-items-center">
			<form action="org-handler.jsp?prt=forgot-pass" method="post">
				<div class="col-auto p-4">

					<div class="form-group">
						<input type="email" name="" placeholder="Enter Email">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary"
							value="Submit" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>





