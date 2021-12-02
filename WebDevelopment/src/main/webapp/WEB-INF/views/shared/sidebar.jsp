 
 <div class="col-md-3">
                <strong><p style="font-family:algerian; color:black;font-size:150%" class="lead">Categories</p></strong>
                <div class="list-group">
                
                   <c:forEach items="${categories}" var="category">
                <a style="font-family: Georgia, serif,; color:black;font-size:100%" href="${contextRoot}/show/category/${category.id}/products" class="list-group-item">${category.name}</a></strong>
                </c:forEach>
                </div>
               
            </div> 

            
          