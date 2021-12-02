
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../flows-shared/header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 style="color:white"><center><strong>SignUp-Address</strong></center></h3>
			</div>
			<div class="panel-body">
			<sf:form class="form-horizontal" modelAttribute="billing" method="POST">

						<div class="form-group">
							<label class="control-label col-md-4" for="addressLineOne">Address Line One</label>
							<div class="col-md-8">
								<sf:input path="addressLineOne" type="text" 
									placeholder="Address line One" class="form-control" />
								<sf:errors path="addressLineOne" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="addresslineTwo">Address Line Two</label>
							<div class="col-md-8">
								<sf:input path="addressLineTwo" type="text" 
									placeholder="Address Line Two" class="form-control" />
								<sf:errors path="addressLineTwo" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="city">City</label>
							<div class="col-md-8">
								<sf:input path="city" type="text" 
									placeholder="Enter your city" class="form-control" />
								<sf:errors path="city" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="state">State</label>
							<div class="col-md-8">
								<sf:input path="state" type="text" 
									placeholder="Enter your state" class="form-control" />
								<sf:errors path="state" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="country">Country</label>
							<div class="col-md-8">
								<sf:input path="country" type="text" 
									placeholder="Enter Your Country" class="form-control" />
								<sf:errors path="country" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="postalCode">Postal Code</label>
							<div class="col-md-8">
								<sf:input path="postalCode" type="text" 
									placeholder="Enter Your Postal code" class="form-control" />
								<sf:errors path="postalCode" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						
						
						<div class="form-group">
						<div class="col-md-offset-4 col-md-8 ">
						<button type="submit" class="btn btn-primary" name="_eventId_personal">
						<span class="glyphicon glyphicon-chevron-left"/>Back->Personal
						</button>
						</div>
						
						<div class="col-md-offset-4 col-md-8 ">
						<button type="submit" class="btn btn-primary" name="_eventId_confirm">
						Next->Confirm<span class="glyphicon glyphicon-chevron-right"/></span>
						</button>
						</div>
						</div>
						
						</sf:form>
			</div>
		</div>
	</div>
</div>
</div>

<%@include file="../flows-shared/footer.jsp"%>