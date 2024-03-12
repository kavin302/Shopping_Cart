<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Form</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        .product-form {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .product-form label {
            display: block;
            margin-bottom: 5px;
        }
        
        .product-form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        .product-form input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .product-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="product-form">
       <form:form action="saveproduct" modelAttribute="productobj">
       
        <label for="brand">Enter Brand:</label>
        <form:input path="brand"/><br>
        
        <label for="model">Enter Model:</label>
        <form:input path="model" id="model"/><br>

        <label for="category">Enter Category:</label>
        <form:input path="category" id="category"/><br>

        <label for="price">Enter Price:</label>
        <form:input path="price" id="price"/><br>

        <label for="stock">Enter Stock:</label>
        <form:input path="stock" id="stock"/><br>

        <input type="submit" value="Submit">
       
       
       </form:form>
       </div>
</body>
</html>