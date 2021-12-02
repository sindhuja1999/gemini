
<div class="container" style="margin-top:50px;margin-left:50px; margin-bottom: 50px;">
   <c:if test="${not empty message}">
   <div class="alert alert-info">
   <h4 class="text-center">${message}</h4>
   </div>
   </c:if>
   
    <c:choose>
	<c:when test="${not empty cartLines}">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Unit Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${cartLines}" var="cartLine">
               
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${images}/${cartLine.product.code}.jpeg" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cartLine.product.name}</a></h4>
                                <h5 class="media-heading"><strong>by</strong> <a href="#">${cartLine.product.brand}</a></h5>
                                <p><strong>Description:</strong>${cartLine.product.description}</p>
                                
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="number" id="count_${cartLine.id}" class="form-control; text-center" value="${cartLine.productCount}" min="1" max="4">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center">
						&#8377;${cartLine.buyingPrice}
						</td>
                        
                        <td class="col-sm-1 col-md-1 text-center">
                        &#8377;${cartLine.total}
                        </td>
                        
                               <td class="col-sm-1 col-md-1">
                        	<c:if test="${cartLine.available==true}">
                         	<button type="button" value="${cartLine.id}" name="refreshCart">      
        				<a href="#"><span class="glyphicon glyphicon-refresh"></span></a>
                        </button>
                        </c:if>
                        </td>
                        <td class="col-sm-1 col-md-1">
         				<a href="${contextRoot}/cart/${cartLine.id}/delete" ><span class="glyphicon glyphicon-remove"></span></a>
                      </td>
                        
                    </tr>
                    </c:forEach>
                    
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Grand Total</h3></td>
                        <td class="text-right"><h3><strong> &#8377; ${userModel.cart.grandTotal}</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> <a href="${contextRoot}/show/all/products">Continue Shopping</a>
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-success">
                           <span class="glyphicon glyphicon-play"></span><a style="color:white" href="${contextRoot}/cart/checkout">Checkout </a>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </c:when>
    <c:otherwise>
	<div class="jumbotron">
	<h3 class="text-center">Your cart is empty..!!</h3>
	</div>
	</c:otherwise>
    </c:choose>
</div>