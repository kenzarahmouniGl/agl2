<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
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

        .add-button {
            background-color: #B3B6B7;
            color: #fff;
            padding: 10px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin-top: 10px;
        }

        .add-button:hover {
            background-color: #ff6666;
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
        Bonjour <%=username %><br>  <a href="Logout" class="button">Déconnexion</a></header>
         <h1>Liste des Livres emprunté par cet Emprunteur</h1>
        <table border="1">
        <tr>
            <th>ID de l'emprunt</th>
            <th>Titre</th>
            <th>Date d'emprunt</th>
            <th>Date de retour</th>
            <th>Action</th>
        </tr>
        <% 
        String url = "jdbc:mysql://localhost:3306/gestion";
        String user = "root";
        String pwd = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pwd);
            PreparedStatement pst = con.prepareStatement("SELECT e.id_emprunt, o.titre, e.date_emprunt, e.date_retour FROM emprunter e JOIN ouvrage o ON e.id_ouvrage = o.id WHERE e.id_emprunteur =14");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String id = rs.getString(1);
                String titre = rs.getString(2);
                String dateEmprunt = rs.getString(3);
                String dateRetour = rs.getString(4);
        %>
                <tr>
                    <td><%= id %></td>
                    <td><%= titre %></td>
                    <td><%= dateEmprunt %></td>
                    <td><%= dateRetour %></td>
                    <td>
                        <a href="SupprimerEmp?id=<%= id %>"  class="button">Supprimer</a>
                        <a href="ProlongerServlet?id=<%= id %>" class="button">Prolonger</a>
                        <a href="imprimer.jsp"class="button">Imprimer</a>

                    </td>
                </tr>
        <%
            }
            rs.close();
            pst.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        %>
    </table>

    
</body>
</html>