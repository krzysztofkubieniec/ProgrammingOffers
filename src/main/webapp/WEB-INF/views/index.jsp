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
	<div class="row mx-5 mt-5">
		<div class="d-flex flex-column col-6">
			<a class="btn btn-success btn-lg btn-block"
			   href="#">
				Szukaj zleceń
			</a>
		</div>
		<div class="d-flex flex-column col-6">
			<a class="btn btn-success btn-lg btn-block"
			   href="#">
				Szukaj wykonawców
			</a>
		</div>

	</div>

	<div class="mt-5">
		<header id="o-list-header" class="container text-center">
			<h2 class="h1">Aktualne zlecenia</h2>
		</header>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 filter">
				<ul class="list-group o-list-container container">
					<li class="list-group-item text-center">
						<h5>Filtr</h5>
					</li>
						<form method="POST">
							<li class="list-group-item">
								<h6>Kategorie:</h6>
								<c:forEach items="${categories}" var="category" varStatus="status">
									<div class="form-group ml-1">
										<input id="category${status.index}" type="checkbox" class="form-check-input" name="categories"
										       value="${category.id}"/>
										<label class="form-check-label">
												${category.name}
										</label>
									</div>
								</c:forEach>
							</li>
							<li class="list-group-item">
								<h6>Technologie:</h6>
								<c:forEach items="${technologies}" var="technology" varStatus="status">
									<div class="form-group ml-1">
										<input id="technology${status.index}" class="form-check-input" type="checkbox" name="technologies"
										       value="${technology.id}"
										       <c:if test="fn:contains(selectedTechnologies, technology)">checked="checked"</c:if>>
										<label class="form-check-label">
												${technology.name}
										</label>
									</div>
								</c:forEach>
							</li>
							<li class="list-group-item text-center">
								<input id="filter" class="btn btn-primary" type="submit" value="Filtruj"/>
							</li>
							<li class="list-group-item text-center">
								<input id="clear" class="btn btn-primary" type="button" value="Wyczyść"/>
							</li>
						</form>

				</ul>
			</div>
			<div class="col-10 orders">
				<ul class="list-group">
					<c:forEach var="order" items="${orders}">
						<li class="list-group-item m-1 rounded-custom">
							<div class="container">
								<div class="row">
									<div class="col-10">
										<h3><span><a href="/order/show/${order.id}"
										             class="title">${order.title}</a></span></h3>
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
										<a class="btn btn-primary"
										   href="/order/show/${order.id}">
											Złóż ofertę
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
		</div>
	</div>
	${ordersCount}
</div>
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
</body>
</html>
