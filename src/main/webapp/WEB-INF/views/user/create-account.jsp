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
<div class="container">
    <div class="row">
        <div class="mx-auto p-5 my-5 bg-light">
            <form:form modelAttribute="user" method="post">
            <div class="row">
                <div class="col">
                    <label>Login:</label>
                    <form:input cssClass="form-control" path="login"/>
                    <form:errors path="login"/><br>
                </div>
                <div class="col">
                    <label>Email:</label>
                    <form:input cssClass="form-control" path="email"/>
                    <form:errors path="email"/><br>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label>Imię:</label>
                    <form:input cssClass="form-control" path="firstName"/>
                    <form:errors path="firstName"/><br>
                </div>
                <div class="col">
                    <label>Nazwisko:</label>
                    <form:input cssClass="form-control" path="lastName"/>
                    <form:errors path="lastName"/><br>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label>Nr telefonu:</label>
                    <form:input cssClass="form-control" path="phoneNumber"/>
                    <form:errors path="phoneNumber"/><br>
                </div>
                <div class="col">
                    <label>Hasło:</label>
                    <form:password cssClass="form-control" path="password"/>
                    <form:errors path="password"/><br>
                </div>
            </div>
            <div class="row">
                <div class="mx-auto">
                    <input type="submit" class="btn btn-primary" value="Wyślij"/>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>
</body>
</html>
