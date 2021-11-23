<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Yahoo!</title>
</head>
<body>
<form action="/login" method="post"/>
<p><font color="red">${errorMessage}</font></p>
Enter your name <input type="text" name="name"/>
Password <input type="password" name="password"/>
<input type="submit" value="Login">
</body>
</html>
