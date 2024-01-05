<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Prolonger</title>
   
</head>
<body>
    <%
        String idEmprunt = request.getParameter("id");

        String url = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd = "";

        try (Connection con = DriverManager.getConnection(url, user, pwd)) {
            // R�cup�rer la date de retour actuelle
            String selectQuery = "SELECT date_retour(date_retour, INTERVAL 10 DAY) FROM emprunter WHERE id_emprunt = 14";

            try (PreparedStatement selectPst = con.prepareStatement(selectQuery)) {
                selectPst.setString(1, idEmprunt);
                ResultSet resultSet = selectPst.executeQuery();

                if (resultSet.next()) {
                    // Mettre � jour la date de retour
                    String updateQuery = "UPDATE emprunter SET date_retour = ? WHERE id_emprunt = ?";
                    try (PreparedStatement updatePst = con.prepareStatement(updateQuery)) {
                        updatePst.setDate(1, resultSet.getDate(1));
                        updatePst.setString(2, idEmprunt);

                        int rowsUpdated = updatePst.executeUpdate();

                        if (rowsUpdated > 0) {
                            // Rediriger l'utilisateur vers une autre page apr�s la prolongation
                            response.sendRedirect("Emprunter.jsp");
                        } else {
                            // G�rer l'�chec de la mise � jour
                            response.sendRedirect("erreur.jsp");
                        }
                    }
                } else {
                    // G�rer l'absence de r�sultat
                    response.sendRedirect("erreur.jsp");
                }
            }
        } catch (SQLException e) {
            // G�rer les erreurs de base de donn�es
            e.printStackTrace();
            response.sendRedirect("erreur.jsp");
        }
    %>
</body>
</html>