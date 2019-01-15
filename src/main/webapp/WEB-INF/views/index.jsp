<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>

    <link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet" type="text/css"/>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty login}">
    Zalogowany użytkownik: ${login}
</c:if><br>

<a href="/user/create-account">Zarejestruj użytkownika</a><br>
<a href="/user/login">Zaloguj się</a><br><br>
<a href="/order/create-order">Dodaj zlecenie : TYLKO DLA ZALOGOWANYCH</a><br>

<c:forEach var="order" items="${orders}">
    <div class="fluid-container">
        <div class="col-md-10 col-lg-9 center-block orders">
            <ul class="list-group o-list-with-meta">
                <li class="list-group-item">
                    <div class="row">
                        <div class="o-cl-i-contents col-xs-12 f">
                            <div class="o-cl-i-c-header">
                                <h3><span><a href="#" class="title pull-left">${order.title}</a></span></h3>
                                <ul class="list-inline">
                                    <li class="list-inline-item">dodano <fmt:formatDate dateStyle="medium"
                                                                                        timeStyle="short" type="both"
                                                                                        value="${order.created}"/></li>

                                    <li class="list-inline-item red"><span class="red"> do końca ${order.end}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="o-cl-i-c-meta-date">
                            <a class="btn btn-lg btn-primary btn-main-action btn-uncover-from-list"
                               href="/rfp/2264207_Potrzebna-firma-remontowa-21-40m2-Lodz.html?rfpUncover=uncover">
                                Złóż ofertę
                            </a>
                        </div>
                        <div class="o-cl-i-c-description row col-md-11">
                            <div class="description-author">
                                <p data-overflow="false">
                                        ${order.content}
                                        <%--<button class="btn btn-link rfp-show-details">Pokaż więcej <i class="fa fa-angle-right"></i></button>--%>
                                </p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</c:forEach>

</body>
</html>
