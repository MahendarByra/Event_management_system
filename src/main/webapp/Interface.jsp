<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login to Royal Events !</title>
	
	
	<style>
			
		.Outer{
			height: 600px;
			width: 100%;
			background-position: center;
			background-size: cover;
			position: absolue;
		}
		
		.Login{
			width: 380px;
			height: 580px;
			position: relative;
			margin: 6% auto;
			background: #fff;
			padding: 5px;
			overflow: hidden;
		}
		
		.button-box{
			width: 220px;
			margin: 35px auto;
			position: relative;
			box-shadow: 0 0 20px 9px #ff61241f;
			border-radius: 30px;
		}
		
		.Button{
			padding: 10px 30px;
			cursor: pointer;
			background: transparent;
			border: 0;
			outline: none;
			position: relative;
		}
		
		#btn{
			top: 0;
			left: 0;
			position: absolute;
			width: 110px;
			height: 100%;
			background: linear-gradient(to right, #ff105f, #ffad06);
			border-radius: 30px;
			transition: .5s;	
		}

		.input-group{
			top: 180px;
			position: absolute;
			width: 280px;
			transition: .5s;
		}

		.input-field{
			width: 100%;
			padding: 10px 0;
			margin: 5px 0;
			border-left: 0;
			border-top: 0;
			border-right: 0;
			border-bottom: 1px solid #999;
			outline: none;
			background: transparent;	
		}

		#register{
			left: 450px;
		}

		#login{
			left: 50px;
		}
			
			body{
					background-image: url("https://www.realsimple.com/thmb/aJDUpqoFWZXJdFvU5XPkjjmAV7c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/impulse-buying-2000-d569eacebb0c48fa8766965d0352151c.jpg");
  					background-repeat: no-repeat;
  					background-size: cover;
			}
		

		#b1,#b2{
  				appearance: button;
  				background-color: #4D4AE8;
  				background-image: linear-gradient(180deg, rgba(255, 255, 255, .15), rgba(255, 255, 255, 0));
  				border: 1px solid #4D4AE8;
  				border-radius: 1rem;
  				box-shadow: rgba(255, 255, 255, 0.15) 0 1px 0 inset,rgba(46, 54, 80, 0.075) 0 1px 1px;
  				box-sizing: border-box;
  				color: #FFFFF0;
       			padding: .5rem 1rem;
  				text-align: center;
  		}


	</style>
</head>
<body>
	<header>
	<div style = "background-color: yellow; text-align: center;padding: 10px;">
		<h1 style="color:red; font-size: 50px;">Welcome to Book Your Event</h1>
	</div>
	</header>
		<div class = "Outer">
		
				<div class="Login">
						
			
						<div class="button-box">
								<div id="btn"></div>
										<button type="button" class ="Button" onclick ="login()">Login</button>
										<button type="button" class ="Button" onclick="reg()">Register</button>
								</div>
								<form id="login" onsubmit ="LoginValidate()" class ="input-group" method="post" action ="forLogin">
										Username:<br>
										<input  class ="input-fied" type = "text"  placeholder="User Name :" name ="usr" id="usr" value="" ><br><br>
										Password:<br>
										<input class ="input_fied" type = "password" placeholder="Password :" name ="pass" id="pass" value="" ><br><br>
 										Category:
 										<select name="cat" id="cat">
    											<option value="User">User</option>
    											<option value="Manager">Manager</option>
 										</select><br><br>
										<input type="checkbox" ><span>Remember Username</span><br><br>
										<button type="submit" id = "b1">Log in</button>
				
										<%
												String res = (String)session.getAttribute("msgLogin");
												out.print("<br>");
												out.print("<span style='color:red;'>");
												if( res != null){
														out.print("*"+res);
														session.setAttribute("msgLogin",null);
												}
												out.print("</span>");
										%>
								</form>
			
								<form id="register" onsubmit = "registerValidate()" class = "input-group" method ="post" action = "register">
										Username:<br>
										<input  class ="input-fied" type = "text"  placeholder="User Name :" name ="nusr" id="nusr" value="" ><br><br>
										Email id:<br>
										<input  class ="input-fied" type = "email"  placeholder="Email id :" name ="eid" id="eid" value="" ><br><br>
										Password:
										<input class ="input_fied" type = "password" placeholder="Password :" name ="npass" id="npass" value="" ><br><br>
										Confirm Password:
										<input class ="input_fied" type = "password" placeholder="Confirm Password :" name ="ncpass" id="ncpass" value=""><br><br>
										Category :
										<select name="ncat" id="ncat">
  												<option value="User">User</option>
  												<option value="Manager">Manager</option>
										</select><br><br>
										<input type="checkbox"><span>Accept terms and conditions</span><br>
										<br><button type="submit" id ="b2">Register</button>
										<%
												String res2 = (String)session.getAttribute("msgRegister");
												out.print("<br>");
												out.print("<span style='color:red;'>");
												if(res2 != null){
														out.print("*"+res2);
														session.setAttribute("msgRegister",null);
												}
												out.print("</span>");
										%>
								</form>
		
					</div>
	
		</div>
		
	<script>
			var x = document.getElementById("login");
			var y = document.getElementById("register");
			var z = document.getElementById("btn");
		
			function reg(){
					x.style.left ="-400px";
					y.style.left ="50px";
					z.style.left ="110px";
			}
			function login(){
					x.style.left ="50px";
					y.style.left ="450px";
					z.style.left ="0px";
			}
		function LoginValidate(){
				var x = document.getElementById("usr").value;
				var y = document.getElementById("pass").value;
				if(x == ""){
					alert("please enter your username");
				}
				if(y == ""){
					alert("please enter your password");
				}
				return;
		}
		function registerValidate(){
				var x =  document.getElementById("nusr").value;
				var y =  document.getElementById("eid").value;
				var z =  document.getElementById("npass").value;
				var a =  document.getElementById("ncpass").value;
				
				if(x == ""){
					alert("please enter your username");
				}
				if(y == ""){
					alert("please enter your email");
				}
				if(z == ""){
					alert("please enter your password");
				}
				if(a == ""){
					alert("please enter your password again");
				}
				if(z != a){
					alert("please enter same password again");
				}
				return;
		}
	</script>
	<footer>
		<div style = "background-color: black; padding: 10px;">
				<h2 style="text-align: center; color:white; font-size: 25px;">Project Created By Mahendar Byra</h2>
				<div>
				<h2 style="color: white;">Contact Details:</h2>
				<a href = "https://facebook.com/"><image height = 35px width = 35px src = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png"></a>
				&emsp;
				<a href = "https://instagram.com/"><image height = 35px width = 35px src = "https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-stunning-instagram-logo-vector-download-for-new-7.png"></a>
				&emsp;
				<a href = "https://twitter.com/"><image height = 35px width = 35px src = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/800px-Twitter-logo.svg.png"></a>
				&emsp;
				<a href = "https://www.google.com/intl/en-GB/gmail/about/"><image height = 35px width = 35px src = "https://mailmeteor.com/logos/assets/PNG/Gmail_Logo_512px.png"></a>
				<br><image height=35px width = 35px src = "https://w7.pngwing.com/pngs/367/604/png-transparent-blue-icon-telephone-web-blue-phone-blue-web-blue-telephone.png">
				&emsp; <font size ='3px' color = 'white'>991-134-5347</font><br><br>
				<h2 style="color: white;">Address:</h2>
				<font size ='3px' color = 'white'>BYC store  Mehdipatnam  Hyderabad pincode :50231</font>
				</div>
				
		</div>
	</footer>
</body>
</html>