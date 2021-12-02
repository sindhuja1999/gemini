<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="images" value="/resources/images"/>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sowmya Pinni">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>
<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"
	rel="stylesheet">

<!-- Add custom CSS here -->
<link href="${css}/shop-homepage.css" rel="stylesheet">


<!-- Site Icons -->
<link rel="shortcut icon" href="${images}/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="${images}/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="${css}/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${css}/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${css}/owl.carousel.min.css">

<link rel="stylesheet" href="${css}/superslides.css">

<link rel="stylesheet" href="${css}/all.css">
</head>
<body>

	<%@ include file="./shared/navbar.jsp" %>

	<c:if test="${userClickHome==true}">
		<%@ include file="home.jsp"%>
	</c:if>

	<c:if test="${userClickAbout==true}">
		<%@ include file="about.jsp"%>
	</c:if>

	<c:if test="${userClickContact==true}">
		<%@ include file="contact.jsp"%>
	</c:if>

	<c:if
		test="${userClickAllProducts==true || userClickCategoryProducts==true}">
		<%@ include file="viewproducts.jsp"%>
	</c:if>

	<c:if test="${userClickSingleProduct==true}">
		<%@ include file="singleproduct.jsp"%>
	</c:if>

	<c:if test="${userClickManageProduct==true}">
		<%@ include file="manageproducts.jsp"%>
	</c:if>
	
	<c:if test="${userClickShowCart==true}">
		<%@ include file="cart.jsp"%>
	</c:if>
	
	<c:if test="${userClickcheckout==true}">
		<%@ include file="checkout.jsp"%>
	</c:if>

	<!-- common footer url -->
	<%@ include file="./shared/footer.jsp"%>
	
	<!-- JavaScript -->
	
	<script src="${js}/jquery-1.10.2.js"></script>
	<script src="${js}/bootstrap.js"></script>
	<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script src="${js}/bootbox.min.js"></script>
	<script src="${js}/myown.js"></script>
</body>

</html>
