<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
	<link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
	      rel="stylesheet">
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
	<title>Programming offers</title>
</head>
<body>
<header class="page-header">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<a class="navbar-brand main-logo" href="/">Programming<span> Offers</span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
		        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbarCollapse" style>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="/order/logged/create-order">Dodaj zlecenie</a>
				</li>
				<c:if test="${not empty login}">
					<li class="nav-item active">
						<a class="red nav-link" href="/user/logged/dashboard">Moje zlecenia</a>
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
	</nav>
</header>
</body>
</html>
