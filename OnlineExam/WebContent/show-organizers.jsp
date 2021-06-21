<%
	if (session.getAttribute("username") != null) {
%>

<meta name="viewport"
	content="width=device-width, initial-scale=1">


<%@page import="mybeans.Organizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.UserBean"%>
<%@page import="com.helper.AdminTask"%>
<%@page import="java.sql.ResultSet"%>



<div class="container pt-4 pb-4">

	<table
		class="table table-hover table-bordered col-lg-3 col-md-3 col-sm-4 col-xs-4 mt-4 mb-4">
		<tr>
			<td colspan="10" class="text-center bg-info p-3 h4 text-white">Organizers</td>
		</tr>

		<tr>
			<td class="bg-secondary text-white">UsernName</td>
			<td class="bg-secondary text-white">Organizer Name</td>
			<td class="bg-secondary text-white">Organization Name</td>
			<td class="bg-secondary text-white">Type</td>
			<td class="bg-secondary text-white">Email</td>
			<td class="bg-secondary text-white">Mobile Number</td>
			<td class="bg-secondary text-white">Registration Date</td>
			<td class="bg-secondary text-white">Account Status</td>
			<td colspan="2" class="bg-secondary text-white">Manage Account</td>
		</tr>
<%
String btnname="";
String cls;
String btncolor="";



  UserBean orgOB = new UserBean();
  ArrayList<Organizer> list= orgOB.orgDetails();
  Organizer organizer;
  
  if (list.size() > 0) {

	   for (int i = 0; i < list.size(); i++) {

		organizer = (Organizer) list.get(i);

   
				if(organizer.getLoginStatus().equals("DEACTIVE")){
					btnname="ACTIVE";
					cls="btn btn-danger";
				}
				else{
					btnname="DEACTIVE";
					cls="btn btn-success";
				}
				
%>	   

    <tr>
    
    	<td> <%= organizer.getUnm() %> </td>
 	 	<td> <%= organizer.getOrdinatorName() %></td>
 	 	<td> <%= organizer.getOrgName() %></td>
 	 	<td> <%= organizer.getOrg_type() %></td>
 	 	<td> <%= organizer.getEmail() %></td>
 	 	<td> <%= organizer.getMob_no() %></td>
 	 	<td> <%= organizer.getRegDate() %></td>
 	 	<td> <%= organizer.getLoginStatus() %></td>
 	 	 
 	 	<td>
            <a class="<%=cls%>" href="admin-handler.jsp?prt=mng-org&unm=<%=organizer.getUnm()%>&status=<%=btnname %>"><%=btnname %></a>
        </td>
        
        <td>
            <a class="btn btn-danger" href="admin-handler.jsp?prt=delete-org&unm=<%= organizer.getUnm() %>">Delete Account</a>
        </td>
 	 
 	
 	</tr> 

<%
	   }

  }else{
	  
%>
	      <td colspan="9">No User Found</td>
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
