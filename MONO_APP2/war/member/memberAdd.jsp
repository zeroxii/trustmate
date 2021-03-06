<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-sm-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">Member <small>Registration</small></h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i><a href="/main.jsp">Home</a><i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">Member</a><i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="javascript:getReloadPage();">Member Registration</a>
						</li>
						
						
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->

			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-sm-12">
					<!-- BEGIN ADD FORM TABLE-->
					<div class="portlet box blue ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> Registration Form
							</div>
							<div class="tools">
								<a href="" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form class="form-horizontal form-bordered form-row-stripped" role="form" data-form="true" id="form" name="form" action="/member.do" method="post">
								<div class="form-body">
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4" for="inputSuccess">Member ID<span class="required">*</span>
												</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="12" name="memberId" id="memberId">
													<input name="request" type="hidden" value="mAdd" >
												</div>
											</div>
										</div>
										
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Password<span class="required">*</span></label>
												<div class="col-sm-6">
													<input name="password" type="password" id="password" class="form-control" maxlength="20" placeholder="password" >
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Password<span class="required">*</span></label>
												<div class="col-sm-6">
													<input name="password2" type="password" class="form-control" maxlength="20" placeholder="confirm password" >
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4" for="inputSuccess">Member Name<span class="required">*</span>
												</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="20" data-required="1" name="name" >
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">E-Mail<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="email" name="officeEmail" maxlength="50" class="form-control" >
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Telephone No.<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="text" class="form-control" numberHypen maxlength="20" placeholder="" name="phoneNo">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Grade<span class="required">*</span></label>
												<div class="col-sm-6">
													<select name="memberGrade" class="select2me form-control">
														<option value="0" >0등급</option>
														<option value="1" >1등급</option>
														<option value="2" >2등급</option>
														<option value="3" >3등급</option>
														<option value="4" >4등급</option>
														<option value="5" >5등급</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Status<span class="required">*</span></label>
												<div class="col-sm-6">
													<select name="active" class="select2me form-control">
														<option value="1" >ACTIVE</option>
														<option value="2" selected>INACTIVE</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Dept &amp; Notice<span class="required">*</span></label>
												<div class="col-sm-6">
													<select name="notice" class="select2me form-control">
														<option value="SYSTEM" >SYSTEM</option>
														<option value="ADMIN" >ADMIN</option>
														<option value="USER" selected>USER</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>	
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check above.
								</div>
								<div class="form-actions right">
									<div class="">
										<a class="btn green btn-sm" href="javascript:getPageContent('/member/memberForm.jsp');"><i class="fa fa-reorder"></i>&nbsp;List Page&nbsp;&nbsp;</a>
										<button type="reset" class="btn dark btn-sm"><i class="fa fa-eraser"></i>&nbsp;Reset&nbsp;&nbsp;</button>
										<button type="submit" class="btn purple btn-sm loading-btn" data-loading-text="Loading..." ><i class="fa fa-search"></i>&nbsp;Submit</button>
									</div>
								</div>
								
							</form>
						</div>
					</div>
					<!-- END ADD FORM TABLE-->
					<!-- BEGIN FORM JAVASCRIPT -->

					<script>
				       
				        
				        $(':input[maxlength]' ).maxlength({
				            alwaysShow: true,
				            warningClass: "label label-success",
				            limitReachedClass: "label label-danger",
				            separator: ' out of ',
				            preText: 'You typed ',
				            postText: ' chars available.',
				            validate: true
				        });
				        
				        var form1 = $('#form');
			            var error1 = $('.alert-danger', form1);
			
			            form1.validate({
			                errorElement: 'span', //default input error message container
			                errorClass: 'help-inline', // default input error message class
			                focusInvalid: true, // do not focus the last invalid input
			                ignore: "",
			                rules: {
			                    memberId: {
			                        minlength: 5,
			                        required: true,
			                        remote:{
						                url: "/ajax.do?request=checkMemberId", //make sure to return true or false with a 200 status code
						                type: "post",
						                data: {
						                    memberId: function() {
						                        return $("#memberId").val();
						                    }
						                }
						            }
			                    },
			                    officeEmail: {
			                        required: true,
			                        email: true
			                    },
			                    password: {
			                    	required: true,
			                        minlength: 5,
			                        required: true
			                    },
			                    password2: {
									required: true,
									minlength: 5,
									equalTo: "#password"
								},
			                    phoneNo: {
			                    	minlength: 10,
			                        required: true
			                    },
			                    name: {
			                        required: true,
			                        minlength: 3
			                    }
			                },
			
			                invalidHandler: function (event, validator) { //display error alert on form submit              
			                    error1.show();
			                    App.scrollTo(error1, -200);
			                },
			                highlight: function (element) { // hightlight error inputs
			                    $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
			                },
			                unhighlight: function (element) { // revert the change done by hightlight
			                    $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
			                },
			                success: function (label) {
			                	label.closest('.form-group').removeClass('has-error'); 
			                    label.closest('.form-group').addClass('has-success'); 
			                },
			                submitHandler: function (form) {
			                    error1.hide();
			                    ajaxFormSubmit('/member/memberForm.jsp');	//PAGE 이동
			                }
			            });
				
					</script>
					<!-- END FORM JAVASCRIPT -->
				</div>
			</div>
