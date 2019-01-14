<%--
  Created by IntelliJ IDEA.
  User: krzysztofkubieniec
  Date: 14.01.19
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="post">
    <input name="login" type="text" placeholder="podaj login"><br>
    <input name="password" type="password" placeholder="podaj hasło"><br>
    ${error}
    <input type="submit" value="Wyślij"><br>
</form>
</body>
</html>
