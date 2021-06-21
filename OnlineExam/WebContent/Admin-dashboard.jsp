
<%
	if (session.getAttribute("username") != null) {
%>
<%
	String btn = null;
	String pgprt =null;
	
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



<%@include file="adm-header.jsp"%>


<%
	if (pgprt.equals("view-user")) {
	 
	 if(msg!=null){
%>		 
    <div class="container m-auto p-4 w-50 text-center">
	   <div class="<%=btn%>" role="alert"><%=msg%>
       </div>
     </div>
<%
	}
	 session.setAttribute("message", null);
%>
	<%@ include file="show-organizers.jsp" %>
	
<% 
   }
%>
<%@include file="footer.jsp"%>


<%
	} else {
		
		session.setAttribute("logmsg", "You are not logged in Please log in First");
%>

<%@include file="index.jsp" %>
<%
}
%>
