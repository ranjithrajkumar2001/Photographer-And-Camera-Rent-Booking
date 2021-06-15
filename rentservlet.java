

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class rentservlet
 */
@WebServlet("/rentservlet")
public class rentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String studioname,email,address,description,location,price,phonenumber,modelname,techdetails;
		studioname=request.getParameter("studioname");
		email=request.getParameter("email");
		price=request.getParameter("price");
		address=request.getParameter("address");
		techdetails=request.getParameter("tdetails");
		location=request.getParameter("location");
		price=request.getParameter("price");
		phonenumber=request.getParameter("phonenumber");
		modelname=request.getParameter("modelname");
		int flag=0;
		//PrintWriter pw=response.getWriter();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement ps=con.prepareStatement("insert into rent values(?,?,?,?,?,?,?,?)");
			ps.setString(1, studioname);
			ps.setString(2, price);
			ps.setString(3, address);
			ps.setString(4, techdetails);
			ps.setString(5, location);
			ps.setString(6, email);
			ps.setString(7, phonenumber);
			ps.setString(8, modelname);
			ps.executeUpdate();
			
				System.out.println("Successfully Registered");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/rent.jsp");
            	rd.forward(request,response);
			
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
