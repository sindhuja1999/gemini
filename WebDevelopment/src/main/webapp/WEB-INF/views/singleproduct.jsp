<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div class="container mainmargin" style="margin-top: 50px">
	<!-- Breadcrum code -->
	<div class="row">
		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li><a href="${contextRoot}/home">Home</a>
				<li><a href="${contextRoot}/show/all/products">Products</a>
				<li><a href="active">${product.name} </a>
			</ol>

		</div>
	</div>
	<!-- Image Functionality -->
	<div class="row">
		<div class="col-xs-12 col-sm-4">
			<div class="thumbnail">
				<img src="${images}/${product.code}.jpeg" class="img img-responsive" />
			</div>

		</div>
		<div class="col-xs-12 col-sm-8">
			<h2>${product.name}</h2>
			<hr />
			<p>${product.description}</p>
			<hr />
			<h3>
				Price:<strong>&#8377;</strong>${product.unitPrice }</h3>
			<c:choose>
				<c:when test="${product.quantity <1}">
					<h6>
						Qty.Available:<span style="color: red">Out Of Stock</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Qty.Available:${product.quantity }</h6>
				</c:otherwise>
			</c:choose>
		<security:authorize access="isAnonymous() or hasAuthority('USER')">
			<c:choose>
				<c:when test="${product.quantity <1}">
					<h6>
						<a href="${contextRoot}/cart/add/${product.id}/product"
							class="btn btn-success disabled"><strike>Add to Cart</strike></a>
					</h6>
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/cart/add/${product.id}/product"
						class="btn btn-success">Add to Cart</a>
				</c:otherwise>
			</c:choose>
			</security:authorize>
			
			<security:authorize access="hasAuthority('ADMIN')">
				
						<a href="${contextRoot}/manage/${product.id}/product"
							class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a>
					
			</security:authorize>
			
		</div>
	</div>
	
	<a href="${contextRoot}/show/all/products" class="btn btn-info">Back</a>
	
	
</div>



