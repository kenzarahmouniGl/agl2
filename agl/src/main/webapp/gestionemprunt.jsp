<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String username = "";
 if(session.getAttribute("username")!=null){
     username = session.getAttribute("username").toString();
 }else{
     response.sendRedirect("auth.jsp");
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #B3B6B7;
            background-image: url('fond.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

 header {
            background-color: #B3B6B7;
            color: #000000;
            padding: 10px;
              display: flex;
    justify-content: space-between;
    align-items: center;
            width: 100%;
        }
        
header a.button {
    color: #FFFFFF;
    background-color: #000000;
    padding: 5px 10px;
    border: 1px solid #000000;
    text-decoration: none;
}

header a.button:hover {
    background-color: #000000;
    color: #FFFFFF;
}

        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin-top: 20px;
            background-color: #B3B6B7;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
             
        }

        th {
            background-color: #A9A9A9;
            color: #00000;
        }

        a {
            text-decoration: none;
            color: #F08080;
        }

        a:hover {
            text-decoration: underline;
        }

      
        .button {
    display: inline-block;
    background-color: #007bff;
    color: #fff;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    margin: 4px 2px;
      border-radius: 25px;
    cursor: pointer;
}

.button:hover {
    background-color: #0056b3;
}

tr:first-child td {
    font-weight: bold;
}
   
    </style>
</head>
<body>
 <header>
        Bonjour <%=username %><br>  <a href="Logout" class="button">Déconnexion</a>
    </header>
 <h1>Liste des  Emprunteurs et ouvrages empruntés</h1>

    <a href="Addouvrage.jsp"class="button">Ajouter un Ouvrage</a>
    <table>
        <tr>
            <th> tudiant</th>
            <th>Nombre d'ouvrages empruntés</th>
            <th>Action</th> <!-- Nouvelle colonne pour le bouton "Ajouter" -->
        </tr>
        <% 
            String url = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String pwd = "";
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(url, user, pwd);
                     PreparedStatement pst = con.prepareStatement("SELECT emprunteur.id, emprunteur.nom, COUNT(ouvrage.id) AS nombre_ouvrages_empruntes " +
                                                                "FROM emprunteur " +
                                                                "LEFT JOIN emprunter ON emprunteur.id = emprunter.id_emprunteur  " +
                                                                "LEFT JOIN ouvrage ON emprunter.id_ouvrage = ouvrage.id "+
                                                                "GROUP BY emprunteur.id")) {
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        int idEmprunteur = rs.getInt("id");
                        String nomEtudiant = rs.getString("nom");
                        int nombreOuvragesEmpruntes = rs.getInt("nombre_ouvrages_empruntes");
        %>
        <tr>
            <td><%= nomEtudiant %></td>
            <td><%= nombreOuvragesEmpruntes %></td>
            <td>
      
                <form action="biblio.jsp" method="get">
                    <input type="hidden" name="idEmprunteur" value="<%= idEmprunteur %>">
                    <input type="submit"  class="button"value="Ajouter">

                </form>
                <form action="livresemprunt.jsp" method="get">
                                       <input type="hidden" name="idEmprunteur" value="<%= idEmprunteur %>">
                    <input type="submit"  class="button"value="Livres empruntés"></form>
            </td>
        </tr>
        <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
     
</body>
</html>