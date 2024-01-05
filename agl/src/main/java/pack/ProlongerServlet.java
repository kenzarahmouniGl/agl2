package pack;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProlongerServlet")
public class ProlongerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   	String prolongerEmpruntId = (String) request.getAttribute("addTimeEmprunt");

	   	if (prolongerEmpruntId != null && !prolongerEmpruntId.isEmpty()) {
		   	int prolongerEmpruntIdInt = Integer.parseInt(prolongerEmpruntId);

	   		EmpruntDao.prolongeEmprunt(prolongerEmpruntIdInt);
	   	}
    	List<Emprunt> emprunts = EmpruntDao.getAllEmpruntNotRendu();

        request.setAttribute("emprunts", emprunts);


        RequestDispatcher dispatcher = request.getRequestDispatcher("prolongeManager.jsp");
        dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String prolongerEmpruntId = request.getParameter("addTimeEmprunt");
	   	System.out.print(prolongerEmpruntId);

	   	if (prolongerEmpruntId != null && !prolongerEmpruntId.isEmpty()) {
		   	int prolongerEmpruntIdInt = Integer.parseInt(prolongerEmpruntId);

	   		EmpruntDao.prolongeEmprunt(prolongerEmpruntIdInt);
	   	}
		List<Emprunt> emprunts = EmpruntDao.getAllEmpruntNotRendu();


        request.setAttribute("emprunts", emprunts);


        RequestDispatcher dispatcher = request.getRequestDispatcher("prolongeManager.jsp");
        dispatcher.forward(request, response);
	}

}