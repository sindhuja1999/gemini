
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../flows-shared/header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 style="color:white"><center><strong>Personal Confirmation Window</strong></center></h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
				<h3>Name:<strong>${registerModel.user.firstName}${registerModel.user.lastName}</strong></h3>
					<h3>Email:<strong>${registerModel.user.email}</strong></h3>
					<h3>Contact Number:<strong>${registerModel.user.contactNo}</strong></h3>
					<h3>Role:<strong>${registerModel.user.role}</strong></h3>
					<p><a href="${flowExecutionUrl}&_eventId_personal"class="btn btn-primary">Edit Personal</a><p>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 style="color:white"><center><strong>Billing Confirmation Window</strong></center></h3>
			</div>
			<div class="panel-body">
			<div class="text-center">
			<p>${registerModel.billing.addressLineOne},</p>
			<p>${registerModel.billing.addressLineTwo},</p>
			<p>${registerModel.billing.city},</p>
			<p>${registerModel.billing.postalCode},</p>
			<p>${registerModel.billing.state},</p>
			<p>${registerModel.billing.country}</p>
				<p><a href="${flowExecutionUrl}&_eventId_billing"class="btn btn-primary">Edit Billing</a><p>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-4 col-sm-offset-4">
		<div class="text-center">
			<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-info">Confirm</a>
		</div>
	</div>
</div>
</div>
<%@include file="../flows-shared/footer.jsp"%>