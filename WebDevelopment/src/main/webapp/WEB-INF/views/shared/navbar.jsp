<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<script>
window.userRole='${userModel.role}';
</script>
<nav  style="background-color:light grey" class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<img src="${images}/logo.png"/>
			
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li id="home"><a style="color:black" href="${contextRoot}/home">Home</a>
				<li id="aboutus"><a style="color:black" href="${contextRoot}/about">About Us</a></li>
				<li id="viewProducts"><a style="color:black"
					href="${contextRoot}/show/all/products">View Products</a></li>
				<li id="contactus"><a style="color:black" href="${contextRoot}/contact">Contact
						Us</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
				<li id="manageproducts"><a style="color:black" 
					href="${contextRoot}/manage/products">Manage Products</a></li>
					</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">

					<li id="signup"><a style="color:black"  href="${contextRoot}/membership">Sign
							Up</a></li>
					<li id="login"><a style="color:black"  href="${contextRoot}/login">login</a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">
					<li class="dropdown"><a
						class="btn btn-default dropdown-toggle" href="javascript:void(0)"
						id="dropdownMenu1" data-toggle="dropdown">
							${userModel.fullName} <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" aria-labelledby=dropdownMenu1>

							<security:authorize access="hasAuthority('USER')">
								<li id="cart"><a href="${contextRoot}/cart/show"> <span
										class="glyphicon glyphicon-shopping-cart"></span>&#160; <span
										class="badge">${userModel.cart.cartLines}</span>-&#8377;${userModel.cart.grandTotal}
								</a></li>
								<li role="separator" class="divider"></li>
							</security:authorize>

							<li id="logout">
							<a href="${contextRoot}/logout">Logout</a></li>
						</ul></li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>