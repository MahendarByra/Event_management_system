<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>User Home</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
				
				#account{
						background-color: white;
						width: 500px;
						height: 400px;
						margin: auto;
						display: none;
						text-align: center;
							
				}
				
				#event{	
						width: 50%;
						height: 100%;
						margin: auto;
						padding: 15px;	
						display: none;
						background-color: white;
				}
		
				#search{
						width: 80%;
						height: 100%;
						margin: auto;
						position: relative;	
						display: none;
						margin: auto;
						background-color: white;
						text-align: center;
						border: 2px solid black;
				}
				
				#onload{	
						
						width: 100%;
						height: 100%;
						margin: auto;
						position: relative;	
						display: block;
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
						height: 200px;
						background-color: white;
						
				}
		
				.div2{
						padding: 5px;
						width: 750px;
						height: 200px;
						background-color: white;
						text-align: left;
						float: left;
				}
		
				.div3{
						width: 100px;
						height: 100px;
						background-color: white;
						float: left;
				}
		
				.div4{
						padding: 15px;
						border: 2px solid black;
						width: 95%;
						height: 170px;
						background-color: white;
						margin: auto;
				}
		
				.div5{
						padding: 5px;
						width: 550px;
						height: 170px;
						background-color: white;
						float: left;
				}
		
				.div6{
						width: 150px;
						height: 150px;
						background-color: white;
						float: left;
				}
		
	
button{
  background-color: #0095ff;
  border: 1px solid transparent;
  border-radius: 3px;
  box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: -apple-system,system-ui,"Segoe UI","Liberation Sans",sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 1.15385;
  margin: 0;
  outline: none;
  padding: 8px .8em;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

button:hover,
button:focus {
  background-color: #07c;
}

button:focus {
  box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
}

button:active {
  background-color: #0064bd;
  box-shadow: none;
}
			
			
			body{
					/*background-image: url("https://images.pexels.com/photos/382297/pexels-photo-382297.jpeg?cs=srgb&dl=pexels-salah-alawadhi-382297.jpg&fm=jpg");*/
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
	<div style = "background-color: black; text-align: center;padding: 10px;">
		<h1 style="color:red; font-size: 50px;">Welcome to Book Your Event</h1>
	</div>
	</header>
		
		
	<hr style="color:blue;">
	
	<div style=" padding: 2px; background-color: black;" id = "navBar">
				<button type = "button" id="btn1" class="acc">My Account</button>
				<button type = "button" id="btn2" class ="event">Events</button> 
				<button type = "button" id="btn3" class="search">search Event</button>
				<button type="button" id ="btn10" >My Tickets</button>
				<button onclick = "window.location.href = 'Interface.jsp'">Log out</button>
	</div>
		
		
		<div id = "onload">
		<%
				if(session.getAttribute("Messearch")!=null){
					out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
					out.print(session.getAttribute("Messearch"));
					session.setAttribute("Messearch",null);
					out.print("</div>");
				
				}else if(session.getAttribute("msgsearch")!=null){
						out.print(session.getAttribute("msgsearch"));
								session.setAttribute("msgsearch",null);
				}else{
						out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
						out.print("<h1 style='color: blue'>Welcome "+(String)session.getAttribute("usr")+"<br>Book Your Ticket</h1>");
						out.print("</div>");
						out.print("<image height = 600px width=630px src = 'https://as2.ftcdn.net/v2/jpg/04/14/99/65/1000_F_414996588_b5mITjbpbtbBqFdiSAQZfDRdWV3cNnGo.jpg'><br>");
				}
				
		%>
	
	</div>
			
	<%! public static String Email="";
				public static int User_id = -1;
				public static int Item_id = -1;
		%>
	
		<div name="account" id ="account" class="acc">
					<h2>My Account</h2>
			
					<div style="">
							<image height="100" width="100" src ='https://www.shutterstock.com/image-vector/my-account-profile-user-icon-600w-1700343232.jpg'>
					</div>
		
					<div style="">
							<%
									String url = "jdbc:mysql://localhost:3306/EMS";
									String usr = "mahendar";
									String password = "Medha@2020";
					
									try(Connection con = DriverManager.getConnection(url,usr,password);){
											String query ="select * from User_Info where name = '"+session.getAttribute("usr")+"' and password = '"+session.getAttribute("pass")+"';";
											Statement s = con.createStatement();
											ResultSet r = s.executeQuery(query);
											
											if(r.next()){
													session.setAttribute("usrId",r.getInt(3));
													out.print("<span><b>Id: </b>"+session.getAttribute("usrId")+"</span><br>");
													out.print("<span><b>Username  :</b></span>"+session.getAttribute("usr")+"<br>");
													out.print("<b>Password  :</b>"+session.getAttribute("pass")+"<br>");
													out.print("<b>Email id :</b>"+r.getString(4)+"<br><br>");
											}
											con.close();	
									}catch(SQLException e){
											out.print("can't find email");
									}
							%>
				</div>
	</div>
	
	
		<div id="search" name="searching">
			<h1>Select City</h1>
			
				<input type="hidden" name="uid" value="<%out.print(User_id); %>">
				City:<br>
				<select name="city" id="city">
    							<option value="hyderabad">hyderabad</option>
    							<option value="chennai">chennai</option>
    							<option value="kolkata">kolkata</option>
    							<option value="mumbai">mumbai</option>
    							<option value="karimnagar">karimnagar</option>
    							<option value="secunderabad">secunderabad</option>
    							<option value="warangal">warangal</option>
    							<option value="vizag">vizag</option>
    							<option value="banglore">banglore</option>
    							<option value="pune">pune</option>
    							<option value="thiruvanathapuram">thiruvanathapuram</option>
    							<option value="bhopal">bhopal</option>
    							<option value="kakinada">kakinada</option>
    							<option value="goa">goa</option>
 				</select><br><br>
 				
 				<button id="btn4" onclick = "listCategory()" >search</button><br><br>
			
			<% /*if(session.getAttribute("Messearch") != null){
					out.print(session.getAttribute("Messearch"));
					session.setAttribute("Messearch",null); 
			}*/
			%>
	
	</div>
	
		<div id="myTickets" name="myTickets"  style="display: none; background-color: white; border:2px solid black; margin:auto; width: 75%;">
				<h1>My Tickets</h1>
						<% 
						try(Connection con = DriverManager.getConnection(url,usr,password);){
								String query ="select count(ticket_no),Event_Ticket_Booking_details.Event_name from Event_Details,Event_Ticket_Booking_details where Event_Details.Event_name = Event_Ticket_Booking_details.Event_name and User_name='"+session.getAttribute("usr")+"' group by Event_Ticket_Booking_details.Event_name;";
								Statement s = con.createStatement();
								ResultSet r = s.executeQuery(query);
									
								out.print("<table><tr>");
									out.print("<th>Event Name</th>");
									out.print("<th>City</th>");
									out.print("<th>Category</th>");
									out.print("<th>Date</th>");
									out.print("<th>Time</th>");
									out.print("<th>Ticket Price</th>");
									out.print("<th>number of tickets</th></tr>");
											
									while(r.next())
									{
											String Event_name = r.getString(2);
											int count = r.getInt(1);
											String q ="select * from Event_Details where Event_name = '"+Event_name+"';";
											Statement s1 = con.createStatement();
											ResultSet r1 = s1.executeQuery(q);
											r1.next();
												
											String date = r1.getString(3);
											String time= r1.getString(4);
											String City = r1.getString(1);
											String Category = r1.getString(2);
											int price = r1.getInt(7);
												
											out.print("<tr><td>"+Event_name+"</td>");
											out.print("<td>"+City+"</td>");
											out.print("<td>"+Category+"</td>");
											out.print("<td>"+date+"</td>");
											out.print("<td>"+time+"</td>");
											out.print("<td>"+price+"</td>");
											out.print("<td>"+count+"</td></tr>");
												
									}
								out.print("</table>");
								con.close();	
						}catch(SQLException e){
								out.print("can't find email");
						}
						%>
		</div>
	
		<div name="events" id ="event" class="item">
			
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
					
										while(r.next())
										{
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
														out.print("<button type='submit'>Book</button>");
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
	        	$("#event").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#onload").css("display", "none");
	      		$("#myTickets").css("display","none");
	      	
	    	});
	    
	    	// To display all Events
	    	$("#btn2").click(function(){
	        	$("#account").css("display", "none");
	      		$("#event").css("display", "block");
	      		$("#search").css("display", "none");
	      		$("#onload").css("display", "none");
	      		$("#myTickets").css("display","none");
	      		
	    	});
	    	
	    	//To display Search division
	  		$("#btn3").click(function(){
	        	$("#account").css("display", "none");
	      		$("#event").css("display", "none");
	      		$("#search").css("display", "block");
	      		$("#onload").css("display", "none");
	      		$("#myTickets").css("display","none");
	    	});
	  		
	  
	  		$("#btn10").click(function(){
	        	$("#account").css("display", "none");
	      		$("#event").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#onload").css("display", "none");
	      		$("#myTickets").css("display","block");
	      		
	    	});
	  		
		});
	
		function addToC()
		{
				var x = document.getElementById("qtty").value;
				if(x=="")
				{
						alert("please enter quantity");
				}
				else
				{
						if(NaN(x))
						{
								alert("please enter number");
						}
				}
		}
		
		function listCategory()
		{
				let x = document.getElementById("city").value; 
				const xhttp = new XMLHttpRequest();
				alert("1");
				xhttp.onreadystatechange  = function() {
						alert("5"+this.status);
						if (this.readyState == 4 && this.status == 200) 
						{
								alert("2");
								document.getElementById("search").innerHTML = this.responseText;
						}
				};
				alert("3");	 
				xhttp.open("GET", "getCategory.jsp?city="+x);
				alert("4");
				xhttp.send();
		}
	</script>
	
</body>
</html>