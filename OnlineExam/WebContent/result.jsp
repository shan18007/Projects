<%@page import="com.helper.StudentTask"%>
<%@page import="mybeans.Users"%>
<%@page import="com.helper.ExamTask"%>
<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">


<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.helper.OrgTask"%>

<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6">

	<div class="card text-center m-3">
		<div class="card-header bg-info">

			<h3>Select Exam</h3>
		</div>
		<div class="card body align-items-center p-4">

			<form action="user-result.jsp" method="post" id="myform">
				<div class="form-group">
					<select class="form-control" id="selExam" name="examId"
						onchange="enableButton()">
						<option value="default" disabled selected="selected">----Select
							Exam----</option>

						<%
							int oid = (Integer) session.getAttribute("orgID");
						ExamTask obj = new ExamTask();

						StudentTask stdObj = new StudentTask();

						String uname = (String) session.getAttribute("username");
						Users pObj = stdObj.studentProfile(uname);
						ArrayList<Exam> list = obj.getExamsBySem(oid, pObj.getSem());
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
						<option>No Exam Found</option>
						<%
							}
						%>
					</select>
				</div>
				<div class="form-group">
					<input type="submit" id="view" class="btn btn-primary"
						value="View Result" disabled />
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