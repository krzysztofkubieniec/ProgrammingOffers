<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create order</title>
</head>
<body>
<form:form modelAttribute="order" method="post">
Nazwa:<br>
<form:input path="title"/><br>
<form:errors path="title"/><br>

Tekst: <br>
<form:textarea rows="30" cols="80" path="text"/><br>
<form:errors path="text"/><br>

Data zakończenia: <br>
<form:input type="date" path="end"/><br>
<form:errors path="end"/><br>

Kategorie : <br> <form:select path="categories" items="${categories}" itemLabel="name" itemValue="id"></form:select><br>
    <input type="submit" value="Wyślij"/>
</form:form>
</body>
</html>
