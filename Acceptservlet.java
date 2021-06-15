

import java.io.IOException;
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

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

/**
 * Servlet implementation class Acceptservlet
 */
@WebServlet("/Acceptservlet")
public class Acceptservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter pw=response.getWriter();
		String orderid=request.getParameter("orderid");
		int id=Integer.parseInt(orderid);
		String table=request.getParameter("tablename");
		String status="Accepted";
		if(table.equalsIgnoreCase("orders")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement ps=con.prepareStatement("update orders set status=? where order_id=?");
			ps.setString(1, status);
			ps.setInt(2, id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/photographerprofile.jsp");
		rd.forward(request,response);
		}
		else
		{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
				PreparedStatement ps=con.prepareStatement("update order_rent set status=? where order_id=?");
				ps.setString(1, status);
				ps.setInt(2, id);
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/photographerprofile.jsp");
			rd.forward(request,response);
			}
			
		}
	}


