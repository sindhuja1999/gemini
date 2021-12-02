
var token=$('meta[name="_csrf"]').attr('content');
var header=$('meta[name="_csrf_header"]').attr('content');

if((token!=undefined && header!=undefined) &&(token.length>0 && header.length>0))
	{
		$(document).ajaxSend(function(e,xhr,options)
				{
					xhr.setRequestHeader(header,token);
				});
	}
$(function() {
	switch (menu) {
	case 'Home Page':
		$('#home').addClass('active');
		break;

	case 'About Us Page':
		$('#aboutus').addClass('active');
		break;

	case 'Product Page':
		$('#viewProducts').addClass('active');
		break;

	case 'Contact Us Page':
		$('#contactus').addClass('active');
		break;

	}
})

/* code for data retrieved data by using join controller */
var $table = $('#productListTable');
if ($table.length) {
	var jsonUrl = '';
	if (window.categoryId == '') {
		jsonUrl = window.contextRoot + '/json/data/all/products';

	} else {
		jsonUrl = window.contextRoot + '/json/data/category/'
				+ window.categoryId + '/products'
	}
	$table
			.DataTable({
				lengthMenu : [ [ 2, 5, 10, -1 ],
						[ '2 Records', '5 Records', '10 Records', 'All' ] ],
				pageLength : 5,
				ajax : {
					url : jsonUrl,
					dataSrc : ''

				},
				columns : [
						{
							data : 'code',
							mRender : function(data, type, row) {

								return '<img src="' + window.contextRoot
										+ '/resources/images/' + data
										+ '.jpeg" class="datatableimg"/>';
							}
						},

						{
							data : 'name'
						},
						{
							data : 'brand'
						},
						
						{
							data : 'unitPrice',
							mRender : function(data, type, row) {
								return '&#8377;' + data
							}
						},
						{
							data : 'quantity',
							mRender : function(data, type, row) {

								if (data < 1) {
									return '<span style="color:red">Out Of Stock</span>'
								}
								return data;
							}
						},
						{
							data : 'id',
							mRender : function(data, type, row) {
								var str = '';
								str += '<a class="btn btn-primary" href="'
										+ window.contextRoot + '/show/' + data
										+ '/product "><span class="glyphicon glyphicon-eye-open"</span></a> ';
								
								if(userRole!='ADMIN')
									{
									if (row.quantity < 1)

									{
										str += '<a class="btn btn-success disabled"  href="javascript:void(0)"><span class="glyphicon glyphicon-shopping-cart"</span></a>&#160 ';

									} 
									else 
									{
										str += '<a class="btn btn-success"href="'
												+ window.contextRoot + '/cart/add/'
												+ data + '/product"><span class="glyphicon glyphicon-shopping-cart"</span></a> ';

									}
									}
									
									else
										{
										str += '<a class="btn btn-success"href="'
											+ window.contextRoot + '/manage/'
											+ data + '/product"><span class="glyphicon glyphicon-pencil"</span></a> ';

										}
									
								return str;

							}

						}

				]

			});
}

var $alert = $('.alert');
if ($alert.length) {
	setTimeout(function() {
		$alert.fadeOut('slow');
	}, 4000)
}

var $adminProductTable = $('#adminProductTable');

if ($adminProductTable.length) {
	var jsonUrl = window.contextRoot +'/json/data/admin/all/products';

	$adminProductTable.DataTable({
		lengthMenu : [ [ 2, 5, 10, -1 ],
				[ '2 Records', '5 Records', '10 Records', 'All' ] ],
		pageLength : 5,
		ajax : {
			url : jsonUrl,
			dataSrc : ''

		},
		
		columns:
			[
				{
					data:'id'
				},
				
				{
					data:'code',
					bSortable:false,
					mRender:function(data,type,row)
					{
						return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpeg" class="adminDataTableImg"/>'
					}
				},
				
				{
					data:'name'
				},
				
				{
					data:'brand'
				},
				
				{
					data:'quantity',
					mRender : function(data, type, row) {

						if (data < 1) {
							return '<span style="color:red">Out Of Stock</span>'
						}
						return data;
					}
					
				},
				
				{
					data:'unitPrice',
					mRender : function(data, type, row) 
					{
						return '&#8377;' + data
					}
				},
				
				{
					data:'active',
					bSortable:false,
					mRender:function(data,type,row)
					{
						var str='';
						str+='<label class="switch">';
						if(data)
							{
							str+='<input type="checkbox" checked=checked value="'+row.id+'"/>';
							}
						else
							{
							str+='<input type="checkbox" value="'+row.id+'"/>';
							}
						str+='<div class="slider"></div></label>';
						return str;
					}
				},
				
				{
					data:'id',
					bSortable:false,
					mRender:function(data,type,row)
					{
						
						var str='';
						str+='<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-info btn-lg">';
						str+='<span class="glyphicon glyphicon-edit"></span></a>';
						return str;
					}
				}
				
			],
			
			initComplete:function()
			{
				var api=this.api();
				api.$('.switch input[type="checkbox"]').on('change',function()
						{
					var checkbox=$(this);
					var checked=checkbox.prop('checked');
					var msg=(checked)?'Do you want to activate the product..??':'Do you want to deactivate the product..??';
					var value=checkbox.prop('value');
					
					bootbox.confirm({
						size:'medium',
						title:'Product Activation & Deactivation window',
						message:msg,
						callback:function(confirmed){
							if(confirmed)
								{
								var activationURL=window.contextRoot+'/manage/product/'+value+'/activation';
								$.post(activationURL,function(data)
								{
									bootbox.alert({
										size:medium,
										title:"info",
										message:data
									});
								});
								
								}
							else
								{
								checkbox.prop('checked',!checked)
								}
						}
					});
					
				});
			}
	});
}

$loginForm=$('#loginExec');
if($loginForm.length)
	{
	$loginForm.validate({
		rules:{
			username:{
				required:true,
				email:true
			},
			password:{
				required:true
			}
				
			},
			messages:{
				username:{
					required:'Please enter your Email',
					email:'Please enter Email Address'
				},
				password:{
					required:'Please enter your password'
						}
			},
			errorElement:"em",
			errorPlacement:function(error,element){
				error.addClass("help-block");
				error.insertAfter(element);
			}
		
	});
	}


$('button[name="refreshCart"]').click(function(){
	
	var cartLineId=$(this).attr('value');
	var countField=$('#count_'+cartLineId);
	var originalCount=countField.attr('value');
	
	if(countField.val() != originalCount)
		{
		if(countField.val()<1 || countField.val() >4)
			{
			countField.val(originalCount);
			bootbox.alert({
				size:'medium',
				title:'error',
				message:'Product count could not be less than 1 and greater than 4..!!'
			});
			}
		else
			{
				var updateUrl=window.contextRoot+'/cart/'+cartLineId+'/update?count='+countField.val();
				/*window.updated=updaterUrl;*/
				window.location.href=updateUrl;
			}
		}
});
