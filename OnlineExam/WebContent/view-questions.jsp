
<%
	if (session.getAttribute("username") != null) {
%>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<%@page import="mybeans.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.OrgTask"%>


<%@include file="org-header.jsp"%>


<div class="container text-center  pt-4 pb-4">

	<table
		class="table table-hover table-bordered col-lg-12 col-md-10 col-sm-12 col-xs-12">

		<%
			OrgTask taskOrg = new OrgTask();

		Question question;
		int subID = Integer.parseInt(request.getParameter("sub_id"));

		ArrayList<Question> list = taskOrg.getQuestions(subID);
		if (list.size() > 0) {
		%>
		<tr>
			<td colspan="10" class="text-center bg-info p-3 h4 text-white">Questions</td>
		</tr>
		<tr class="text-center">
			<th class="bg-secondary text-white">Sr.No.</th>
			<th class="bg-secondary text-white">Question</th>
			<th class="bg-secondary text-white">Option1</th>
			<th class="bg-secondary text-white">Option2</th>
			<th class="bg-secondary text-white">Option3</th>
			<th class="bg-secondary text-white">Option4</th>
			<th class="bg-secondary text-white">Correct Answer</th>
			<th class="bg-secondary text-white">Action</th>
		</tr>
		<%
			for (int j = 0; j < list.size(); j++) {

			question = (Question) list.get(j);
		%>
		<tr>
			<td><%=j + 1%></td>
			<td><%=question.getQue()%></td>
			<td class="text-center"><%=question.getOp1()%></td>
			<td class="text-center"><%=question.getOp2()%></td>
			<td class="text-center"><%=question.getOp3()%></td>
			<td class="text-center"><%=question.getOp4()%></td>
			<td class="text-center"><%=question.getCorrectAns()%></td>
			<td class="text-center"><a class="btn btn-danger"
				href="org-handler.jsp?prt=delete-question&exID=<%=question.getQueID()%>">Delete
					Question</a></td>
		</tr>
		<%
			}

		} else {
		%>
		<div class="alert alert-danger text-center m-auto p-3 w-50"
			role="alert">No Question Found</div>
		<%
			}
		%>
	</table>
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
