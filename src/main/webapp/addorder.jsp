<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Order Form</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        .order-form {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .order-form label {
            display: block;
            margin-bottom: 5px;
        }
        
        .order-form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .order-form input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .order-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
         
         <div class="order-form">
    <form:form action="placeorder" modelAttribute="orderobj">
        <label for="name">Enter Name:</label>
        <form:input path="name" id="name"/><br>

        <label for="address">Enter Address:</label>
        <form:input path="address" id="address"/><br>

        <label for="mobileNumber">Enter Mobile Number:</label>
        <form:input path="mobileNumber" id="mobileNumber"/><br>

        <input type="submit" value="Submit">
    </form:form>
</div>
        
         
</body>
</html>