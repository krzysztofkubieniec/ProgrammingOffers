<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container body-wrapper">
    <div class="row">
        <div class="mx-auto p-5 my-5 bg-light text-center">
            <h2 class="mb-5">Logowanie</h2>
            <form method="post">
                <div class="form-group">
                    <input class="form-control" id="login" name="login" type="text" placeholder="podaj login">
                </div>
                <div class="form-group">
                    <input class="form-control" id="password" name="password" type="password" placeholder="podaj hasło">
                </div>
                <div class="row">
                    <div class="mx-auto">
                        <input class="btn btn-primary" type="submit" value="Zaloguj">
                    </div>
                </div>
                <div class="form-group">
                    ${error}
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
