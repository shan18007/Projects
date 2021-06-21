<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">


<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.OrgTask"%>

<div class="container m-auto p-4 col-lg-6 col-md-6 col-sm-6">

	<div class="card text-center">
		<div class="card-header bg-info">

			<h3>Download Result</h3>
		</div>
		<div class="card body align-items-center">
			<form action="DownloadFileServlet" method="post">
				<div class="col-auto p-4">

					<div class="form-group">
						<select class="form-control" id="sel1" name="ex_id" onchange="enableButton()">
							<option selected="selected" disabled>----Select
								Exam----</option>
							<%
								int oid = (Integer) session.getAttribute("org_id");
							OrgTask ob = new OrgTask();
							ArrayList<Exam> list = ob.getExamForDownloadResult(oid);
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
						<input type="hidden" name="orgID" value="<%=oid %>">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary"
							value="Download" id="submitbtn" disabled/>
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
		var selectelem = document.getElementById('sel1');
		var btnelem = document.getElementById('submitbtn');
		btnelem.disabled = !selectelem.value;
	}
</script>