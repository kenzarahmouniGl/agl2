
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
    <meta charset="UTF-8">
    <title>Modifier Emprunteur</title>
</head>
<body>
    <h1>Modifier un emprunteur</h1>

    <%-- Récupération des attributs de requête pour pré-remplir le formulaire --%>
    <% String id = request.getAttribute("id").toString(); %>
    <% String nom = request.getAttribute("nom").toString(); %>
    <% String prenom = request.getAttribute("prenom").toString(); %>
    <% String dateNaissance = request.getAttribute("dateNaissance").toString(); %>
    <% String adresse = request.getAttribute("adresse").toString(); %>
    <% String mobile = request.getAttribute("mobile").toString(); %>
    <% String email = request.getAttribute("email").toString(); %>

    <form method="POST" action="Update">
        <input type="hidden" name="id" value="<%= id %>">

        <label for="nom">Nom :</label>
        <input type="text" name="nom" value="<%= nom %>" required><br>

        <label for="prenom">Prénom :</label>
        <input type="text" name="prenom" value="<%= prenom %>" required><br>

        <label for="dateNaissance">Date de naissance :</label>
        <input type="date" name="dateNaissance" value="<%= dateNaissance %>" required><br>

        <label for="adresse">Adresse :</label>
        <input type="text" name="adresse" value="<%= adresse %>" required><br>

        <label for="mobile">Mobile :</label>
        <input type="number" name="mobile" value="<%= mobile %>" required><br>

        <label for="email">Email :</label>
        <input type="text" name="email" value="<%= email %>" required><br>

        <input type="submit" value="Enregistrer les modifications">
    </form>
</body>
</html>
