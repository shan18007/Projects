<%
	if (session.getAttribute("username") != null) {
%>

<%@include file="components/common.jsp"%>
<%@include file="components/op_js.jsp"%>

<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&family=PT+Sans&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="CSS/style.css" />


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">



<style>
.que {
	font-size: 18;
	font-weight: bold;
}

.options {
	margin-left: 50px;
}

.instruction {
	background-color: pink;
}

.title {
	color: red;
	font-size: 24;
	text-align: center;
	margin-top: 10px;
}

.org-name {
	color: white;
}
</style>



<%@page import="mybeans.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.OrgTask"%>

<nav
	class="navbar navbar-expand-lg  nav-light bg-light sticky-top p-3">
	<div class="container font-weight-bold">
		<h3 class="text-left qz">
			<span class="text-primary purple">Online Exam System</span>
		</h3>
		<span id="demo" class="ml-3"
				style="text-align: center; font-size: 28px;">
		</span>
		<div class="text-right font-weight-bold ml-6">
			<div class="text-right font-weight-bold ml-6">
				<%=session.getAttribute("username")%>
			</div>
		</div>
	</div>
</nav>
<body>
	<nav class="card bg-info p-3">
		<div class="org-name text-center">
		<%	 int orgID = (Integer)session.getAttribute("orgID");
			OrgTask ob = new OrgTask();
		%>
			<h1> <%= ob.getOrgName(orgID) %> </h1>

		</div>
	</nav>




	<div class="container-fluid pt-4 pb-4">

		<div class="exam-header">
			<div class="alert alert-success">
				<%	
					String examName = request.getParameter("examName");
					String subjectName = request.getParameter("subName");
					
				%>
				<div class="row p-2">
				<div class="col-sm-6 text-left">
					<h3>Exam Name : <%= examName %></h3>
				</div>
				<div class="col-sm-6 text-right">
					<h3>Subject Name : <%= subjectName %></h3>
				</div>
				</div>
			</div>
		</div>

		<hr>

		<div class="row mx-0">
			<div class="col-sm-4 px-0">
				<div
					class="card ml-auto mr-4 col-lg-10 col-md-8 col-sm-4 col-xs-4 m-2 instruction">
					<p class="title">Instructions</p>
					<ul>
						<li>Note that you cannot submit exam before time is up.</li>
						<li>You get submit button automatically after time is up.</li>
						<li>if you don't submit the exam then you will be considered as absent for the exam.</li>
						<li>Student must be solve all questions compulsary</li>
						<li>Students must not stop the session and then return to it.
							This is especially important in the online environment where the
							system will "time-out" and not allow the student or you to
							reenter the exam site.</li>
							<li>If your Exam interrupted then you can restart again.</li>
					</ul>
				</div>
			</div>

			<div class="col-sm-8 px-0">


				<%
					OrgTask taskOrg = new OrgTask();

				Question question=null;
				int examID = Integer.parseInt(request.getParameter("ex_id"));
				int subID = Integer.parseInt(request.getParameter("sub_id"));
				int duration = Integer.parseInt(request.getParameter("duration"));
				String subTime = request.getParameter("subTime");
				String subDate = request.getParameter("subDate");
				int startHour = Integer.parseInt(subTime.substring(0, 2));
				int startMin = Integer.parseInt(subTime.substring(3, 5));
				int hour = duration / 60;
				int min = duration % 60;
				int endhour = startHour + hour;
				int endmin = startMin + min;
				if (endmin == 60) {
					endmin = 00;
				}
				%>

				<div class="text-white">
				<span id="hour"><%=endhour%></span>
				<span id="min"><%=endmin%></span>
				<span id="subDate"><%=subDate%></span>
				</div>

		<form action="exam-dashboard.jsp" method="post">
		
					<!--  hidden values to transfer on exam-dashboard page -->
						<input type="hidden" name="sub_id" value="<%= subID %>"> 
						<input type="hidden" name="ex_id" value="<%= examID %>">
				<%
					ArrayList<Question> list = taskOrg.getQuestions(subID);
				if (list.size() > 0) {
					
					for (int j = 0; j < list.size(); j++) {

					question = (Question) list.get(j);
				%>


				<div class="card col-lg-11 col-md-10 col-sm-12 col-xs-12 m-2 p-0">
					<div class="alert alert-info m-0 px-2 que">
						<p>
							Q.No
							<%=j + 1%>)
							<%=question.getQue()%></p>
					</div>
					<div class="options mt-0 py-3">
						<div class="radio">
							<label>a) <input type="radio" name="ans<%=j%>" value="<%= question.getOp1() %>">
								<%=question.getOp1()%></label>
						</div>
						<div class="radio">
							<label>b) <input type="radio" name="ans<%=j%>"  value="<%=question.getOp2()%>">
								<%=question.getOp2()%></label>
						</div>
						<div class="radio">
							<label>c) <input type="radio" name="ans<%=j%>"  value="<%=question.getOp3()%>">
								<%=question.getOp3()%></label>
						</div>
						<div class="radio">
							<label>d) <input type="radio" name="ans<%=j%>" value="<%=question.getOp4()%>"><%=question.getOp4()%></label>
							<input type="hidden" name="qid<%=j%>" value="<%= question.getQueID() %>">
						</div>
					</div>
				</div>

				<%
					}
				%>
				
				
					<input type="hidden" name="totalQue" value="<%= list.size() %>">
<!-- 				<div class="m-2 p-2"> -->
<!-- 					<button type="submit" class="btn btn-primary">Submit</button> -->
<!-- 				</div> -->




<div class="modal fade" id="exam-finish" data-backdrop="static" aria-hidden="true" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Exam Finish</h5>
      </div>
      <div class="modal-body text-center">
      		<p>Now your Exam is Finish Please Submit the Exam.</p>
         <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>
</div>

				
				</form>
				
				<%

				} else {
				%>
				<div class="alert alert-danger text-center m-auto p-3 w-50"
					role="alert">No Question Found</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	

	
</body>
<%@include file="footer.jsp"%>



<%
	} else {
		
		session.setAttribute("logmsg", "You are not logged in Please log in First");
%>

<%@include file="index.jsp" %>
<%
}
%>


<script>
	document.addEventListener('DOMContentLoaded', function() {

		var subDate = document.getElementById("subDate").innerHTML;
		var endHour = document.getElementById("hour").innerHTML;
		var hourStr = endHour.toString();
		var endMin = document.getElementById("min").innerHTML;
		var minStr = endMin.toString();
		var countDownDate = new Date(subDate.trim() + " " + hourStr.trim()
				+ ":" + minStr.trim()).getTime();

		var x = setInterval(function() {

			var now = new Date().getTime();
			// Find the distance between now and the count down date
			var distance = countDownDate - now;

			// Time calculations for days, hours, minutes and seconds
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60))
					/ (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			// Output the result in an element with id="demo"
			document.getElementById("demo").innerHTML = hours + "h " + minutes
					+ "m " + seconds + "s ";

			// If the count down is over, write some text 
			if (distance < 0) {
				clearInterval(x);
				//alert("Time Over");
				//window.location.href ="exam-dashboard.jsp";
				$('#exam-finish').modal('show');
			
			}

		}, 1000);

	});
</script>

