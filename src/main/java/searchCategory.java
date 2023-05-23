

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class searchCategory
 */
@WebServlet("/searchCategory")
public class searchCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title ="";	
		String city = (String)request.getParameter("city");
			int user_id = Integer.parseInt(request.getParameter("uid"));
			HttpSession session = request.getSession();
			session.setAttribute("Messearch", null);
			String url = "jdbc:mysql://localhost:3306/EMS";
			String usr = "mahendar";
			String password = "Medha@2020";
			try(Connection con = DriverManager.getConnection(url,usr,password);){
					String query = "select * from Event_Details where City_name  = '"+city+"';";
					Statement s = con.createStatement();
					ResultSet r = s.executeQuery(query);
					title+="<div style='width: 100%; height: 200px ; padding: 15px;'>";
					title +="<form method='post' action='search'>";
					title +="<input type='hidden' name='city' id='city' value='"+city+"'>";
					title +="<input type='hidden' name='uid' id='hidden' value='"+user_id+"'>";
					title+="Category<br><br>";
					title += "<select name='category' id='category'>";
					int count = 0;
					while(r.next()){
						count++;
						String Event_Category = r.getString(2);
							
							
							title += "<option value='"+Event_Category+"' >"+Event_Category+"</option>";
							
							
					}
					title += "</select>";
					title += "<button type='submit' id='btn6'>search</button>";
					title+="</form>";
					title+="</div>";
					if(count == 0) {
						session.setAttribute("Messearch", "No shows available");
					}else {
						session.setAttribute("Messearch", title);
					}
					
					response.sendRedirect("UserHome.jsp");
					con.close();
			}catch(SQLException e) {
					//title = "Connection Error";
					//request.setAttribute("msgsearch", title);
					//requestDispatcher.forward(request, response);
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
