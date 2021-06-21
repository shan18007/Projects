
<%
	if (session.getAttribute("username") != null) {
%>
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.ResultSubjects"%>
<%@page import="mybeans.ResultExam"%>
<%@page import="com.helper.ExamTask"%>


<%@include file="std-header.jsp"%>


<div id="printable"
	class="container text-center  pt-4 pb-4 bg-light m-auto">


	<%
		String examName = null;
	String resultStatus = null;
	float p = 0;
	String sem = null;
	float tMark = 0;
	float obtainMark = 0;
	int examID = Integer.parseInt(request.getParameter("examId"));
	String unm = (String) session.getAttribute("username");
	ExamTask etObj = new ExamTask();
	ArrayList<ResultExam> list = etObj.getResultExamDetails(examID, unm);
	ResultExam resultexam = null;
	if (list.size() > 0) {
		for (int j = 0; j <= list.size(); j++) {
			resultexam = (ResultExam) list.get(0);
			examName = resultexam.getExamName();
			resultStatus = resultexam.getResultStatus();
			p = resultexam.getPercentage();
			sem = resultexam.getSem();
			obtainMark = resultexam.getObtainMarks();
			tMark = resultexam.getTotaMarks();
		}

		StudentTask stask = new StudentTask();

		String uname = (String) session.getAttribute("username");
		Users std = stask.studentProfile(uname);
	%>

	<div class="text-center mt-4 p-2">
		<h2><%=examName%>
		</h2>
		<h4>
			Semester-<%=sem%></h4>
	</div>

	<table class="table table-bordered mb-0">
		<tr class="p-2">
			<td colspan="3">UserId: <%=unm%> <br> Name : <%=std.getFullname().toUpperCase()%></td>
		</tr>
		<tr>
		<tr class="text-primary">
			<th>Subject Name</th>
			<th class="text-center">Total Marks</th>
			<th class="text-center">Obtain Marks</th>
		</tr>
		<%
			} else {
		session.setAttribute("resultmsg", "Result Not declared..!");
		response.sendRedirect("std-dashboard.jsp?pgprt=result");
		}
		ArrayList<ResultSubjects> list1 = etObj.getResultSubjects(examID, unm);
		ResultSubjects resultsub;
		if (list1.size() > 0) {

		for (int i = 0; i < list1.size(); i++) {

			resultsub = (ResultSubjects) list1.get(i);
		%>
		<tr>
			<td><%=resultsub.getSubjectName()%></td>
			<td class="text-center"><%=resultsub.getMaxMarks()%></td>
			<td class="text-center"><%=resultsub.getObtainMarks()%></td>
		</tr>

		<%
			}
		} else {
		%>
		<tr>Result Not Declared
		</tr>
		<%
			}
		%>
		<tr>
			<td>Total Marks</td>
			<td class="text-center"><%=tMark%>
			<td class="text-center"><%=obtainMark%></td>
		</tr>
	</table>

	<table class="table table-bordered  mt-0">
		<tr class="row p-0 m-0">
			<td class="col-3">Percentage</td>
			<td class="col-3"><%=p%>%</td>
			<td class="col-3">Result</td>
			<td class="col-3"><%=resultStatus%></td>
		</tr>

	</table>

</div>

<!-- print button -->
<div class="text-center">
	<button class="btn btn-primary px-4" onclick="printDiv('printable')"
		id="print">Print</button>
</div>

<%@include file="footer.jsp"%>


<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@include file="index.jsp"%>
<%
	}
%>

<script>
	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.body.innerHTML = originalContents;
	}
</script>