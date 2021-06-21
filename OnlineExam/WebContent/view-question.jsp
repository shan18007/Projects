
<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<%@page import="mybeans.SubjectDetail"%>
<%@page import="mybeans.ExamSubject"%>
<%@page import="mybeans.Subject"%>
<%@page import="mybeans.Exam"%>
<%@page import="com.helper.OrgTask"%>
<%@page import="java.util.ArrayList"%>

<head>
<script>
	var id = document.querySelector('#subid').value;
	alert(id);
</script>
</head>


<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6 col-xs-4">

	<div class="card text-center">
		<div class="card-header bg-info">

			<h3>Select Details</h3>
		</div>
		<div class="card body align-items-center">
			<form action="view-questions.jsp" method="post">
				<div class="col-auto p-4">


					<div class="form-group">
						<label>Select Exam subject</label> <select class="form-control"
							id="selExam" name="sub_id" onchange="enableButton()">
							<option disabled selected="selected">----Select Exam &
								Subject----</option>
							<%
								OrgTask task = new OrgTask();
							int oid = (Integer) session.getAttribute("org_id");
							ArrayList<SubjectDetail> list = task.getExamSubjectDetails(oid);
							SubjectDetail examsub;
							if (list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									examsub = (SubjectDetail) list.get(i);
							%>

							<option value="<%=examsub.getSubjectId()%>">
								<%=examsub.getExamName()%>-------<%=examsub.getSubName()%>
							</option>
							<%
								}
							} else {
							%>
							<option>Subject not found</option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" id="view" class="btn btn-primary"
							value="View" disabled />
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
<%@ include file="index.jsp"%>
<%
	}
%>

<script>
	function enableButton() {
		var selectelem = document.getElementById('selExam');
		var btnelem = document.getElementById('view');
		btnelem.disabled = !selectelem.value;
	}
</script>