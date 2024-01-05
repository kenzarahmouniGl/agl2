<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Penalisation</title>
 <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background-image: url('livre.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

          header {
            background-color: #DEB887;
            color: #CD853F;
            padding: 10px;
            text-align: right;
            width: 100%;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            margin: 20px;
            padding: 20px;
            background-color: #DEB887;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
</style>
</head>
<body>

    <h2>Penalisation</h2>
    
    <form action="penalisation" method="post">
        <label for="ouvrageId">ID de l'ouvrage:</label>
        <input type="text" id="ouvrageId" name="ouvrageId" required>
        <br>
        <input type="submit" value="Vérifier la penalisation">
    </form>

    <p>${message}</p>
</body>
</html>