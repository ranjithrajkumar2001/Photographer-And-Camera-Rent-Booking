import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class orderservlet
 */
@WebServlet("/orderservlet")
public class orderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String name,address,email,location,category,price,status,phonenumber,date,studioname;
		name=request.getParameter("firstname");
		address=request.getParameter("address");
		email=request.getParameter("email");
		location=request.getParameter("location");
		category=request.getParameter("category");
		price=request.getParameter("price");
		date=request.getParameter("date");
		studioname=request.getParameter("studioname");
		phonenumber=request.getParameter("phonenumber");
		status="Waiting";
		int id=0;
		//System.out.println(name);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement ps=con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, address);
			ps.setString(4, email);
			ps.setString(5, location);
			ps.setString(6, category);
			ps.setString(7, price);
			ps.setString(8,phonenumber);
			ps.setString(9, date);
			ps.setString(10, studioname);
			ps.setString(11, status);
			ps.executeUpdate();
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/enquiry.jsp");
			rd.forward(request,response);
			con.close();
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	
	}

}
