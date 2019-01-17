<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <title>Create order</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">

    <div class="mx-auto p-3 my-5 text-center bg-light rounded-custom">
        <div class="rounded-custom mx-auto">
            <h3>${order.title}</h3>
            <div class="row">
                <div class="text-left col px-5">
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <div>
                                <i class="far fa-calendar-alt"></i>
                                dodano <fmt:formatDate dateStyle="medium" timeStyle="short" type="both"
                                                       value="${order.created}"/>
                            </div>
                        </li>
                        <li class="list-inline-item">
                            <div>
                                <i class="far fa-bell"></i>
                                <c:choose>
                                    <c:when test="${order.hoursTillEnd == 1}"><span
                                            class="red"> do końca 1 godzina</span></c:when>
                                    <c:when test="${order.hoursTillEnd > 1 && order.hoursTillEnd <= 24 }"><span
                                            class="red"> do końca ${order.hoursTillEnd} godziny</span></c:when>
                                    <c:when test="${order.hoursTillEnd > 24}"><span>koniec <fmt:formatDate
                                            dateStyle="medium"
                                            timeStyle="short" type="both"
                                            value="${order.end}"/></span></c:when>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

                <div class="container">
                    <div class="row">
                    <div class="details-bg text-left col-8 p">
                        <div>
                            Kategorie:
                            <c:forEach items="${order.categories}" var="category">
                                ${category.name} </c:forEach>
                        </div>
                        <div>
                            Technologie:
                            <c:forEach items="${order.programmingLanguages}" var="language">
                                ${language.name} </c:forEach>

                        </div>
                    </div>
                    <div class="col-4 rounded-custom bg-light border text-nowrap">
                        <div class="text-center">
                            <h4>Dane kontaktowe:</h4>
                        </div>
                        <div class="text-left">
                            <p>Imię : ${order.employer.firstName}</p>
                            <p>Nazwisko : ${order.employer.lastName}</p>
                            <p>Nr telefonu : ${order.employer.phoneNumber}</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="text-justify w-75 mx-auto rounded-custom bg-light p-3">
            <span>${order.content}</span>
        </div>
        <div class="col-2 m-4 mx-auto">
            <a class="btn btn-lg btn-primary"
               href="/order/show/${order.id}">
                Złóż ofertę
            </a>
        </div>
    </div>

</div>
</body>
</html>
