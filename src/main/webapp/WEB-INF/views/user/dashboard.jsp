<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	      integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="mt-5">
</div>
<div class="container">
	<div class="row">
		<div class="col-6 orders">
			<header class="text-center">
				<h2 class="h1">Aktywne zlecenia</h2>
			</header>
			<ul class="list-group">
				<c:forEach var="order" items="${activeOrders}">
					<li class="list-group-item m-1 rounded-custom">
						<div class="container">
							<div class="row">
								<div class="col-10 pt-2">
									<h3><span><a href="/order/show/${order.id}"
									             class="title pull-left">${order.title}</a></span></h3>
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
									<a class="btn btn-warning btn-sm"
									   href="/order/logged/edit/${order.id}">
										Edytuj
									</a>
									<a class="btn btn-danger btn-sm mt-2"
									   href="/order/logged/end/${order.id}">
										Zakończ
									</a>
								</div>
								<div class="col">
									<div class="content text-justify">
											${order.shortenContent}
										<a href="/order/show/${order.id}" class="btn btn-link rfp-show-details">Pokaż
											więcej <i
													class="fa fa-angle-right"></i></a>
									</div>
									<div class="details">
										<div>
											Kategorie:
											<c:forEach items="${order.categories}" var="category">
												${category.name} </c:forEach>
										</div>
										<div>
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
		</div>
		<div class="col-6 orders">
			<header class="text-center">
				<h2 class="h1">Nieaktywne zlecenia</h2>
			</header>
			<ul class="list-group">
				<c:forEach var="order" items="${nonActiveOrders}">
					<li class="list-group-item m-1 rounded-custom">
						<div class="container">
							<div class="row">
								<div class="col-10 pt-2">
									<h3><span><a href="/order/show/${order.id}"
									             class="title pull-left">${order.title}</a></span></h3>
									<ul class="list-inline">
										<li class="list-inline-item">
											<div><i class="far fa-calendar-alt"></i> dodano <fmt:formatDate
													dateStyle="medium"
													timeStyle="short" type="both"
													value="${order.created}"/></div>
										</li>
										<li class="list-inline-item">
											<div><i class="far fa-bell"></i>
												<span>zakończono <fmt:formatDate
														dateStyle="medium"
														timeStyle="short" type="both"
														value="${order.end}"/></span>

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
									<%--<a class="btn btn-success btn-sm"--%>
									   <%--href="#">--%>
										<%--Wystaw ponownie--%>
									<%--</a>--%>
								</div>
								<div class="col">
									<div class="content text-justify">
											${order.shortenContent}
										<a href="/order/show/${order.id}" class="btn btn-link rfp-show-details">Pokaż
											więcej <i
													class="fa fa-angle-right"></i></a>
									</div>
									<div class="details">
										<div>
											Kategorie:
											<c:forEach items="${order.categories}" var="category">
												${category.name} </c:forEach>
										</div>
										<div>
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
		</div>
	</div>
</div>
</div>
</body>
</html>
