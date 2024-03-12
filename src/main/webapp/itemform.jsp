<%@page import="com.jsp.Shopping_Cart.dto.Product"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product to Cart</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        input[type="text"],
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
       <% Product p=(Product)request.getAttribute("product");%> 
       <div class="form-container">
       <form action="additemtocart">
         <input type="hidden" name="id" value="<%=p.getId()%>" readonly="readonly"><br>
        Brand: <input type="text" name="brand" value="<%=p.getBrand()%>" readonly="readonly"><br>
        Category: <input type="text" name="category" value="<%=p.getCategory()%>" readonly="readonly"><br>
        Model: <input type="text" name="model" value="<%=p.getModel()%>" readonly="readonly"><br>
        Price: <input type="number" name="price" value="<%=p.getPrice()%>" readonly="readonly"><br>
        Enter Quantity: <input type="number"  name="quantity"><br>
        <input type="submit" value="Add To Cart">
       
       </form>
         </div>
</body>
</html>