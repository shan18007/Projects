
<%
	if (session.getAttribute("username") != null) {
%>
<%@include file="components/common.jsp"%>
<%@include file="components/op_js.jsp"%>
<div class="container">
	<div class="modal fade" id="status-msg" data-backdrop="static" aria-hidden="true" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Exam Submitted</h5>
	      </div>
	      <div class="modal-body text-center">
	      		<p>Exam submitted successfully.You are Redirecting to Dashboard in</p>
	      		<p id="countdown"></p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");

		%>
		<%@ include file="index.jsp" %>
<%
	}
%>

<script>

$(document).ready(function() {

	$('#status-msg').modal('show');

});

var timeleft = 10;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
    window.location.href = "std-dashboard.jsp?pgprt=dashboard";
  } else {
    document.getElementById("countdown").innerHTML = timeleft + " seconds";
  }
  timeleft -= 1;
}, 1000);

</script>