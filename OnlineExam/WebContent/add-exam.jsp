
<%@page import="mybeans.Organizer"%>
<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport" content="width=device-width, initial-scale=1">



<%@page import="java.sql.ResultSet"%>
<%@page import="com.helper.UserBean"%>
<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6">

	<div class="card text-center">
		<div class="card-header bg-info">

			<h3>Add Exam</h3>
		</div>
		<%
			String unm = (String) session.getAttribute("username");
		UserBean ob = new UserBean();
		Organizer org = ob.orgProfile(unm);
		%>
		<div class="card body align-items-center">
			<form action="org-handler.jsp?prt=add-exam" method="post">
				<div class="col-auto p-4">

					<div class="form-group row">
						<input type="text" class="form-control" placeholder="Exam Name"
							name="exam_name" Required />
					</div>

					<div class="form-group row">
						<select class="form-control" id="sel1" name="year">
							<option selected disabled>----Select Year----</option>
							<%
								for (int i = 1; i <= org.getDuration(); i++) {
							%>
							<option><%=i%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group row">
						<select class="form-control" id="sel2" name="sem">
							<option selected disabled>----Select Semester----</option>
							<option>None</option>
							<option>I</option>
							<option>II</option>
							<option>III</option>
							<option>IV</option>
							<option>V</option>
							<option>VI</option>
						</select> <span style="color: red">note: </span> Select None for school and
						Coaching Institues.</small>
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Add Exam" />
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%
	} else {

session.setAttribute("logmsg", "You are not logged in Please log in First");
%>

<%@include file="index.jsp"%>
<%
	}
%>


