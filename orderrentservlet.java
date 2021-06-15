

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class orderrentservlet
 */
@WebServlet("/orderrentservlet")
public class orderrentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String name,address,email,location,proof,modelname,duration,price,status,phonenumber,date,studioname;
		name=request.getParameter("name");
		address=request.getParameter("address");
		email=request.getParameter("email");
		location=request.getParameter("location");
		modelname=request.getParameter("modelname");
		duration=request.getParameter("duration");
		price=request.getParameter("price");
		studioname=request.getParameter("studioname");
		phonenumber=request.getParameter("phonenumber");
		HttpSession ses3=request.getSession();
		proof=String.valueOf(ses3.getAttribute("proof"));
		date=String.valueOf(ses3.getAttribute("date"));
		status="Waiting";
		int id=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
		PreparedStatement ps=con.prepareStatement("insert into order_rent values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, id);
		ps.setString(2, name);
		ps.setString(3, studioname);
		ps.setString(4, email);
		ps.setString(5, address);
		ps.setString(6, location);
		ps.setString(7, modelname);
		ps.setString(8,duration);
		ps.setString(9, date);
		ps.setString(10, price);
		ps.setString(11, proof);
		ps.setString(12, phonenumber);
		ps.setString(13, status);
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

