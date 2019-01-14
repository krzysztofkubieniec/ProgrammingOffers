<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty login}">
    Zalogowany użytkownik: ${login}
</c:if><br>

<a href="/user/create-account">Zarejestruj użytkownika</a><br>
<a href="/user/login">Zaloguj się</a><br><br>
<a href="/order/create-order">Dodaj zlecenie : TYLKO DLA ZALOGOWANYCH</a><br>

</body>
</html>
