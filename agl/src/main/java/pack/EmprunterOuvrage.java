package pack;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EmprunterOuvrage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String idEmprunteur = request.getParameter("idEmprunteur");
        String idOuvrage = request.getParameter("idOuvrage");

        String url = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd = "";
        try (Connection con = DriverManager.getConnection(url, user, pwd)) {
            // Insérer une nouvelle entrée dans la table "emprunter"
            String insertQuery = "INSERT INTO emprunter (id_emprunteur, id_ouvrage, date_emprunt, date_retour, nombre_emprunt) VALUES ('14', ?, NOW(), '2024-01-06', 2)";
            try (PreparedStatement insertPst = con.prepareStatement(insertQuery)) {
               
                insertPst.setString(1, idOuvrage);

                int rowsInserted = insertPst.executeUpdate();
                if (rowsInserted > 0) {
                    // Rediriger l'utilisateur vers une autre page après l'insertion
                    response.sendRedirect("gestionemprunt.jsp");
                } else {
                    // Gérer l'échec de l'insertion
                    response.sendRedirect("erreur.jsp");
                }
            }
        } catch (SQLException e) {
            // Gérer les erreurs de base de données
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
        }
    }
}
