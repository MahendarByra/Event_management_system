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
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/forLogin")
public class Login extends HttpServlet{
//Instance Variables
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static String title = "";
//Methods  
	
		public Login() {
			super();
			// TODO Auto-generated constructor stub
		}
    
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String Name = request.getParameter("usr");
				String Pass = request.getParameter("pass");
				if(Name.equals("")) {
					response.sendRedirect("Interface.jsp");
				}else if(Pass.equals("")) {
					response.sendRedirect("Interface.jsp");
				}
				else {
				HttpSession session = request.getSession();
				
				String Category = request.getParameter("cat");
		
				if( Login(Name ,Pass,Category)) {
						if(Category.equals("User")) {
							synchronized(session) {
								session.setAttribute("usr", Name);
								session.setAttribute("pass", Pass);
							}
							response.sendRedirect("UserHome.jsp");
						}else {
							synchronized(session) {
								session.setAttribute("usr", Name);
								session.setAttribute("pass", Pass);
							}
							response.sendRedirect("ManagerHome.jsp");
						}
				}else {
						title="please enter a valid username";
						session.setAttribute("msgLogin", title);
						response.sendRedirect("Interface.jsp");
				}
		
				}
		
		}
    
	
	
		public static boolean Login(String name, String pass, String category){
				String url = "jdbc:mysql://localhost:3306/EMS";
				String usr = "mahendar";
				String password = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						
						if(category.equals("User")) {
								String query = "select * from User_Info where name = '"+name+"' and password = '"+pass+"' and category = '"+category+"';";
								Statement s = con.createStatement();
								ResultSet r = s.executeQuery(query);
					
								if(r.next()) {
										con.close();
										return true;
								}else {
										con.close();
										return false;
								}
				
						}else if(category.equals("Manager")){
								String query = "select * from User_Info where name = '"+name+"' and password = '"+pass+"' and category = '"+category+"';";
								Statement s = con.createStatement();
								ResultSet r = s.executeQuery(query);
					
								if(r.next()) {
										con.close();
										return true;
								}else {
										con.close();
										return false;
								}
						}
						else {
								title = "please enter a valid Category";
								con.close();
								return false;
						}
		
				}catch(SQLException e) {
						title = "Connection Error";
						return false;
				}
		}
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
		}	
}
