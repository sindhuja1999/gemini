

<div class='container'>
	<div class='row' style='padding-top: 25px; padding-bottom: 25px;'>
		<div class='col-md-12'>
			<div id='mainContentWrapper'>
				<div class="col-md-8 col-md-offset-2">
					<h2 style="text-align: center;">Review Your Order &
						Checkout</h2>
					<hr />
					<button type="button" class="btn btn-default">
						<center>
							<a href="${contextRoot}/show/all/products">Add More Products</a>
						</center>
					</button>
					<hr />
					<div class="shopping_cart">
						<form class="form-horizontal" role="form" action="" method="post"
							id="payment-form">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne">Review Your Order</a>
										</h4>
									</div>
									
									<%-- <div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-3 col-xs-3">
													<img class="img-responsive" src="${images}/w2.jpg" />
												</div>
												<div class="col-sm-4 col-xs-6">
													<div class="col-xs-12">Product name:</div>
													<div class="col-xs-12">
														<small>Quantity:<span>1</span></small>
													</div>
												</div>
												<div class="col-sm-3 col-xs-3 text-right">
													<h6>&#8377; 999</h6>
												</div>
											</div>
										</div> --%>
										
										<div class="panel-body">
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img class="img-responsive" src="${images}/sw1.jpg"style="width: 72px; height: 72px;" />
                                </div>
                                <div class="col-sm-4 col-xs-6">
                                    <div class="col-xs-12">	Noise ColorFit Pro 3</div>
                                    <div class="col-xs-12"><small>Quantity:<span>1</span></small></div>
                                </div>
                                <div class="col-sm-3 col-xs-3 text-right">
                                    <h6>&#8377; 3999</h6>
                                </div>
                            </div>
                            <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img class="img-responsive" src="${images}/fur1.jpg"style="width: 72px; height: 72px;" />
                                </div>
                                <div class="col-sm-4 col-xs-4">
                                    <div class="col-xs-12">	ELTOP Lifestyle Nano Fabric</div>
                                    <div class="col-xs-12"><small>Quantity:<span>1</span></small></div>
                                </div>
                                <div class="col-sm-3 col-xs-3 text-right">
                                   <h6>&#8377; 3999</h6>
                                     <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-xs-14">
                                    <strong>Order Total</strong>
                                    <div class="pull-right"><h6>&#8377; 7998</h6></div>
                                </div>
                            </div>

									</div>
									</div>
									</div>
									</div> 
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<div style="text-align: center; width: 100%;">
												<a style="width: 100%;" data-toggle="collapse"
													data-parent="#accordion" href="#collapseTwo"
													class=" btn btn-success"
													onclick="$(this).fadeOut(); $('#payInfo').fadeIn();">Continue
													to Billing Information</a>
											</div>
										</h4>
									</div>
								</div>
								</div>
								</form>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseTwo">Contact and Billing Information</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<b>Help us keep your account safe and secure, please
												verify your billing information.</b> <br />
											<br />
											<table class="table table-striped" style="font-weight: bold;">
												<tr>
													<td style="width: 175px;"><label for="id_email">Email:</label></td>
													<td><input class="form-control" id="id_email"
														name="email" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_first_name">First
															name:</label></td>
													<td><input class="form-control" id="id_first_name"
														name="first_name" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_last_name">Last
															name:</label></td>
													<td><input class="form-control" id="id_last_name"
														name="last_name" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label
														for="id_address_line_1">Address:</label></td>
													<td><input class="form-control" id="id_address_line_1"
														name="address_line_1" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_city">City:</label></td>
													<td><input class="form-control" id="id_city"
														name="city" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_state">State:</label></td>
													<td><select class="form-control" id="id_state"
														name="state">
															<option value="AK">Andhra Pradesh</option>
															<option value="AL">Telengana</option>
															<option value="AZ">Karnataka</option>
															<option value="AR">Maharastra</option>
															<option value="CA">TamilNadu</option>
															<option value="CO">Kerala</option>
															<option value="CT">Orrisa</option>
															<option value="DE">Himachal Pradesh</option>
															<option value="FL">Punjab</option>
													</select></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_postalcode">Postalcode:</label></td>
													<td><input class="form-control" id="id_postalcode"
														name="postalcode" required="required" type="text" /></td>
												</tr>
												<tr>
													<td style="width: 175px;"><label for="id_phone">Phone:</label></td>
													<td><input class="form-control" id="id_phone"
														name="phone" type="text" /></td>
												</tr>

											</table>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<div style="text-align: center;">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseThree" class=" btn   btn-success"
													id="payInfo" style="width: 100%; display: none;"
													onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter
													Payment Information</a>
											</div>
										</h4>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseThree"> <b>Payment Information</b>
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<span class='payment-errors'></span>
											<fieldset>
												<legend>What method would you like to pay with
													today?</legend>
												<div class="form-group">
													<label class="col-sm-3 control-label"
														for="card-holder-name">Name on Card</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" stripe-data="name"
															id="name-on-card" placeholder="Card Holder's Name">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="card-number">Card
														Number</label>
													<div class="col-sm-9">
														<input type="text" class="form-control"
															stripe-data="number" id="card-number"
															placeholder="Debit/Credit Card Number"> <br />
														<div>
															<img class="pull-right"
																src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png"
																style="max-width: 250px; padding-bottom: 20px;">
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="expiry-month">Expiration
															Date</label>
														<div class="col-sm-9">
															<div class="row">
																<div class="col-xs-3">
																	<select class="form-control col-sm-2"
																		data-stripe="exp-month" id="card-exp-month"
																		style="margin-left: 5px;">
																		<option>Month</option>
																		<option value="01">Jan (01)</option>
																		<option value="02">Feb (02)</option>
																		<option value="03">Mar (03)</option>
																		<option value="04">Apr (04)</option>
																		<option value="05">May (05)</option>
																		<option value="06">June (06)</option>
																		<option value="07">July (07)</option>
																		<option value="08">Aug (08)</option>
																		<option value="09">Sep (09)</option>
																		<option value="10">Oct (10)</option>
																		<option value="11">Nov (11)</option>
																		<option value="12">Dec (12)</option>
																	</select>
																</div>
																<div class="col-xs-3">
																	<select class="form-control" data-stripe="exp-year"
																		id="card-exp-year">
																		<option value="2016">2016</option>
																		<option value="2017">2017</option>
																		<option value="2018">2018</option>
																		<option value="2019">2019</option>
																		<option value="2020">2020</option>
																		<option value="2021">2021</option>
																		<option value="2022">2022</option>
																		<option value="2023">2023</option>
																		<option value="2024">2024</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label" for="cvv">Card
															CVC</label>
														<div class="col-sm-3">
															<input type="text" class="form-control" stripe-data="cvc"
																id="card-cvc" placeholder="Security Code">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-3 col-sm-9"></div>
													</div>
											</fieldset>
											<button type="submit" class="btn btn-success btn-lg"
												style="width: 100%;">Pay Now</button>
											<br />
											<div style="text-align: left;">
												<br /> By submiting this order you are agreeing to our <a
													href="/legal/billing/">universal billing agreement</a>, and
												<a href="/legal/terms/">terms of service</a>. If you have
												any questions about our products or services please contact
												us before placing this order.
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				
				</div>
			</div>
			
			
		</div>