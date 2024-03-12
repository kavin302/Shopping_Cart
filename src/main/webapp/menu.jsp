<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Register and Login Page</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        
        h1 a {
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            margin: 0 10px;
        }
        
        h1 a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
         <h1> ${message}</h1>
        <h1><a href="addmerchant">Register</a></h1><br>
        
        <h1><a href="merchantloginform.jsp">Login</a></h1><br>
</body>
</html>