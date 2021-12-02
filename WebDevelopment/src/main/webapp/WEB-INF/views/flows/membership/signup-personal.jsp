
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../flows-shared/header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 style="color:white"><center><strong>SignUp-Personal</strong></center></h3>
			</div>
			<div class="panel-body">
			<sf:form class="form-horizontal" modelAttribute="user" method="POST">

						<div class="form-group">
							<label class="control-label col-md-4" for="firstName">First Name</label>
							<div class="col-md-8">
								<sf:input path="firstName" type="text" 
									placeholder="Enter your first Name" class="form-control" />
								<sf:errors path="firstName" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="lastName">Last Name</label>
							<div class="col-md-8">
								<sf:input path="lastName" type="text" 
									placeholder="Enter your last Name" class="form-control" />
								<sf:errors path="lastName" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="email">Email</label>
							<div class="col-md-8">
								<sf:input path="email" type="text" 
									placeholder="Email required" class="form-control" />
								<sf:errors path="email" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="contactNo">Contact number</label>
							<div class="col-md-8">
								<sf:input path="contactNo" type="text" 
									placeholder="##########" class="form-control" />
								<sf:errors path="contactNo" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="password">Password</label>
							<div class="col-md-8">
								<sf:input path="password" type="password" 
									placeholder="********" class="form-control" />
								<sf:errors path="password" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Confirm Password</label>
							<div class="col-md-8">
								<sf:input path="confirmPassword" type="password" 
									placeholder="Re-type your password" class="form-control" />
								<sf:errors path="confirmPassword" style="color:red" cssClass="help-block" element="em" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4" for="role">Select Role</label>
							<div class="col-md-8">
								<label class="radio-inline"> <sf:radiobutton path="role" value="USER" checked="checked"/>User
								</label>
								<label class="radio-inline"> <sf:radiobutton path="role" value="SUPPLIER" checked="checked"/>Supplier
								</label>
							</div>
						</div>
						
						<div class="form-group">
						<div class="col-md-offset-4 col-md-8 ">
						<button type="submit" class="btn btn-primary" name="_eventId_billing">
						Next->Billing<span class="glyphicon glyphicon-chevron-right"/></span>
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