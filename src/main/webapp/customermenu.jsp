<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Customer Actions</title>
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
        
        a.register {
            display: block;
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            margin: 10px auto;
            width: fit-content;
            text-align: center;
        }
        
        a.register:hover {
            background-color: #333;
            color: #fff;
        }
        
        a.login {
            display: block;
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #333;
            border-radius: 5px;
            margin: 10px auto;
            width: fit-content;
            text-align: center;
        }
        
        a.login:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
         
         <h1><a href="addcustomer">Register</a></h1>
         <h1><a href="customerloginform.jsp">Login</a></h1>
</body>
</html>