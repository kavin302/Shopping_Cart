<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Merchant Login Form</title>
<style type="text/css">
/* Container styles */
.login-container {
  width: 300px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
}

/* Input styles */
.login-container input[type="email"],
.login-container input[type="password"] {
  width: 100%;
  padding: 10px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}

/* Button styles */
.login-container input[type="submit"] {
  width: 100%;
  background-color: #4caf50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.login-container input[type="submit"]:hover {
  background-color: #45a049;
}

/* Text styles */
.login-container h2 {
  text-align: center;
}


</style>
</head>
<body>
          <div class="login-container">
          <h2>Merchant Login</h2>
         <h1 style=color:red>${message}</h1>
       <form action="Loginvalidation" method="post">
       enter email: <input type="email" placeholder="Email" name="email" required="required"><br>
       enter password: <input type="password" placeholder="Password" name="password" required="required"><br>
       <input type="submit" value="Login">
       
       </form>
       
       </div>
</body>
</html>