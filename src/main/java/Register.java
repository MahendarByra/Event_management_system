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

@WebServlet("/register")
public class Register extends HttpServlet{
//Instance variables	
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static  String title="";

//Methods  
		public Register() {
				super();
				// TODO Auto-generated constructor stub
		}
    
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				String Name = request.getParameter("nusr");
				String Pass = request.getParameter("npass");
				HttpSession session = request.getSession();
				
				String Category = request.getParameter("ncat");
				String Email = request.getParameter("eid");
				if(Name.equals("") || Pass.equals("") || Email.equals("")) {
					response.sendRedirect("Interface.jsp");
				}else {
				
    
	
	
				String url = "jdbc:mysql://localhost:3306/EMS";
				String usr = "mahendar";
				String password = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						if(Category.equals("User")) {
								String query = "select * from User_Info where email = '"+Email+"';";
								Statement s = con.createStatement();
								ResultSet r = s.executeQuery(query);
				
								if(!r.next()) {
										String template = "INSERT INTO User_Info(name, password, email,category)   values(?,?,?,?)";
										PreparedStatement  ins = con.prepareStatement(template);
						
										ins.setString(1,Name);
										ins.setString(2,Pass);
										ins.setString(3,Email);
										ins.setString(4,Category);
										ins.executeUpdate();
										con.close();
										title="registered successfully!";
										session.setAttribute("usr", Name);
										session.setAttribute("pass", Pass);
										response.sendRedirect("UserHome.jsp");
										
						
								}else {
										con.close();
										title="email id already exist enter new email id!";
										session.setAttribute("msgRegister", title);
										response.sendRedirect("Interface.jsp");
								}
						}else if(Category.equals("Manager")){
								String query = "select * from User_Info where email = '"+Email+"';";
								Statement s1 = con.createStatement();
								ResultSet r1 = s1.executeQuery(query);
					
								if(!r1.next()) {
										String template = "INSERT INTO User_Info(name, password, email,category)  values(?,?,?,?)";
										PreparedStatement  ins1 = con.prepareStatement(template);
										ins1.setString(1,Name);
										ins1.setString(2,Pass);
										ins1.setString(3, Email);
										ins1.setString(4,Category);
										ins1.executeUpdate();
										con.close();
										session.setAttribute("usr", Name);
										session.setAttribute("pass", Pass);
										response.sendRedirect("ManagerHome.jsp");
										
								}else {
									con.close();
									title="email id already exist enter new email id!";
									session.setAttribute("msgRegister", title);
									response.sendRedirect("Interface.jsp");
								}
						}else {
								con.close();
								title="please enter correct category";
								session.setAttribute("msgRegister", title);
								response.sendRedirect("Interface.jsp");
						}
				
				}catch(SQLException e) {
					title="Connection Error";
					session.setAttribute("msgRegister", title);
					response.sendRedirect("Interface.jsp");
				}
				}
		}
				
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
		}
		
}
