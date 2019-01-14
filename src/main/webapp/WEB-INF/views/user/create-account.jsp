<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<form:form modelAttribute="user" method="post">
    login:<br>
    <form:input path="login"/><br>
    <form:errors path="login"/><br>

    email:<br>
    <form:input path="email"/><br>
    <form:errors path="email"/><br>

    hasło:<br>
    <form:password path="password"/><br>
    <form:errors path="password"/><br>
    <input type="submit" value="Wyślij"/>
</form:form>
</body>
</html>
