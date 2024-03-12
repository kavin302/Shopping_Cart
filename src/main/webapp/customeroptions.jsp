<%@page import="com.jsp.Shopping_Cart.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="U	TF-8">
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
            color: blue;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        h1 a {
            color: inherit;
            text-decoration: none;
        }

        h1 a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
             <h1>${message}</h1>
             <%Customer c=(Customer)session.getAttribute("customerinfo"); 
             if(c!=null){%>
             
                  <h1><a href="Displayallproduct">Display All Products</a></h1>
                  <h1><a href="displayproductbybrand.jsp">Display Product By Brand</a></h1>
                  <h1><a href="displayproductbycategory.jsp">Display Product By Category</a></h1>
                  <h1><a href="displayproductbypricerange.jsp">Display Product By Range</a></h1>
                  <%}
             else{  %>
             <h1><a href="customerloginform.jsp">Please Login</a></h1>
             <%} %>
</body>
</html>