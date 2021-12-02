<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>${title}</title>
<script>
	
	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"
	rel="stylesheet">

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
<link rel="stylesheet" href="${css}/custom.css">
</head>
<body>
	<div class="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"><h2><a style="font-family: Georgia, serif, ;margin-left:200px;color:white; margin-top:30px" "class="navbar-brand" href="${flowExecutionUrl}&_eventId_home"><strong>Home</strong></a>
			</h2></nav>
		<div class="container">
			<div class="navbar-header">
				
			</div>
		</div>
	</div>