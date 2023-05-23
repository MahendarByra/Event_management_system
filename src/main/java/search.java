

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
		private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
		public search() {
			super();
        // TODO Auto-generated constructor stub
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String title="";
				HttpSession session = request.getSession();
				session.setAttribute("msgsearch",null);
				int user_id = Integer.parseInt(request.getParameter("uid"));
				String city = request.getParameter("city");
				String category = request.getParameter("category");
		
				String url = "jdbc:mysql://localhost:3306/EMS";
				String usr = "mahendar";
				String password = "Medha@2020";
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						String query = "select * from Event_Details where City_name  = '"+city+"' and Event_category = '"+category+"';";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
				
						while(r.next()){
							String Event_name = r.getString(8);
							String City_name = r.getString(1);
							String Event_Category = r.getString(2);
							String Event_date  = r.getString(3);
							String Event_time = r.getString(4);
							int total_seats = r.getInt(5);
							int available_seats = r.getInt(6);
							double price = r.getDouble(7);
								
								title += "<div class = 'div1'>";
								title +="<div class = 'div2'>";
								title +="<span><font color='blue'><b>Event name : </b></font>"+Event_name+"</span><br>";
								title +="<span><font color='blue'><b>City : </b></font>"+City_name +"</span><br>";
								title +="<span><font color='blue'><b>Event_Category: </b></font>"+Event_Category+"</span><br>";
								title +="<span><font color='blue'><b>Event_date : </b></font>"+Event_date +"</span><br>";
								title +="<span><font color='blue'><b>total_seats  : </b></font>"+total_seats +"</span><br>";
								title +="<span><font color='blue'><b>Available seats  : </b></font>"+available_seats +"</span><br>";
								title +="<span><font color='blue'><b>price =  :</b></font>"+price +"</span>";
								title +="</div>";
							
								
								
								title += "<div style='float: right;padding: 20px;'>";
								title +="<h2>Book your Show</h2>";
								
								title += "<form onsubmit = 'addToC()' method = 'post' action ='bookmyTicket'>";
								title += "<input type = 'hidden' name = 'userid'      value ="+user_id+">";
								title += "<input type = 'hidden' name = 'eventname'  value = "+Event_name+"><br>";
								title += "<input type = 'number' name = 'nooftickets'  placeholder='number of tickets'	 value =''><br><br>";
								title += "<button type='submit'>Book</button>";
								title += "</form>";
								title += "</div>";
								
								title +="</div>";
								
						
								
								session.setAttribute("msgsearch", title);
								response.sendRedirect("UserHome.jsp");
								con.close();
						}
					
						if(!r.next()){
								title = "Item not Available";
								//session.setAttribute("sitemnamebyusr", Item_name);
								session.setAttribute("msgsearch", title);
								response.sendRedirect("UserHome.jsp");
								con.close();
						}
				}catch(SQLException e) {
						//title = "Connection Error";
						//request.setAttribute("msgsearch", title);
						//requestDispatcher.forward(request, response);
				}
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
}

