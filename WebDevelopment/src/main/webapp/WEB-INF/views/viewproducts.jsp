<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>${title}</title>
<!-- Add custom CSS here -->
<link href="${css}/shop-homepage.css" rel="stylesheet">
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>
</head>

<body>
	<div class="container mainmargin" style="margin-top: 50px">
		<div class="row">

			<%@include file="./shared/sidebar.jsp"%>
	<div class="col-md-9">
				<div class="row">
					<div class="col-lg-12">

						<!-- BreadCrumb of all products -->
						<c:if test="${userClickAllProducts==true}">
							<script>
								window.categoryId = '';
							</script>

							<ol class="breadcrumb">
								<li><a href="${contextRoot}/home">Home</a></li>
								<li class="active">All Products</li>

							</ol>
						</c:if>
						<c:if test="${userClickCategoryProducts==true}">
							<!-- BreadCrumb for category of products -->
							<script>
								window.categoryId = '${category.id}';
							</script>
							<ol class="breadcrumb">
								<li><a href="${contextRoot}/home">Home</a></li>
								<li class="active">Category</li>
								<li class="active">${category.name}</li>
							</ol>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<table id="productListTable"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th></th>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Quantity</th>
									
									<th></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Quantity</th>
									
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>