<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('fond.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            color: #black;
        }

        .container {
            text-align: center;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 200px; /* Ajustez cette valeur pour déplacer le texte vers le haut */
        }

        .btn-enter {
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

        .btn-enter:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>{Welcome to the Library Management System}</h1>
        <p>Explore our collection, borrow books, and enjoy a world of knowledge!</p>
        <a href="auth.jsp" class="btn-enter">Enter</a>
    </div>

</body>
</html>
