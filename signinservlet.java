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
 * Servlet implementation class signinservlet
 */
@WebServlet("/signinservlet")
public class signinservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String firstname,lastname,email,pass,address,acc_type;
		firstname=request.getParameter("fname");
		lastname=request.getParameter("lname");
		email=request.getParameter("email");
		pass=request.getParameter("password");
		address=request.getParameter("address");
		acc_type=request.getParameter("type");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
			PreparedStatement st=con.prepareStatement("select * from logindetails where email=?");
			st.setString(1,email);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				//pw.println("<script>alert('Mail id already registered')</script>");
				//request.setAttribute("message","Mail Already registered");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/signin.jsp");
				rd.forward(request,response);
			}
			else
			{
				PreparedStatement ps2=con.prepareStatement("insert into logindetails values(?,?,?,?,?,?)");
				ps2.setString(1,firstname);
				ps2.setString(2,lastname);
				ps2.setString(3,email);
				ps2.setString(4,pass);
				ps2.setString(5,address);
				ps2.setString(6, acc_type);
				int flag=ps2.executeUpdate();
				if(acc_type.equalsIgnoreCase("personal"))
				{
					//pw.println("<script>alert('successfully registered')</script>");
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/logpage.jsp");
					rd.forward(request,response);
				}
				else
				{
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/register.jsp");
					rd.forward(request,response);
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
