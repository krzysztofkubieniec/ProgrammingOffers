<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <%--<div class="row mx-5 mt-5">--%>
    <%--<div class="d-flex flex-column col-6">--%>
    <%--<a class="btn btn-success btn-lg btn-block"--%>
    <%--href="#">--%>
    <%--Szukaj zleceń--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--<div class="d-flex flex-column col-6">--%>
    <%--<a class="btn btn-success btn-lg btn-block"--%>
    <%--href="#">--%>
    <%--Szukaj wykonawców--%>
    <%--</a>--%>
    <%--</div>--%>

    <%--</div>--%>

    <div>
        <header id="o-list-header" class="container text-center">
            <h2 class="h1">Aktualne zlecenia</h2>
        </header>
    </div>
    <div class="container-fluid my-3">
        <div class="row">
            <div class="col-3 filter">
                <ul class="list-group o-list-container container">
                    <li class="list-group-item text-center">
                        <h4>Filtr</h4>
                    </li>
                    <form class="action filter" method="POST">
                        <li class="list-group-item">
                            <h5 class="text-center">Kategorie:</h5>
                            <ul class="list-group borderless">
                                <div class="mx-4">
                                    <c:forEach items="${categories}" var="category" varStatus="status">

                                        <li class="page-item py-0 options">
                                            <input id="cat${status.index}" type="radio" class="form-check-input"
                                                   name="categories"
                                                   value="${category.id}"/>
                                            <label for="cat${status.index}" class="page-link">
                                                    ${category.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <h5 class="text-center">Technologie:</h5>
                            <ul class="list-group borderless">
                                <div class="mx-4">
                                    <c:forEach items="${technologies}" var="technology" varStatus="status">
                                        <li class="page-item py-0 options">
                                            <input id="tech${status.index}" class="form-check-input" type="radio"
                                                   name="technologies"
                                                   value="${technology.id}">
                                            <label for="tech${status.index}" class="page-link">
                                                    ${technology.name}
                                            </label>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>
                        </li>
                        <li class="list-group-item text-center">
                            <input id="clear" class="btn btn-primary" type="button" value="Wyczyść filtr"/>
                        </li>
                        <li class="list-group-item">
                            <ul class="list-group borderless">
                                <div class="mx-4">
                                    <li class="page-item py-0 options">
                                        <input class="form-control search" type="textfield" name="search" placeholder="Szukaj w tytule">
                                    </li>
                                </div>
                            </ul>
                        </li>
                    </form>
                </ul>
            </div>
            <div class="col-9 orders">
                <ul class="list-group">
                    <c:forEach var="order" items="${orders}">
                        <li class="list-group-item m-1 rounded-custom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-10">
                                        <h3><a href="/order/show/${order.id}"
                                               class="btn title text-left">${order.title}</a></h3>
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <div><i class="far fa-calendar-alt"></i> dodano <span
                                                        id="created"> <fmt:formatDate
                                                        dateStyle="medium"
                                                        timeStyle="short" type="both"
                                                        value="${order.created}"/></span></div>
                                            </li>
                                            <li class="list-inline-item">
                                                <div id="end"><i class="far fa-bell"></i>
                                                    <c:choose>
                                                        <c:when test="${order.hoursTillEnd <= 1}"><span
                                                                class="red"> do końca mniej niż godzina</span></c:when>
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
                                        <c:if test="${not empty order.updated}">
                                            <div class="details">
                                                <p>Zaktualizowano: <fmt:formatDate
                                                        dateStyle="medium"
                                                        timeStyle="short" type="both"
                                                        value="${order.updated}"/></p>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-2">
                                        <a class="btn btn-primary"
                                           href="/order/show/${order.id}">
                                            Złóż ofertę
                                        </a>
                                    </div>
                                    <div class="col">
                                        <div class="content text-justify">${order.shortenContent}
                                            <a href="/order/show/${order.id}" class="btn btn-link rfp-show-details">Pokaż
                                                więcej <i
                                                        class="fa fa-angle-right"></i></a>
                                        </div>
                                        <div class="details">
                                            <div id="categories">
                                                Kategorie:
                                                <c:forEach items="${order.categories}" var="category">
                                                    ${category.name} </c:forEach>
                                            </div>
                                            <div id="technologies">
                                                Technologie:
                                                <c:forEach items="${order.technologies}" var="technology">
                                                    ${technology.name} </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <nav aria-label="...">
                    <div class="text-center">
                        <form class="action pageination" method="POST">
                            <ul class="pagination justify-content-center">
                                <li class="page-item active">
                                    <input id="c0" type="radio" class="page-link" name="page" value="0" checked/>
                                    <label for="c0" class="page-link form-control">1</label>
                                    <span class="sr-only">(current)</span></li>
                                <c:forEach var="i" begin="1" end="${lastPageNo-1}">
                                    <li class="page-item">
                                        <input id="c${i}" type="radio" class="page-link" name="page" value="${i}"/>
                                        <label for="c${i}" class="page-link form-control">${i+1}</label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </form>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<script src="<c:url value="/resources/js/app.js"/>"></script>

</body>
</html>
