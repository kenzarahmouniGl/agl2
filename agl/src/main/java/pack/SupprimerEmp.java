package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SupprimerEmp")
public class SupprimerEmp extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null){
			String id = request.getParameter("id");
			
			String url  = "jdbc:mysql://localhost:3306/gestion";
			String user = "root";
			String pwd  = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, pwd);
				PreparedStatement pst=con.prepareStatement("DELETE FROM emprunteur WHERE id=?");
				pst.setString(1,id);
				pst.executeUpdate();
				response.sendRedirect("gestion.jsp");
				pst.close();
				con.close();
			}catch(Exception e) {
				System.out.print(e);
			}
		}else response.sendRedirect("auth.jsp");
	}


}