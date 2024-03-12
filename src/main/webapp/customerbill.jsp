<%@page import="com.jsp.Shopping_Cart.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.Shopping_Cart.dto.Orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Order Details</title>
    <style>
        /* Internal CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        table {
            width: 50%;
            margin: 50px auto;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        a.button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        
        a.button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
         <h1>${message}</h1>
         <%Orders o=(Orders)request.getAttribute("orderdetails");
           List<Item> i=o.getItem();
           
           
         %>
         
         <table>
         <thead>
         <th>Name</th>
         <th>Address</th>
         <th>TotalPrice</th>
         
         
         </thead>
         <tbody>
         <tr>
         <td><%= o.getName() %></td>
         <td><%=o.getAddress() %></td>
         <td><%= o.getTotalPrice() %></td>
         </tr>
         
         <tr> <td colspan="3"><a class="button" href="customeroptions.jsp">Back to Options</a></td></tr>
         </tbody>
         
         </table>
</body>
</html>