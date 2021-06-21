

<title>Online Exam System</title>

<style>
        input[type=text],  
        input[type=password] {  
                  width: 100%;  
            padding: 12px 40px;  
            margin: 8px 0;  
            display: inline-block;  
            border: 1px solid #ccc;  
            box-sizing: border-box; 
        }  
        
         /* Set a style for the buttons*/  
        button {  
            background-image: linear-gradient(to right, #901458 15%, #4169E1 100%);
            color:white;  
            padding: 14px 22px;  
            margin: 8px 0;  
            border: none;  
            cursor: pointer;  
            width: 100%;  
        }  
  
        /* Set a hover effect for the button*/  
        button:hover {  
            opacity: 0.8; 
            background-color:#663399; 
        }  
  
        
   .fontuser { 
            position: relative; 
        } 
          
        .fontuser i{ 
            position: absolute; 
            left: -5px; 
        } 
          
        .fontpassword { 
            position: relative; 
        } 
          
        .fontpassword i{ 
            position: absolute; 
           left: -5px; 
        } 
</style>

<%@include file="main-navbar.jsp" %>






	<!-- start header  -->

	<header class="header">


		<div class="container-fluid pt-3 h-100">
			<!-- row and justify-content-center class is used to place the form in center -->
			<div class="col h-100">
				<div class="col-12 col-sm-6 cols-md-4 p-4">
					<div class="card-body ml-4 mt-4 p-4 align-items-center lca">
						<%

	 String logmsg = (String)session.getAttribute("logmsg");
		if(logmsg!=null){
			%>
			<div class="alert alert-danger">
			<%= logmsg %>
			</div>
			
			<%
			session.removeAttribute("logmsg");
		}
%>
					
						<form action="validation.jsp" method="post">
							<input type="hidden" name="page" value="login">
							<br>
							<div class="from-group">
							 <div class="fontuser "> 
								<div class="text-center text-Warning font-weight-bold" style="font-size: 30px;">Login</div>
								<br>
									 <input
										type="text" placeholder="Enter ID" name="u_id" Required >
									<i class="fa fa-user myicon text-success"></i>
								</div>
								</div>
								
								<div class="from-group">
								 <div class="fontpassword"> 
									<input
										type="password" placeholder="Password" name="pass" Required />
									<i class="fa fa-lock myicon text-warning"></i>
									</div>
								<div class="text-center">
									<button type="submit"
										value="submit">Login</button>	
								
								<br> 
								Forgot Password? <a
									href="forgot-pass.jsp"
									class="text-info text-center pt-2">Click here</a><br>
									<p  class="text-info text-center text-warning"> Create Account<span>
									<a href="std-registration.jsp">Student</a></span><span> /</span>
									<a href="org-registration.jsp">Organization</a></p>
									</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</header>

	<!-- end header -->

	<!-- start message section -->


	<section class="message py-5">

		<div class="container text-center">

			<h1>We have got what you need</h1>
			<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
				Suscipit architecto perferendis, non veritatis tempore repudiandae?</p>
		</div>
	</section>

	<!-- end message section -->


	<!-- start services section -->


	<section class="services py-5">

		<div class="container text-center">

			<h1>About our Services</h1>

			<div class="row">

				<div class="col md-4">

					<div class="card">
						<div class="card-body">
							<i class="fa fa-bar-chart-o myicon"></i>
							<h1>Best Experience</h1>
							<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
								Sit recusandae, nisi voluptatem dolor vel quod cumque, ut, ex
								adipisci sint repudiandae deserunt optio eaque distinctio
								officiis delectus voluptatibus quia tempore.</p>

						</div>

					</div>
				</div>
				<div class="col md-4">
					<div class="card">
						<div class="card-body">
							<i class="fa fa-bell-o myicon"></i>
							<h1>Best Experience</h1>
							<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
								Sit recusandae, nisi voluptatem dolor vel quod cumque, ut, ex
								adipisci sint repudiandae deserunt optio eaque distinctio
								officiis delectus voluptatibus quia tempore.</p>

						</div>

					</div>
				</div>
				<div class="col md-4">
					<div class="card">
						<div class="card-body">
							<i class="fa fa-braille myicon"></i>
							<h1>Best Experience</h1>
							<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
								Sit recusandae, nisi voluptatem dolor vel quod cumque, ut, ex
								adipisci sint repudiandae deserunt optio eaque distinctio
								officiis delectus voluptatibus quia tempore.</p>

						</div>

					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- end services section -->

	<!-- contact section -->

	<section class="contact">
		<div class="container text-center py-5">
			<h1>Lets get in Touch</h1>
			<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
				Ipsam sunt nulla nesciunt totam quo suscipit?</p>
			<i class="fa fa-phone myicon text-success"></i> <i
				class="fa fa-heart myicon text-danger"></i>
			<P>+91 8325642481</P>
			<P>www.onineexamsystem.com</P>
		</div>
	</section>


	<!-- end of contact section -->



	<!-- footer section -->

<%@ include file="footer.jsp" %>


	<!-- end footer section -->
