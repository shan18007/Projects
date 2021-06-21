<%@page import="com.helper.ExamTask"%>
<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">



<%@page import="mybeans.Exam"%>
<%@page import="com.helper.OrgTask"%>
<%@page import="java.util.ArrayList"%>


<jsp:useBean id="orgTaskObject" class="com.helper.OrgTask" />



<div class="container  text-center m-auto  pt-4 pb-4">


	

		<%
		ExamTask etsk = new ExamTask();
		String decStat;
		String actionBtn="";
		String btnClass="";
		String btnName1="";
		String btnName2="";
		int oid = (Integer) session.getAttribute("org_id");
		ArrayList<Exam> list = orgTaskObject.getExamDetails(oid);
		Exam exam;
		if (list.size() > 0) {
		%>
		<table
		class="table text-center align-items-centertable-hover table-bordered col-lg-8 col-md-6 col-sm-4 col-xs-3 m-auto">

		<tr>
			<td colspan="10" class="text-center bg-info p-3 h4 text-white">Manage Exam Results</td>
		</tr>
		<tr class="bg-secondary text-white">
			<th>Exam Name</th>
			<th>Year</th>
			<th>Semester</th>
			<th>Exam Status</th>
			<th>Result Status</th>
			<th>Display Result Status</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
			exam = (Exam) list.get(i);
		%>


		<tr>
			<td><%=exam.getExamname()%></td>
			<td><%=exam.getYear()%></td>
			<td><%=exam.getSem()%></td>
			<td><%=exam.getExamstatus()%></td>
			
			<%
			decStat = etsk.checkResultDeclareStatus(exam.getExamID());
			if(decStat.equals("declared")){
				actionBtn = "disabled";
				btnName1="Declared";
			}else{
				actionBtn="";
				btnName1="Declare";
			}
			if(exam.getDisplayStatus().equals("FALSE")){
				btnName2="Show";
				btnClass="btn btn-primary";
			}else{
				btnName2="Hide";
				btnClass="btn btn-warning";
			}
			%>
			<td>
			<a href="org-handler.jsp?prt=declare-result&exam_id=<%=exam.getExamID()%>" class="btn btn-primary <%=actionBtn%>" role="button" aria-disabled="true"><%= btnName1 %></a>
			</td>
			<td><a class="<%= btnClass %>"
				href="org-handler.jsp?prt=display-result&exam_id=<%=exam.getExamID()%>&status=<%= btnName2 %>"><%= btnName2 %></a></td>
		</tr>
		<%
			}

		} else {
		%>
		<div class="alert alert-danger m-auto p-3 w-50" role="alert">No Exam Found</div>
		<%
			}
		%>
	</table>

</div>

<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");

		%>
		<%@ include file="index.jsp" %>
<%
	}
%>
