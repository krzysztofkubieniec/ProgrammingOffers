<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: krzysztofkubieniec
  Date: 16.01.19
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand " href="/">Strona główna<span class="sr-only">(current)</span></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/order/create-order">Dodaj zlecenie</a>
                </li>
                <c:if test="${not empty login}">
                    <li class="nav-item active">
                        <a class="red nav-link" href="#">Witaj ${login}!</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/logout">Wyloguj</a>
                    </li>
                </c:if>
                <c:if test="${empty login}">
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/create-account">Zarejestruj się</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/login">Zaloguj się</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
