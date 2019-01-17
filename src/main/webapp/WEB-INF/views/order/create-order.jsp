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
<div class="container">
    <div class="row">
        <div class="mx-auto p-5 my-5 bg-light">
            <form:form modelAttribute="order" method="post">
            <div class="form-group">
                <label>Tytuł:</label>
                <form:input cssClass="form-control" path="title"/>
                <form:errors path="title"/>

                <label>Tekst:</label>
                <form:textarea cssClass="form-control" rows="15" cols="80" path="content"/>
                <form:errors path="content"/>
            </div>
            <div class="form-group col-5">
                <label>Data zakończenia:</label>
                <form:input cssClass="form-control" type="datetime-local" path="end"/><br>
                <form:errors path="end"/><br>
            </div>
            <div class="form-row">
                <div class="form-group col-6">
                    <label>Podaj kategorie:</label>
                    <form:select cssClass="form-control" path="categories" items="${categories}" itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
                <div class="form-group col-6">
                    <label>Podaj technologie:</label>
                    <form:select cssClass="form-control" path="programmingLanguages" items="${programmingLanguages}"
                                 itemLabel="name"
                                 itemValue="id"></form:select>
                </div>
            </div>
            <div class="row">
                <div class="mx-auto">
                    <form:hidden path="employer.id"/>
                    <form:hidden path="created"/>
                    <form:hidden path="updated"/>
                    <input type="submit" class="btn btn-primary" value="Wyślij"/>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>
</div>
</body>
</html>
