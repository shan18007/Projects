<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">



<%@page import="com.helper.OrgTask"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.Exam"%>
<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6">

	<div class="card text-center">
		<div class="card-header bg-info">

			<h3>Add Subject</h3>
		</div>
		<div class="card body align-items-center">
			<form action="org-handler.jsp?prt=add-subject" method="post">
				<div class="col-auto p-4">

					<div class="form-group">
						<select class="form-control" id="sel1" name="ex_id">
							<option selected="selected" selected disabled>----Select Exam----</option>
							<%
								int oid = (Integer) session.getAttribute("org_id");
							OrgTask ob = new OrgTask();
							ArrayList<Exam> list = ob.getExamDetails(oid);
							Exam exam;
							if (list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									exam = (Exam) list.get(i);
							%>
							<option value="<%=exam.getExamID()%>"><%=exam.getExamname()%></option>

							<%
								}
							} else {
							%>
							<option>No exams</option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group row">
						<div class="form-group col-md-6">
							<input type="text" class="form-control"
								placeholder="Subject Name" name="sub_name" Required />
						</div>

						<div class="form-group col-md-6">
							<input type="date" class="form-control" name="sub_date"
								placeholder="dd-mm-yyyy" value="" min="1997-01-01"
								max="2030-12-31">
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-md-6">
							<input type="time" class="form-control" id="appt" name="sub_time">
						</div>
						<div class="form-group col-md-6">
							<input type="text" class="form-control"
								placeholder="Duration in minutes" name="duration" Required />
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-md-6">
							<input type="text" class="form-control"
								placeholder="Minimum Marks" name="min_marks" Required />
						</div>
						<div class="form-group col-md-6">
							<input type="text" class="form-control"
								placeholder="Maximum Marks" name="max_marks" Required />
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Add Subject" />
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

<%@include file="index.jsp" %>
<%
}
%>
