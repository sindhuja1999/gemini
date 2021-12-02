<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container mainmargin" style="margin-top: 50px">

	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-info fade in">${message}</div>
			</div>
		</div>
	</c:if>
	<div class="row">

		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">

				<div class="panel-heading">
					<h3 style="color:white"><center><strong>Product Management</strong></center></h3>
				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								product Name</label>
							<div class="col-md-8">
								<sf:input path="name" type="text" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								Brand Name</label>
							<div class="col-md-8">
								<sf:input path="brand" type="text" id="brand"
									placeholder="Brand Name" class="form-control" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">
								Description</label>
							<div class="col-md-8">
								<sf:textarea path="description" id="description" row="4"
									placeholder="Description" class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">
								Unit Price of Product</label>
							<div class="col-md-8">
								<sf:input path="unitPrice" id="unitPrice" type="number"
									placeholder="Unit price in &#8377" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">
								Quantity</label>
							<div class="col-md-8">
								<sf:textarea path="quantity" id="quantity" type="number"
									placeholder="Quantity" class="form-control" />
								<sf:errors path="quantity" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="file"> Upload
								an image file</label>
							<div class="col-md-8">
								<sf:input path="file" type="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">
								Select category</label>
							<div class="col-md-8">
								<sf:select class="control-label" id="categoryId"
									path="categoryId" items="${categories}" itemLabel="name"
									itemValue="id">
								</sf:select>
								<div class="text-right">
									<br>
									<sf:hidden path="id" />
									<sf:hidden path="code" />
									<sf:hidden path="supplierId" />
									<sf:hidden path="active" />
								</div>
							</div>
						</div>

						<div class="form-group">

							<div class="col-md-offset-4 col-md-4">
								<input type="Submit" name="submit" value="submit"
									class="btn btn-primary" />
							</div>
						</div>
					</sf:form>
				</div>

			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<h3>Available Products for Admin</h3>
			<hr />
		</div>
		<div class="col-xs-12">
			<div style="overflow: auto">
				<table id="adminProductTable"
					class="table table-striped table-boardered">
					<thead>
						<tr>
							<th>Id</th>
							<th>&#160</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Active</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>