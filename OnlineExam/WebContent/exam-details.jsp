
<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">


<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#home">Create
			Exam</a></li>
	<li><a data-toggle="tab" href="#menu1">View Exam</a></li>
</ul>

<div class="tab-content">

	<div id="home" class="tab-pane fade in active">
		<form action="org-handler.jsp?prt=add-exam" method="post">
			<div class="col-auto p-4">

				<div class="form-group row">
					<input type="text" placeholder="Exam Name" name="exam_name"
						Required />
				</div>

				<div class="form-group">
					<select class="form-control" id="sel1" name="year">
						<option>select year</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>

				<div class="form-group row">
					<input type="text" placeholder="Semester" name="sem" Required />
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="Add Exam" />
				</div>
			</div>
		</form>
	</div>


</div>

<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>
