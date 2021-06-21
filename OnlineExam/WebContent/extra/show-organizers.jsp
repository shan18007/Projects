

<%@page import="java.sql.ResultSet"%>
<%@page import="mybeans.Organizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.UserBean"%>
<div class="container pt-4 pb-4">

	<table
		class="table table-hover table-bordered col-lg-3 col-md-3 col-sm-4 col-xs-4 mt-4 mb-4">
		<tr>
			<td colspan="5" class="text-center bg-info p-3 h4 text-white">Organizers</td>
		</tr>

		<tr>
			<td>Organization Name</td>
			<td>Ordinator Name</td>
			<td>Course</td>
			<td>Registration Date</td>
			<td>Account Status</td>
		</tr>
<%
  
   UserBean b= new UserBean();
  
   Organizer organizer=null;
   ArrayList<Organizer> list = b.orgDetails();
   
   if(list.size()>0){
	   
	   for(int i=0;i<list.size();i++){
		   organizer =(Organizer) list.get(i);
%>	   

    <tr>
    
    	<td> <%= organizer.getOrgName() %> </td>
 	 	<td> <%= organizer.getOrdinatorName() %></td>
 	 	<td> <%= organizer.getCourse() %></td>
 	 	<td> <%= organizer.getRegDate()  %></td>
 	 	<td> <%= organizer.getOrg_type() %></td>
 	
 	</tr>

<%
	   }
   }
   
   else{
   	%>
   	
   	<tr>No User</tr>
   	
   <%
   
   }
   
%>		
	</table>

</div>