<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <title>Programming offers</title>
</head>
<body>
<header class="page-header">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand main-logo py-1" href="/">Programming<span> Offers</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="navbarCollapse" style>
                <ul class="navbar-nav ml-auto py-0 my-0">
                    <li class="nav-item active  text-center">
                        <a class="nav-link" href="/order/logged/create-order">
                            <i class="far fa-file fa-lg"></i>
                            <p class="py-0 my-0">Dodaj zlecenie</p>
                        </a>
                    </li>
                    <c:if test="${not empty login}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="/user/logged/dashboard">
                                <i class="fas fa-user-circle fa-lg"></i>
                                <p class="py-0 my-0">Konto</p>
                            </a>
                        </li>
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="/user/logout">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>Wyloguj się</p>
                            </a>

                        </li>
                    </c:if>
                    <c:if test="${empty login}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="/user/create-account">
                                <i class="far fa-registered fa-lg"></i>
                                <p>Zarejestruj się</p>
                            </a>
                        </li>
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="/user/login">
                                <i class="far fa-user-circle fa-lg"></i>
                                <p>Zaloguj się</p>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

</header>

</body>
</html>
