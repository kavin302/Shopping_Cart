<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration Form</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .registration-form {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .registration-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .registration-form input[type="text"],
        .registration-form input[type="email"],
        .registration-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .registration-form input[type="text"]:focus,
        .registration-form input[type="email"]:focus,
        .registration-form input[type="password"]:focus {
            border-color: #5b9dd9;
        }

        .registration-form input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .registration-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="registration-form">
   <form:form action="savecustomer"  modelAttribute="customerobj" >
    <label for="name">Enter Name:</label>
        <form:input path="name" id="name"/><br>

        <label for="address">Enter Address:</label>
        <form:input path="address" id="address"/><br>

        <label for="mobile">Enter Mobile Number:</label>
        <form:input path="mobile" id="mobile"/><br>

        <label for="email">Enter Email:</label>
        <form:input path="email" id="email"/><br>

        <label for="password">Enter Password:</label>
        <form:input path="password" id="password"/><br>

        <input type="submit" value="Submit">
    </form:form>
    </div>
</body>
</html>