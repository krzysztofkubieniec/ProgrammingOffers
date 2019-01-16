<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <title>Create order</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<form:form modelAttribute="order" method="post">
    Nazwa:<br>
    <form:input path="title"/><br>
    <form:errors path="title"/><br>

    Tekst: <br>
    <form:textarea rows="30" cols="80" path="content"/><br>
    <form:errors path="content"/><br>

    Data zakończenia: <br>
    <form:input type="date" path="end"/><br>
    <form:errors path="end"/><br>

    Kategorie : <br> <form:select path="categories" items="${categories}" itemLabel="name" itemValue="id"></form:select><br>

    Technologie : <br> <form:select path="programmingLanguages" items="${programmingLanguages}" itemLabel="name" itemValue="id"></form:select><br>
    <input type="submit" value="Wyślij"/>
</form:form>
</body>
</html>
