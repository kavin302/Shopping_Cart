<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.Shopping_Cart.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
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
            margin-top: 20px;
        }

        table {
            width: auto;
            margin: 0 auto;
            border-collapse: collapse;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        th, td {
            padding: 10px 20px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #e0e0e0;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>
       <%List<Product> p=(List<Product>)request.getAttribute("productobj"); %>
       <h1 ><a href="displayitemsfromcart"><button>View Cart</button></a></h1>
       <table cellpadding="20px" border="1px">
       <thead>
      
       <th>Brand</th>
       <th>Category</th>
       <th>Model</th>
       <th>Price</th>
       
       <th>AddToCart</th>
       </thead>
      
       <%for(Product product:p){ %>
        <tbody>
       <tr>
       
       <td><%=product.getBrand() %></td>
       <td><%=product.getCategory() %></td>
       <td><%=product.getModel() %></td>
       <td><%=product.getPrice() %></td>
       
       <td><a href="Addtocart?id=<%=product.getId()%>">add</a></td>
       </tr>
       </tbody>
       <%}%>
       
       </table>
</body>
</html>