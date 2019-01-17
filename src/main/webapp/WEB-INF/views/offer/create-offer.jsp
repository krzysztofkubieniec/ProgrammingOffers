<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<form:form modelAttribute="offer" method="post" action="/offer/add/${order.id}">
    <div class="form-group">
        <div class="row col-4">
        <label>Kwota (nie wymagane):</label>
        <form:input cssClass="col-4" path="price"/>
        <form:errors path="price"/>
        </div>
        <label>Wiadomość:</label>
        <form:textarea cssClass="form-control" rows="15" cols="80" path="message"/>
        <form:errors path="message"/>
        <input type="submit" class="btn btn-success" value="Potwierdź"/>
    </div>
</form:form>
</body>
</html>
