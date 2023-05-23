<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@page import = "java.sql.Connection" %>
		<%@page import = "java.sql.DriverManager" %>
		<%@page import = "java.sql.Statement" %>
		<%@page import = "java.sql.ResultSet" %>
		<%@page import = "java.sql.SQLException" %>
		
		<%
		String url = "jdbc:mysql://localhost:3306/EMS";
		String usr = "mahendar";
		String pass = "Medha@2020";
		
		String city = request.getParameter("city");
		
		try(Connection con = DriverManager.getConnection(url,usr,pass);)
		{
			String query = "select * from Event_Details where City_name  = '"+city+"';";
			Statement s = con.createStatement();
			ResultSet r = s.executeQuery(query);
			if(!r.next())
			{
					out.print("<h3 style='color: red;'>No shows available</h3>");
			}else
			{
					out.print("<div style='width: 100%; height: 200px ; padding: 15px;'>");
					out.print("<h2>Select category</h2>");
					out.print("<form method='post' action='search'>");
					out.print("<input type='hidden' name='city' id='city' value='"+city+"'>");
					out.print("<input type='hidden' name='uid' id='hidden' value='"+session.getAttribute("usrId")+"'>");
					out.print("Category<br><br>");
					out.print("<select name='category' id='category'>");
			
					int count = 0;
			
					do
					{
							count++;
							String Event_Category = r.getString(2);
					
							out.print("<option value='"+Event_Category+"' >"+Event_Category+"</option>");			
					}while(r.next());
					out.print("</select>");
					out.print("<button type='submit' id='btn6'>search</button>");
					out.print("</form>");
					out.print("</div>");
			}
			
			con.close();
	}catch(SQLException e) {
			out.print("Error :"+e);
	}
		%>
</body>
</html>