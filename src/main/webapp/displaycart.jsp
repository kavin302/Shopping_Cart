<%@page import="com.jsp.Shopping_Cart.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.Shopping_Cart.dto.Cart"%>
<%@page import="com.jsp.Shopping_Cart.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 50px auto;
            border-collapse: collapse;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        .total-price {
            text-align: right;
            padding-top: 10px;
            padding-right: 20px;
        }
    </style>
</head>
<body>
         <% List<Item> items=(List<Item>)request.getAttribute("itemlist");
         %>
         
         <table cellpadding="20px" border="1px" align="center">
         <thead>
               <th>Brand</th>
               <th>Category</th>
               <th>Model</th>
               <th>Quantity</th>
               <th>Price</th>
         </thead>
         <%for(Item i:items) { %>
         <tbody>
             <tr>
             <td><%=i.getBrand() %></td>
             <td><%=i.getCategory() %></td>
             <td><%=i.getModel() %></td>
             <td><%=i.getQuantity() %></td>
             <td><%=i.getPrice() %></td>
             </tr>
         <%} %>
          
        <tr class="total-price">
            <td colspan="4">Total Price:</td>
            <td><%= (double) request.getAttribute("totalprice") %></td>
        </tr>
         <tr>
            <td colspan="5"><a href="addOrder"><button>Buy Now</button></a></td>
        </tr>
         </tbody>
         
         </table>
</body>
</html>