<%@page import="com.jsp.Shopping_Cart.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Update Product</title>
    <style>
    /* Style for form container */
    .form-container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Style for form inputs */
    .form-container input[type="number"],
    .form-container input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    /* Style for submit button */
    .form-container input[type="submit"] {
        width: 100%;
        background-color: #4caf50;
        color: white;
        padding: 10px 0;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    /* Hover effect for submit button */
    .form-container input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
       <%Product p=(Product)request.getAttribute("productob"); %>
       
       <div class="form-container">
       <form action="UpdateProduct">
       enter id: <input type="number" value="<%=p.getId()%>" name="id" readonly="readonly"><br>
       enter brand: <input type="text" value="<%=p.getBrand()%>" name="brand"><br>
       enter category: <input type="text" value="<%=p.getCategory()%>" name="category"><br>
       enter model: <input type="text" value="<%=p.getModel()%>" name="model"><br>
       enter price: <input type="number" value="<%=p.getPrice()%>" name="price"><br>
       enter stock: <input type="number" value="<%=p.getStock()%>" name="stock"><br>
       <input type="submit">
       </form>
       </div>
     
</body>
</html>