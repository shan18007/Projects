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

<%@include file="org-header.jsp"%>

<%
	if (pgprt.equals("my-dashboard")) {
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

<%@include file="my-dashboard.jsp"%>

<%
	}

else if (pgprt.equals("add-exam")) {

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
<%@include file="add-exam.jsp"%>
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

else if (pgprt.equals("add-question")) {
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

<%@include file="add-question.jsp"%>
<%
	}

else if (pgprt.equals("view-exam")) {
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

<%@include file="view-exam.jsp"%>
<%
	}

else if (pgprt.equals("view-question")) {
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
<%@include file="view-question.jsp"%>
<%
	}

else if (pgprt.equals("view-exam-details")) {
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

<%@include file="view-exam-details.jsp"%>
<%
	}

else if (pgprt.equals("pdf-result")) {
%>
	<%@include file="show-pdf-result.jsp"%>
<%
	}

else if (pgprt.equals("view-user")) {
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

<%@include file="show-users.jsp"%>
<%
	} else if (pgprt.equals("add-subject")) {
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
<%@include file="add-subject.jsp"%>
<%
	} else if (pgprt.equals("mng-result")) {
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
<%@include file="manage-result.jsp"%>
<%
	}

else if (pgprt.equals("org-profile")) {
%>

<%@include file="org-profile.jsp"%>
<%
	} else {

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
