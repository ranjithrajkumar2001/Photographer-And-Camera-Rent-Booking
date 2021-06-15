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
 * Servlet implementation class rent1servlet
 */
@WebServlet("/rent1servlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class rent1servlet extends HttpServlet {
	private static final String UPLOAD_DIR="images";
	public String dbFileName = "";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("applicationPath:");
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        HttpSession ses=request.getSession();
	        Part proof = request.getPart("proof");
	        String filename = extractFileName(proof);//file name
	        String applicationpath=getServletContext().getRealPath("");
	        System.out.println("applicationpath:" +applicationpath);
	        String savepath="D:\\eclipse source\\Test\\WebContent"+File.separator+ filename;
	        System.out.println("savepath: "+ savepath);
	        File fileSaveDir = new File(savepath);
	        proof.write(savepath + File.separator);
	     
	        	HttpSession ses3=request.getSession();
	        	ses3.setAttribute("proof",savepath);
	        	RequestDispatcher rd=getServletContext().getRequestDispatcher("/rentbuy.jsp");
				rd.forward(request,response);
		    
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
