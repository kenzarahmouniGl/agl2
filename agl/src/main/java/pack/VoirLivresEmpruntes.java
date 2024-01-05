package pack;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Emprunt;

public class VoirLivresEmpruntes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idEmprunteur = request.getParameter("idEmprunteur");

        String url = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd = "";

        List<Emprunt> emprunts = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(url, user, pwd)) {
            String selectQuery = "SELECT * FROM emprunter WHERE id_emprunteur =13";
            try (PreparedStatement selectPst = con.prepareStatement(selectQuery)) {
                selectPst.setString(1, idEmprunteur);
                ResultSet rs = selectPst.executeQuery();

                while (rs.next()) {
                    Emprunt emprunt = new Emprunt();
                    emprunt.setId(rs.getString("id"));
                    emprunt.setIdOuvrage(rs.getString("id_ouvrage"));
                    emprunt.setDateEmprunt(rs.getString("date_emprunt"));
                    emprunt.setDateRetour(rs.getString("date_retour"));

                    emprunts.add(emprunt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
            return;
        }

        request.setAttribute("emprunts", emprunts);
        request.getRequestDispatcher("voirLivresEmpruntes.jsp").forward(request, response);
    }
}
