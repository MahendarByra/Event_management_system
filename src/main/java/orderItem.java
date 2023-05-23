import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.Date.*;

/**
 * Servlet implementation class orderItem
 */
@WebServlet("/bookmyTicket")
public class orderItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
     public static String msg ="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int user_id = Integer.parseInt(request.getParameter("userid"));
		String  event_name = (String)request.getParameter("eventname");
		int noOftickets = Integer.parseInt(request.getParameter("nooftickets"));
		String url = "jdbc:mysql://localhost:3306/EMS";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
			msg = "try";
			session.setAttribute("msgOrder", msg);
			//response.sendRedirect("UserHome.jsp");	
			
				String query = "select * from Event_Details  where Event_name = '"+event_name+"';";
				try(Statement s = con.createStatement();){
						ResultSet r = s.executeQuery(query);
				
						msg = "2try";
						session.setAttribute("msgOrder", msg);
						//response.sendRedirect("UserHome.jsp");	
						con.setAutoCommit(false);
						
						while(r.next()) {
							msg = "in while";
							session.setAttribute("msgOrder", msg);
							//response.sendRedirect("UserHome.jsp");	
						
							String Event_name = r.getString(8);
							String City_name = r.getString(1);
							String Event_Category = r.getString(2);
							String Event_date  = r.getString(3);
							String Event_time = r.getString(4);
							int total_seats = r.getInt(5);
							int available_seats = r.getInt(6);
							double price = r.getDouble(7);
							
							msg = "in while2";
							session.setAttribute("msgOrder", msg);
							//response.sendRedirect("UserHome.jsp");
							String q = "select * from User_Info where id = "+user_id;
							Statement s2 = con.createStatement();
							ResultSet r2 = s2.executeQuery(q);
							r2.next();
							msg = "in before if";
							session.setAttribute("msgOrder", msg);
							//response.sendRedirect("UserHome.jsp");
						
								if(available_seats >= noOftickets) {
									int n = noOftickets;
									msg = "in if";
									session.setAttribute("msgOrder", msg);
									//response.sendRedirect("UserHome.jsp");
									while(available_seats >= n && n>0) {
										msg = "in lst while";
										session.setAttribute("msgOrder", msg);
										//response.sendRedirect("UserHome.jsp");
										String template = "INSERT INTO Event_Ticket_Booking_details(City_name,Event_name,Date,Time,User_name,status) values(?,?,?,?,?,?)";
										PreparedStatement ins = con.prepareStatement(template);
										ins.setString(1, City_name);
										ins.setString(2,Event_name);
										ins.setDate(3,java.sql.Date.valueOf(Event_date));
										ins.setString(4,Event_time);
										ins.setString(5,r2.getString(1));
										ins.setString(6, "booked");
										ins.executeUpdate();
								
										msg = "bye"+event_name;
										session.setAttribute("msgOrder", msg);
										//response.sendRedirect("UserHome.jsp");
										String q3 = "update Event_Details set Available_seats = Available_seats  - 1 where Event_name = '"+event_name+"';";
										Statement s3 = con.createStatement();
										s3.executeUpdate(q3);
										msg = "ooooo";
										session.setAttribute("msgOrder", msg);
										//response.sendRedirect("UserHome.jsp");
										
										n--;
								
									}
								}else {
										msg += "not is not available\n";
								}
						
						
						
						}
						session.setAttribute("msgOrder", msg);
						response.sendRedirect("UserHome.jsp");
						con.commit();
				
				}catch(SQLException ex) {
					try{
						con.rollback();
					}catch(SQLException ex2){
						msg += "Transaction failed\n";
						session.setAttribute("msgOrder", msg);
					}
				}
				con.close();
		}catch(SQLException e) {
			
			msg="Connection error\n";
			session.setAttribute("msgOrder", msg);
			response.sendRedirect("UserHome.jsp");
		}
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
