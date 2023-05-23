<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Manager Home</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
		
		#account{
			width: 500px;
			height: 450px;
			margin: auto;
			display: none;
			text-align: center;
			background-color: white;
			padding: 15px;
			
		}
		#item{
			width: 50%;
			height: 100%;
			margin: auto;
			padding: 15px;	
			display: none;
			background-color: white;
			
		}
		#add{
			width: 50%;
			height: 100%;
			background-color: white	;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#update{
			border: 2px solid black;
			background-color: white	;
			width: 50%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#phistory{
			border: 2px solid black;
			background-color: white	;
			width: 95%;
			height: 75%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#search{
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: block;
			padding: 15px;
			text-align: center;
		}
		
		#buyer{
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		.img{
			border: 2px solid black;
			height: 100px;
			width: 100px;
			margin: left;
		}
		.div1{
			padding: 15px;
			border: 2px solid black;
			width: 95%;
			height: 170px;
			text-align: left;
			background-color: white;
			margin: auto;
		}
		.div2{
			padding: 5px;
			width: 800px;
			height: 170px;
			background-color: white;
			float: left;
		}
		.div3{
			width: 100px;
			height: 100px;
			background-color: white;
			float: left;
		}
		/*.div4{
			padding: 15px;
			border: 2px solid black;
			width: 95%;
			height: 170px;
			text-align: left;
			background-color: white;
			margin: auto;
		}
		.div5{
			padding: 5px;
			width: 700px;
			height: 100px;
			background-color: white;
			float: left;
		}
		.div6{
			width: 100px;
			height: 100px;
			background-color: white;
			float: left;
		}*/
		
	button{
  		background-color: initial;
  		background-image: linear-gradient(-180deg, #FF7E31, #E62C03);
  		border-radius: 6px;
  		box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
  		color: #FFFFFF;
  		cursor: pointer;
  		display: inline-block;
  		font-family: Inter,-apple-system,system-ui,Roboto,"Helvetica Neue",Arial,sans-serif;
  		height: 40px;
  		line-height: 40px;
  		outline: 0;
  		overflow: hidden;
  		padding: 0 20px;
  		pointer-events: auto;
  		position: relative;
  		text-align: center;
  		touch-action: manipulation;
  		user-select: none;
  		-webkit-user-select: none;
  		vertical-align: top;
  		white-space: nowrap;
  		width: 10px%;
  		z-index: 9;
  		border: 0;
  		transition: box-shadow .2s;
	}

	button:hover {
  		box-shadow: 5px 5px 5px blue;
	}
	body{
			background-image: url("https://i.pinimg.com/736x/8b/73/0c/8b730cc71091bf55445f666a70d5ff00.jpg");
			background-repeat: no-repeat;
  			background-size: cover;		
		}
	table{
		border: 2px solid black;
		text-align: center;
		
	}
	td{
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		
	}
	tr:nth-child(even){
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: lightblue;
	}
	tr:nth-child(odd){
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: violet;
	}
	th{
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: orange;
	}
		
	</style>
</head>
<body>
	<%@ page import ="java.sql.Connection" %>
	<%@ page import = "java.sql.DriverManager"%>
	<%@ page import ="java.sql.SQLException" %>
	<%@ page import = "java.sql.ResultSet"%>
	<%@ page import = "java.sql.Statement"%>
	
	<header>
	<div style = "background-color: yellow; text-align: center;padding: 10px;">
		<h1 style="color:red; font-size: 50px;">Welcome to Book Your Groceries</h1>
	</div>
	</header>
		
	
	<div style=" padding: 15px; background-color: black;">
			<button type = "button" id="btn1" class="acc"><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("usr") %></button> &emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn2" >Events</button> &emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn3" >Add Event</button> &emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn4" >Update Event</button> &emsp;&emsp;&emsp;&emsp;&emsp;
			<a href = "Interface.jsp" ><button type = "button" id="btn7" class ="Logout">Log Out</button><br></a>
			
	</div>
	
	<div id = "search">
		<%
			String st = (String)session.getAttribute("msgSearch");
			if(st != null){
				out.print(st);
			}else{
				
				out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
				out.print("<h1 style='color: blue;'>Welcome "+(String)session.getAttribute("usr")+"<br></h1>");
				out.print("</div>");
				out.print("<image height=600px width=630px src = 'https://as2.ftcdn.net/v2/jpg/04/14/99/65/1000_F_414996588_b5mITjbpbtbBqFdiSAQZfDRdWV3cNnGo.jpg'>");
			}
			session.setAttribute("msgSearch",null);
		%>
	</div>
	
	<%! public static String Email=""; %>
	
	
	<div name ="add" id="add">
			<h1>Add Event</h1>
			<div style="background-color: white; padding: 25px; width">
				<h2>Enter Details</h2>
					<form id="addition" onsubmit='add()' name ="addition" method="post" action ="add">
						<input  type = "text"  	placeholder="Event Name :" 	name ="ename" id="niname" value="" ><br><br>
						<input 	type = "text" placeholder="City  :" 	  	name ="ecity" id="nprice" value="" ><br><br>
						Category:<br>
						<select name="cat" id="cat">
    							<option value="comedy show">comedy show</option>
    							<option value="motivational talk">motivational talk</option>
    							<option value ="festival celebration">festival celebration</option>
    							<option value ="exhibitions">exhibitions</option>
    							<option value ="blood donation camps">blood donation camps</option>
 						</select><br><br>
						
						Date;<br>
						<input 	type = "date" placeholder="Date :" 		name ="date" id="nstock" value="" ><br><br>
						Time<br>
						<input 	type = "time" placeholder="time :" 	name ="time" id="ndiscount" value="" ><br><br>
						<input 	type = "number" 	placeholder="total seats :" name ="tseats"  id="ndesc" value=""  ><br><br>
						<input 	type = "number" 	placeholder="available seats :" name ="aseats"  id="ndesc" value=""  ><br><br>
						<input 	type = "number" 	placeholder="Price :" name ="price"  id="nd" value=""  ><br><br>
						<button type="submit">Confirm Event</button>
					
						<div>
						<%
							if(session.getAttribute("msgAdd") == null){
								;
							}else{
								out.print(session.getAttribute("msgAdd"));
								session.setAttribute("msgAdd",null);
							}
						%>
						</div>		
					</form>
			</div>
	</div>
	
	<div name ="update" id="update">
			<h1>Update Event</h1>
			<form id="updatation"  onsubmit = "update()" name ="updation" method="post" action ="update">
					<h2>Enter Event Name</h2>
					<input 	type="text" 	placeholder="Event name :" 	name = "id" 	id="id" 	value="" ><br><br>
					<h2>Enter the field which you want to update</h2><br>
					<input 	type = "text" placeholder="City  :" 	  	name ="ecity" id="nprice" value="" ><br><br>
						Category:<br>
						<select name="cat" id="cat">
    							<option value="comedy show">comedy show</option>
    							<option value="motivational talk">motivational talk</option>
    							<option value ="festival celebration">festival celebration</option>
    							<option value ="exhibitions">exhibitions</option>
    							<option value ="blood donation camps">blood donation camps</option>
 						</select><br><br>
						
						Date;<br>
						<input 	type = "date" placeholder="Date :" 		name ="nstock" id="nstock" value="" ><br><br>
						Time<br>
						<input 	type = "time" placeholder="time :" 	name ="ndiscount" id="ndiscount" value="" ><br><br>
						<input 	type = "number" 	placeholder="total seats :" name ="ndesc"  id="ndesc" value=""  ><br><br>
						<input 	type = "number" 	placeholder="available seats :" name ="ndesc"  id="ndesc" value=""  ><br><br>
						<input 	type = "number" 	placeholder="Price :" name ="ndesc"  id="ndesc" value=""  ><br><br>
						<button type="submit">Confirm Event</button>
					<div>
						<%
							if(session.getAttribute("msgUpdate") == null){
								;
							}else{
								out.print(session.getAttribute("msgUpdate"));
								session.setAttribute("msgUpdate",null);
							}
						%>
					</div>
			</form>
	</div>
	
	<div name ="account" id ="account" class="acc">
			
			
					<h2>My Account</h2>
			
					<div style="">
							<image height="100" width="100" src ='https://www.shutterstock.com/image-vector/my-account-profile-user-icon-600w-1700343232.jpg'>
					</div>
		
					
					<div style="">
					<%
							String name = (String)session.getAttribute("usr");
					%><br><br>
					<%
							String Password = (String)session.getAttribute("pass");
					%><br><br>
		
					<%
							String url = "jdbc:mysql://localhost:3306/EMS";
							String usr = "mahendar";
							String password = "Medha@2020";
					
							try(Connection con = DriverManager.getConnection(url,usr,password);){
									String query ="select * from User_Info where name = '"+name+"' and password = '"+Password+"';";
									Statement s = con.createStatement();
									ResultSet r = s.executeQuery(query);
						
									if(r.next()){
											Email = r.getString(4);
											session.setAttribute("eid",Email);
											out.print("<span><b>Manager Id :  </b>"+r.getInt(3)+"</span><br><br>");
											out.print("<span><b>Shopkeeper name  :</b></span>"+name+"<br><br>");
											out.print("<span><b>Password  :</b>"+Password+"</span><br><br>");
											out.print("<span><b>Email id :</b>"+session.getAttribute("eid")+"</span>");
									}
									con.close();	
							}catch(SQLException e){
									out.print("can't find email");
							}
					%>
					</div>
			
	</div>
	
	
	
	
	
	<div name="items" id ="item" class="item">
			
			<% 
				try(Connection con = DriverManager.getConnection(url,usr,password);){
					String query ="select * from Event_Details;";
					Statement s = con.createStatement();
					ResultSet r = s.executeQuery(query);
					
					int count=0;
					out.print("<table><tr>");
					out.print("<th>Event Name</th>");
					out.print("<th>City</th>");
					out.print("<th>Category</th>");
					out.print("<th>Date</th>");
					out.print("<th>Time</th>");
					out.print("<th>Total Seats</th>");
					out.print("<th>Available Seats </th>");
					out.print("<th>Ticket Price</th>");
					out.print("<th>Cancel</th></tr>");
					while(r.next()){
						count++;
						String Event_name = r.getString(8);
						String City_name = r.getString(1);
						String Event_Category = r.getString(2);
						String Event_date  = r.getString(3);
						String Event_time = r.getString(4);
						int total_seats = r.getInt(5);
						int available_seats = r.getInt(6);
						double price = r.getDouble(7);
						
							out.print("<tr>");
									out.print("<td>"+Event_name+"</td>");
									out.print("<td>"+City_name+"</td>");
									out.print("<td>"+Event_Category+"</td>");
									out.print("<td>"+Event_date+"</td>");
									out.print("<td>"+Event_time+"</td>");
									out.print("<td>"+total_seats+"</td>");
									out.print("<td>"+available_seats+"</td>");
									out.print("<td>"+price+"</td>");
								
							
								
								
								out.print("<td>");
								out.print("<form id='removal' method ='post' action = 'removeProduct'>");
								out.print("<input type = 'hidden' name ='rid' id='rid' value='"+Event_name+"'	>");
								out.print("<button type='submit'>Remove</button>");
								out.print("</form>");
								out.print("</td>");
									
								out.print("</tr>");
						
							
					}
					out.print("</table");
					if(count ==0){
						out.print("All events closed");
					}
					con.close();	
			}catch(SQLException e){
				out.print("can't connect to Database");
			}
		%>
		
	</div>
	
	

	
	
	
	<script>
		$(document).ready(function(){
	    	// To display My account
	    	$("#btn1").click(function(){
	      		$("#account").css("display", "block");
	        	$("#item").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#add").css("display", "none")
	      		$("#update").css("display", "none")
	    	});
	    
	    	// To display Items
	    	$("#btn2").click(function(){
	    			$("#account").css("display", "none");
		        	$("#item").css("display", "block");
		      		$("#search").css("display", "none");
		      		$("#add").css("display", "none");
		      		$("#update").css("display", "none")
	      		
	    	});
	    	$("#btn3").click(function(){
    			$("#account").css("display", "none");
	        	$("#item").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#add").css("display", "block");
	      		$("#update").css("display", "none")
      		
    		});
	    	$("#btn4").click(function(){
    			$("#account").css("display", "none");
	        	$("#item").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "block")
      		
    	});
	    	
		});
	
		function add(){
			var a = document.getElementById("niname").value;
			var b = document.getElementById("nprice").value;
			var c = document.getElementById("nlink").value;
			var d = document.getElementById("nstock").value;
			var e = document.getElementById("ndiscount").value;
			var f = document.getElementById("ndesc").value;
			
			if(a==""){
				alert("please enter item name");
			}
			if(b==""){
				alert("please enter item price");
			}
			if(c==""){
				alert("please enter item image link");
			}
			if(d==""){
				alert("please enter item stock");
			}
			if(e==""){
				alert("please enter item discount");
			}
			if(f==""){
				alert("please enter item descrption");
			}
			return;
		}
		
		function update(){
			var x = document.getElementById("id").value;
			if(x==""){
				alert("please enter item id");
			}else{
				if(NaN(x)){
					alert("please enter a number");
				}
			}
			return;
		}
		
		function usrSearch(){
			var x = document.getElementById("bid").value;
			if(x==""){
				alert("please enter buyer id");
			}else{
				if(NaN(x)){
					alert("please enter a number");
				}
			}
			return;
		}
		function ValidateTwodate(){
			var x = document.getElementById("isd").value;
			var y = document.getElementById("fsd").value;
			if(x ==""){
				alert("please enter start date");
			}
			if(y ==""){
				alert("please enter end date");
			}
			return;
		}
		
		function singleDate(){
			var x = document.getElementById("odate").value;
			if(x==""){
					alert("please enter date");
			}
			return;
		}
	</script>
	
</body>
</html>