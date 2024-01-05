
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    padding: 15px 30px;
            font-size: 1.5em;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            border: none;
            border-radius: 25px;
            transition: background-color 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.button:hover {
    background-color: #2980b9;
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
    <form action="AddOuvrage"  method="POST">
        <table>
            <tr>
                <td>Titre</td>
                <td><input type="text" name="titre" required></td>
            </tr>
            <tr>
                <td>Auteur</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
               <tr>
                <td>Année</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
               <tr>
                <td>Type</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
               <tr>
                <td>Editeur</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
               <tr>
                <td>Auteur</td>
                <td><input type="text" name="auteur" required></td>
            </tr>
            <tr>
                <td>Rayon</td>
                <td><input type="text" name="rayon" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit"  class="button"value="Ajouter"></td>
            </tr>
        </table>
    </form>
</body>

</html>