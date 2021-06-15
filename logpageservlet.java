import java.io.*;
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logpageservlet
 */
@WebServlet("/logpageservlet")
public class logpageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//PrintWriter pw=response.getWriter();
		String email,password;
		email=request.getParameter("email");
		password=request.getParameter("password");
		String acctype="Creator";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement ps=con.prepareStatement("select * from logindetails where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				if(email.equalsIgnoreCase(rs.getString("email"))&& password.equalsIgnoreCase(rs.getString("password")))
				{
					HttpSession logp=request.getSession();
					logp.setAttribute("email",email);
					if(rs.getString("account_type").equalsIgnoreCase("personal")){
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/dashboard.jsp");
					rd.forward(request,response);
					}
					else if(rs.getString("account_type").equalsIgnoreCase("creator"))
					{
						HttpSession logc=request.getSession();
						logc.setAttribute("email",email);
						RequestDispatcher rd=getServletContext().getRequestDispatcher("/photographerprofile.jsp");
						rd.forward(request,response);
					}
					//System.out.println("hiii");
				}
				else
				{
					RequestDispatcher rd=getServletContext().getRequestDispatcher("");
					rd.forward(request,response);
					//System.out.println("byee");
										
					
				}
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
