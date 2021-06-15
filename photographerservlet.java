import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 * Servlet implementation class photographerservlet
 */
@WebServlet("/photographerservlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class photographerservlet extends HttpServlet {
	
	private static final String UPLOAD_DIR="images";
	public String dbFileName = "";
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 System.out.println("applicationPath:");
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        HttpSession ses=request.getSession();
	        String firstname,lastname,email,password,phonenumber,job_type,address1,address2,studioname,city,state,pincode,website;
	        firstname=request.getParameter("firstname");
	        lastname=request.getParameter("lastname");
	        email=request.getParameter("email");
	        password=request.getParameter("password");
	        phonenumber=request.getParameter("phonenumber");
	        job_type=request.getParameter("job_type");
	        address1=request.getParameter("address1");
	        address2=request.getParameter("address2");
	        studioname=request.getParameter("studioname");
	        city=request.getParameter("city");
	        state=request.getParameter("state");
	        pincode=request.getParameter("pincode");
	        website=request.getParameter("website");
	        Part proof = request.getPart("proof");//
	        String filename = extractFileName(proof);//file name
	        String applicationpath=getServletContext().getRealPath("");
	        System.out.println("applicationpath:" +applicationpath);
	        String savepath="D:\\eclipse source\\Test\\WebContent"+File.separator+ filename;
	        System.out.println("savepath: "+ savepath);
	        File fileSaveDir = new File(savepath);
	        proof.write(savepath + File.separator);
	        try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bootathon2","db","java");
	        	PreparedStatement ps=con.prepareStatement("insert into photographerdetails values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        	ps.setString(1,firstname);
	        	ps.setString(2,lastname);
	        	ps.setString(3,email);
	        	ps.setString(4,password);
	        	ps.setString(5,job_type);
	        	ps.setString(6,address1);
	        	ps.setString(7,address2);
	        	ps.setString(8,city);
	        	ps.setString(9,state);
	        	ps.setString(10,pincode);
	        	ps.setString(11,savepath);
	        	ps.setString(12,website);
	        	ps.setString(13,phonenumber);
	        	ps.setString(14,studioname);
	        	ps.executeUpdate();
	        	RequestDispatcher rd=getServletContext().getRequestDispatcher("/photographerprofile.jsp");
				rd.forward(request,response);
		        con.close();
	        }
	        catch(Exception e)
	        {
	        	System.out.println(e);
	        }
	 }

		 

	 private String extractFileName(Part part) {//This method will print the file name.
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length() - 1);
	            }
	        }
	        return "";
	 }
}
