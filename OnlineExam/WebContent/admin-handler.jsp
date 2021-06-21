<%
	if (session.getAttribute("username") != null) {
%>

<%@page import="com.helper.AdminTask"%>
<%@page import="com.helper.UserBean"%>
<%
   String prt = request.getParameter("prt");
   String unm;
   String status;
   String res ;
   String resmsg;
   AdminTask mngOB = new AdminTask();

 if(prt.equals("mng-org")){
	  
	   unm = request.getParameter("unm");
	   status = request.getParameter("status");
	   res= mngOB.changeAccStatus(status, unm);
	   if(res.equals("success")){
		   
		   resmsg = "Account "+status.toLowerCase()+" successfull.";
		   session.setAttribute("message", resmsg);
		   
		   response.sendRedirect("Admin-dashboard.jsp?pgprt=view-user&alert=success");
		   }
	   else{
		   session.setAttribute("message", "Account status Change Failed");
		   
		   response.sendRedirect("Admin-dashboard.jsp?pgprt=view-user&alert=fail");  
	   }
 }
 else if(prt.equals("delete-org")){
	   unm = request.getParameter("unm");
	   res = mngOB.deleteAcc(unm);
	   if(res.equals("success")){
		   session.setAttribute("message", "Account Deleted Successfully.");
		   
		   response.sendRedirect("Admin-dashboard.jsp?pgprt=view-user&alert=success");
	   }
	   else{
		   session.setAttribute("message", "Failed to Delete Account.");
		   
		   response.sendRedirect("Admin-dashboard.jsp?pgprt=view-user&alert=fail");
	   }
 }
%>


<%
	} else {
		
		session.setAttribute("logmsg", "You are not logged in Please log in First");
%>

<%@include file="index.jsp" %>
<%
}
%>
