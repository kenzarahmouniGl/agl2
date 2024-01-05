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
@WebServlet("/Addouvrage")
public class AddOuvrage extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            String titre = request.getParameter("titre");
            String auteur = request.getParameter("auteur");
            String rayon = request.getParameter("rayon"); // Correction ici

            String url = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String pwd = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(url, user, pwd);
                        PreparedStatement pst = con.prepareStatement(
                        		"INSERT INTO ouvrage (titre,auteur,annee,type,editeur,auteur,rayon) VALUES (?,?,?,?,?,?,?)")) {

                    pst.setString(1, titre);
                    pst.setString(2, auteur);
                    pst.setString(3, rayon);
                    pst.setString(4, titre);
                    pst.setString(5, auteur);
                    pst.setString(6, rayon);
                    pst.setString(7, rayon);
                    pst.executeUpdate();
                    response.sendRedirect("biblio.jsp");
                } catch (Exception e) {
                    // Utilisation d'une fonction de journalisation appropriée
                    e.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                // Utilisation d'une fonction de journalisation appropriée
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("auth.jsp");
        }
    }
}
