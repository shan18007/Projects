<%
	if (session.getAttribute("username") != null) {
%>

<%
	String btn = null;
String pgprt = null;

pgprt = request.getParameter("pgprt");
String msg;

msg = (String) session.getAttribute("message");

if (msg != null) {
	String alert = request.getParameter("alert");
	if (alert.equals("success")) {
		btn = "alert alert-success";
	} else {
		btn = "alert alert-danger";
	}
}
%>

<%@include file="std-header.jsp"%>

<%
	if (pgprt.equals("profile")) {
%>

<%@include file="user-profile.jsp"%>

<%
	}

else if (pgprt.equals("dashboard")) {

	String examMsg=(String)session.getAttribute("examMsg");
			if(examMsg!=null){
				%>
				  <div class="container alert alert-danger mt-4 mb-0 p-2 w-50 text-center" role="alert">
				  	<%= examMsg %>
				  </div>
				<%
				session.removeAttribute("examMsg");
			}
		%>

<%@include file="user-dashboard.jsp"%>
<%
	}

else if (pgprt.equals("exams")) {
%>

<%@include file="upcoming-exam.jsp"%>
<%
	}

else if (pgprt.equals("start-exam")) {
%>

<%@include file="std-exam.jsp"%>
<%
	}
else if (pgprt.equals("result")) {

String resultMsg = (String) session.getAttribute("resultmsg");
			if(resultMsg!=null){
				%>
				  <div class="container alert alert-danger mt-4 mb-0 p-2 w-50 text-center" role="alert">
				  	<%= resultMsg %>
				  </div>
				<%
				session.removeAttribute("resultmsg");
			}
		%>

<%@include file="result.jsp"%>
<%
	}

else if (pgprt.equals("change-pass")) {
if (msg != null) {
%>
<div class="container m-auto p-4 w-50 text-center">
	<div class="<%=btn%>" role="alert"><%=msg%>
	</div>
</div>
<%
	}
session.setAttribute("message", null);
%>

<%@include file="change-pass.jsp"%>
<%
	}
%>
<%@include file="footer.jsp"%>
<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");
		%>
		<%@ include file="index.jsp" %>
<%
}
%>
