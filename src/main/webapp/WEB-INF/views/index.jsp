<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet" type="text/css"/>
    <title>Title</title>
</head>
<body>
<%@ include file="header.jsp" %>

<a href="/order/create-order">Dodaj zlecenie : TYLKO DLA ZALOGOWANYCH</a><br>


<div class="row">
        <div class="col">
            <h5>Wybierz kategorie</h5>
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
            <label class="form-check-label" for="defaultCheck1">
                Test
            </label>
        </div>
        <div class="col">
            <h5>Wybierz technologie</h5>
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
            <label class="form-check-label" for="defaultCheck2">
                Java
            </label>
        </div>

</div>
<div class="mt-5">
    <header id="o-list-header" class="container text-center">
        <h2 class="h1">Aktualne zlecenia</h2>
    </header>
</div>
<div class="col-md-10 mx-auto orders">
    <ul class="list-group o-list-container container">
        <c:forEach var="order" items="${orders}">
            <li class="list-group-item">
                <div class="row">
                    <div class="o-cl-i-contents col-10">
                        <div class="o-cl-i-c-header">
                            <h3><span><a href="#" class="title pull-left">${order.title}</a></span></h3>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <div><i class="far fa-calendar-alt"></i> dodano <fmt:formatDate
                                            dateStyle="medium"
                                            timeStyle="short" type="both"
                                            value="${order.created}"/></div>
                                </li>
                                <li class="list-inline-item">
                                    <div><i class="far fa-bell"></i>
                                        <c:choose>
                                        <c:when test="${order.hoursTillEnd == 1}"><span
                                                class="red"> do końca 1 godzina</c:when>
                                            <c:when test="${order.hoursTillEnd > 1 && order.hoursTillEnd <= 24 }"><span
                                                    class="red"> do końca ${order.hoursTillEnd} godziny</c:when>
                                                <c:when test="${order.hoursTillEnd > 24}"><span>koniec <fmt:formatDate
                                                        dateStyle="medium"
                                                        timeStyle="short" type="both"
                                                        value="${order.end}"/></c:when>
                                                    </c:choose></span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="o-cl-i-c-meta-date col-2">
                        <a class="btn btn-lg btn-primary btn-main-action btn-uncover-from-list"
                           href="#">
                            Złóż ofertę
                        </a>
                    </div>
                    <div class="o-cl-i-c-description col-md-11">
                        <div class="content">
                                ${order.shortenContent}
                            <a href="#" class="btn btn-link rfp-show-details">Pokaż więcej <i
                                    class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>

</body>
</html>
