
<%
	if (session.getAttribute("username") != null) {
%>

<%@page import="mybeans.ExamPaper"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.helper.OrgSuppport"%>

<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>
<%@page import="mybeans.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.Subject"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>


<style>
.modal {
	margin-top: 70px;
}

.card {
	margin: 4;
	padding: 10;
}

.extime {
	padding: 5;
}
</style>



<div class="container">


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form method="post" action="exam.jsp">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">

						<%
							StudentTask stask = new StudentTask();

						String uname = (String) session.getAttribute("username");
						Users std = stask.studentProfile(uname);
						String sem = std.getSem();
						int orgID = (Integer) session.getAttribute("orgID");
						ArrayList<ExamPaper> list = stask.getTodaySubjects(orgID, sem);
						ExamPaper examPaper;
						if (list.size() > 0) {

							for (int i = 0; i < list.size(); i++) {
								examPaper = (ExamPaper) list.get(i);
						%>
						<h4>
							Exam Name :
							<%=examPaper.getExamname()%></h4>

					</div>


					<div class="modal-body">

						<div class="card">
							<%
								String inpSubDate = examPaper.getSubDate();

							SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
							SimpleDateFormat outputFormat = new SimpleDateFormat("MM-dd-yyyy");

							Date date = inputFormat.parse(inpSubDate);
							String outputSubDate = outputFormat.format(date);

							String subtime24 = examPaper.getSubTime();
							String tm = OrgSuppport.getTimeinAMPM(subtime24);

							session.setAttribute("minMarks", examPaper.getMinMarks());
							session.setAttribute("maxMarks", examPaper.getMaxMarks());
							%>
							<!--  hidden values to transfer on exam page -->
							<input type="hidden" name="examName"
								value="<%=examPaper.getExamname()%>"> <input
								type="hidden" name="sub_id" value="<%=examPaper.getSub_id()%>">
							<input type="hidden" name="duration"
								value="<%=examPaper.getDuration()%>"> <input
								type="hidden" name="subTime" value="<%=subtime24%>"> <input
								type="hidden" name="subDate" value="<%=outputSubDate%>">
							<input type="hidden" name="ex_id"
								value="<%=examPaper.getExamID()%>"> <input
								type="hidden" name="subName"
								value="<%=examPaper.getSubName()%>"> <label>Subject
								: <%=examPaper.getSubName()%> <span id="sDate"
								class="text-white"><%=outputSubDate%></span><span id="sTime"
								class="text-white"><%=subtime24%></span>
							</label> <label>Semester : <%=examPaper.getSem()%></label> <label>Mark
								: <%=examPaper.getMaxMarks()%></label> <label>Date : <%=inpSubDate%></label>
							<label>Time : <%=tm%></label> <label>Duration : <%=examPaper.getDuration()%>
								Minutes
							</label> <label>Exam Start in: <span id="demo"
								class="bg-warning extime"></span></label>
							<%
								}
							%>
						</div>


					</div>
					<div class="modal-footer">

						<button type="button" id="closeBtn" class="btn btn-secondary"
							data-dismiss="modal">Close</button>


						<button id="btn" class="btn btn-primary">Starting Soon...</button>

					</div>
				</div>
			</form>
		</div>

	</div>

</div>
<%
	} else {

session.setAttribute("examMsg", "No Schedule Today..!");
response.sendRedirect("std-dashboard.jsp?pgprt=dashboard");
}
%>
<%
	} else {
session.setAttribute("logmsg", "You are not logged in Please log in First");
%>
<%@ include file="index.jsp"%>
<%
	}
%>


<script>
	// pop up modal when page open
	$(document).ready(function() {

		$('#myModal').modal('show');

	});

	//prevent modal for closing when click on outside of modal
	$('#myModal').modal({
		backdrop : 'static',
		keyboard : false
	})

	document.addEventListener('DOMContentLoaded', function() {

		document.querySelector('#btn').disabled = true;

		var subDate = document.getElementById("sDate").innerHTML;
		var subTime = document.getElementById("sTime").innerHTML;
		console.log(subDate.trim() + " " + subTime.trim());
		var countDownDate = new Date(subDate.trim() + " " + subTime.trim())
				.getTime();

		var x = setInterval(function() {

			var now = new Date().getTime();
			// Find the distance between now and the count down date
			var distance = countDownDate - now;

			// Time calculations for days, hours, minutes and seconds
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60))
					/ (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			// Output the result in an element with id="demo"
			document.getElementById("demo").innerHTML = days + "d " + hours
					+ "h " + minutes + "m " + seconds + "s ";

			// If the count down is over, write some text 
			if (distance < 0) {
				clearInterval(x);
				document.getElementById("demo").innerHTML = "STARTED";
				document.getElementById("btn").innerHTML = "ATTEND EXAM";
				document.querySelector('#btn').disabled = false;
				document.querySelector('#closeBtn').disabled = true;
			}

		}, 1000);

	});
</script>