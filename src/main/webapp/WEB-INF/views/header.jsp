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
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand " href="/">Strona główna<span class="sr-only">(current)</span></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <c:if test="${not empty login}">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Witaj ${login}!<span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/logout">Wyloguj<span class="sr-only">(current)</span></a>
                    </li>
                </c:if>
                <c:if test="${empty login}">
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/create-account">Zarejestruj się<span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/user/login">Zaloguj się<span class="sr-only">(current)</span></a>
                    </li>

                </c:if>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
