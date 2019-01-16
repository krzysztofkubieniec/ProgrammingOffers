<%--
  Created by IntelliJ IDEA.
  User: krzysztofkubieniec
  Date: 14.01.19
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <title>Login</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <div class="row">
        <div class="mx-auto p-5 my-5 bg-light">
            <form method="post">
                <div class="form-group">
                    <label for="login">Login:</label>
                    <input class="form-control" id="login" name="login" type="text" placeholder="podaj login">
                </div>
                <div class="form-group">
                    <label for="password">Hasło:</label>
                    <input class="form-control" id="password" name="password" type="password" placeholder="podaj hasło">
                </div>
                <div class="row">
                    <div class="mx-auto">
                        <input class="btn btn-primary" type="submit" value="Wyślij">
                    </div>
                </div>
                <div class="form-group">
                    ${error}
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
