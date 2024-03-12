<%@page import="com.jsp.Shopping_Cart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.Shopping_Cart.dto.Merchant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px 20px;
            border: 1px solid #ccc;
            text-align: left;
        }
        
        th {
            background-color: #f2f2f2;
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
    </style>
</head>
<body>
          <% Merchant m=(Merchant)session.getAttribute("merchantinfo");
             List<Product> products=m.getProduct();
          %>
          <table cellpadding="20px" border="1px">
          <thead>
          <th>Id</th>
          <th>Brand</th>
          <th>Model</th>
          <th>Category</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Update</th>
          <th>Delete</th>
          </thead>
          <%
          for(Product p:products){
          
          %>
          <tbody>
          <tr>
          <td><%= p.getId() %></td>
          <td><%= p.getBrand() %></td>
          <td><%= p.getModel()%></td>
          <td><%= p.getCategory() %></td>
          <td><%= p.getPrice() %></td>
          <td><%= p.getStock() %></td>
          <td><a href="updateproduct?id=<%= p.getId()%>">update</a></td>
          <td><a href="deleteproduct?id=<%= p.getId()%>">delete</a></td>
          </tr>
          <%} %>
          
          </tbody>
          
          </table>
</body>
</html>