<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <title>Register</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="row">
    <div class="mx-auto mt-5">
        <form:form modelAttribute="user" method="post">
            <div class="form-group">
                <label>Login:</label>
                <form:input path="login"/><br>
                <form:errors path="login"/><br>
                <label>Email:</label>
                <form:input path="email"/><br>
                <form:errors path="email"/><br>
                <label>Hasło:</label>
                <form:password path="password"/><br>
                <form:errors path="password"/><br>
                <input type="submit" value="Wyślij"/>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>
