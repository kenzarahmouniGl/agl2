<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('fond.jpg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #DEB887;
        }

        form {
            background-color: rgba(1, 1, 0, 0.7); 
            padding: 80px;
            border-radius: 20px;
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);*/
            width: 500px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 5px;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            border: none;
            padding: 12px;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<form action="LoginServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="role">Role:</label>
    <select id="role" name="role" required>
        <option value="gestionnaire">Gestionnaire</option>
        <option value="bibliothecaire">bibliothecaire</option>
    </select><br>

    <input type="submit" value="Login">
</form>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.StringTokenizer" %>

<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>

</body>
</html>
