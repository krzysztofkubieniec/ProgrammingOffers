<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container body-wrapper">
    <div class="row">
        <div class="mx-auto p-5 my-5 bg-light text-center">
            <h2 class="mb-5">Rejestracja</h2>
            <form:form modelAttribute="user" method="post">
            <div class="row">
                <div class="col">
                    <form:input cssClass="form-control" placeholder="podaj login" path="login"/>
                    <form:errors path="login"/><br>
                </div>
                <div class="col">
                    <form:input cssClass="form-control" placeholder="podaj email" path="email"/>
                    <form:errors path="email"/><br>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <form:input cssClass="form-control" placeholder="podaj imię" path="firstName"/>
                    <form:errors path="firstName"/><br>
                </div>
                <div class="col">
                    <form:input cssClass="form-control" placeholder="podaj nazwisko" path="lastName"/>
                    <form:errors path="lastName"/><br>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <form:input cssClass="form-control" placeholder="podaj nr telefonu" path="phoneNumber"/>
                    <form:errors path="phoneNumber"/><br>
                </div>
                <div class="col">
                    <form:password cssClass="form-control" placeholder="podaj hasło" path="password"/>
                    <form:errors path="password"/><br>
                </div>
            </div>
            <div class="row">
                <div class="mx-auto">
                    <input type="submit" class="btn btn-primary" value="Zarejestruj"/>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
