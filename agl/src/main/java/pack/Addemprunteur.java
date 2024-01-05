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

@WebServlet("/Addemprunteur")
public class Addemprunteur extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("username") != null) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String date = request.getParameter("date");
            String adresse = request.getParameter("adresse");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String type = request.getParameter("type");

            String url = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String pwd = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(url, user, pwd);
                        PreparedStatement pst = con.prepareStatement(
                                "INSERT INTO emprunteur (nom,prenom,date_naissance,adresse,mobile,email,type) VALUES (?,?,?,?,?,?,?)")) {

                    pst.setString(1, nom);
                    pst.setString(2, prenom);
                    pst.setString(3, date);
                    pst.setString(4, adresse);
                    pst.setString(5, mobile);
                    pst.setString(6, email);
                    pst.setString(7, type);

                    pst.executeUpdate();
                    response.sendRedirect("gestion.jsp");
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
