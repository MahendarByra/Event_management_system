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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Time;
@WebServlet("/add")
public class Adding extends HttpServlet{
	static Scanner sc = new Scanner(System.in);
	private static final long serialVersionUID = 1L;
	public static String title="";
//Methods  
	
	public Adding() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession();
		String Event_name = request.getParameter("ename");
		String City	 = request.getParameter("ecity");
		String Category	 = request.getParameter("cat");
		String date   = request.getParameter("date");
		String time = request.getParameter("time");
		String tseats    = request.getParameter("tseats");
		String aseats    = request.getParameter("aseats");
		String price    = request.getParameter("price");
		Time t = new Time(0);
		
		if(Event_name.equals("") || City.equals("") || Category.equals("") || date.equals("") || time.equals("") || tseats.equals("") || aseats.equals("") || price.equals("")) {
			response.sendRedirect("ManagerHome.jsp");
		}else {
		
		if( addEvent(Event_name,City,Category,date,time,tseats,aseats,price)) {
			session.setAttribute("msgAdd", title);
			response.sendRedirect("ManagerHome.jsp");
		}else {
			session.setAttribute("msgAdd", title);
			response.sendRedirect("ManagerHome.jsp");
		}
		
		}
    }
    
	
	
	public static boolean addEvent(String Event_name, String City, String Category, String date, String time, String tseats, String aseats,String price){
		String url = "jdbc:mysql://localhost:3306/EMS";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				String q1 = "select * from Event_Details  where Event_name = '"+Event_name+"';";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(q1);
				if(!r.next()) {
					title = "In try";
					String template = "INSERT INTO Event_Details(City_name,Event_category,Event_date,Event_time,total_seats,Available_seats,Price,Event_name) values(?,?,?,?,?,?,?,?)";
					PreparedStatement  ins = con.prepareStatement(template);
					ins.setString(1,City);
					ins.setString(2,Category);
					ins.setDate(3, java.sql.Date.valueOf(date));
					ins.setString(4, time);
					ins.setInt(5, Integer.parseInt(tseats));
					ins.setInt(6, Integer.parseInt(aseats));
					ins.setDouble(7, Double.parseDouble(price));
					ins.setString(8, Event_name);
					ins.executeUpdate();
					
					title = "Event added Successfully";
					con.close();
					return true ;
				}else {
					title = "Event already exists";
					con.close();
					return false;
				}
		}catch(SQLException e) {
			//title = "Connection Error";
			return false;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
		
}
