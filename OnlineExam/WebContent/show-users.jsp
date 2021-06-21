<%
	if (session.getAttribute("username") != null) {
%>



<%@page import="mybeans.Users"%>
<%@page import="mybeans.Organizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.UserBean"%>
<%@page import="com.helper.AdminTask"%>
<%@page import="java.sql.ResultSet"%>



<div class="container pt-4 pb-4">


<%
String btnname="";
String cls;
String btncolor="";



  UserBean orgOB = new UserBean();
  int orgID = (Integer)session.getAttribute("org_id");
  ArrayList<Users> list= orgOB.userDetails(orgID);
  Users users;
  
  if (list.size() > 0) {
	  
	  %>
	  
	  	<table
		class="table table-hover table-bordered m-auto">
		<tr>
			<td colspan="10" class="text-center bg-info p-3 h4 text-white">Users</td>
		</tr>

		<tr>
			<td class="bg-secondary text-white">User Name</td>
			<td class="bg-secondary text-white">Full Name</td>
			<td class="bg-secondary text-white">Semester</td>
			<td class="bg-secondary text-white">Email</td>
			<td class="bg-secondary text-white">Mobile Number</td>
			<td class="bg-secondary text-white">Registration Date</td>
			<td class="bg-secondary text-white">Account Status</td>
			<td colspan="2" class="bg-secondary text-white">Manage Account</td>
		</tr>
	  
	  <%

	   for (int i = 0; i < list.size(); i++) {

		users = (Users) list.get(i);

   
				if(users.getLoginStatus().equals("DEACTIVE")){
					btnname="ACTIVE";
					cls="btn btn-danger";
				}
				else{
					btnname="DEACTIVE";
					cls="btn btn-success";
				}
				
%>	   

    <tr>
    	<td> <%= users.getUsername() %> </td>
    	<td> <%= users.getFullname() %> </td>
 	 	<td> <%= users.getSem() %></td>
 	 	<td> <%= users.getEmail() %></td>
 	 	<td> <%= users.getMob_no() %></td>
 	 	<td> <%= users.getRegDate() %></td>
 	 	<td> <%= users.getLoginStatus() %></td>
 	 	 
 	 	<td>
            <a class="<%=cls%>" href="org-handler.jsp?prt=mng-user&unm=<%=users.getUsername() %>&status=<%=btnname %>"><%=btnname %></a>
        </td>
        
        <td>
            <a class="btn btn-danger" href="org-handler.jsp?prt=delete-user&unm=<%= users.getUsername() %>">Delete Account</a>
        </td>
 	 
 	
 	</tr> 

<%
	   }

  }else{
	  
%>
	      <div class="alert alert-danger text-center m-auto p-3 w-50" role="alert">No Users Found</div>
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
