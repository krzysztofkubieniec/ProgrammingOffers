<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	      integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
	<div class="mx-auto p-3 mt-5 text-center bg-light rounded-custom">
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
							<c:forEach items="${order.technologies}" var="technology">
								${technology.name} </c:forEach>

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
	</div>

	<c:forEach items="${offers}" var="offer">
		<div class="container w-50 mx-auto m-1 text-center bg-light rounded-custom">
			<div class="row">
				<div class="col-2 w-50 mx-auto m-1 text-center bg-light rounded-custom">
					<i class="fas fa-user fa-2x"></i>
						${offer.contractor.firstName} ${offer.contractor.lastName}
				</div>
				<div class="col-10 w-50 mx-auto m-1 text-center bg-light rounded-custom">
						${offer.message}
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="container">
		<div class="row">
			<div class="mx-auto m-4 pb-3">
				<button class="btn btn-primary offer-slider">Złóż oferte</button>
			</div>
		</div>
	</div>
	<form:form modelAttribute="offer" method="post" action="/logged/offer/add/${order.id}">
	<form:errors path="price"/><br>
	<form:errors path="message"/><br>

	<div id="offer-create" class="container">
		<div class="mx-auto p-3 text-center bg-light rounded-custom">
			<div class="container">
				<div class="row">
					<div class="mx-auto">
						<h2>Oferta</h2>
					</div>
				</div>
			</div>
				<div class="form-group">
					<div class="row col-4">
						<label>Kwota (nie wymagane):</label>
						<form:input cssClass="col-4" path="price"/>
					</div>
					<label>Wiadomość:</label>
					<form:textarea cssClass="form-control" rows="8" cols="50" path="message"/>
				</div>
				<input type="submit" class="btn btn-success" value="Potwierdź"/>

		</div>
	</div>
	</form:form>
</div>
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>
