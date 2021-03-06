<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-sm-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">Agent <small>Edit Form</small></h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i><a href="/main.jsp">Home</a><i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">Member</a><i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="javascript:getReloadPage();">Agent Edit Properties</a>
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
								<i class="fa fa-reorder"></i> Agent Edit Properties
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
												<label class="control-label col-sm-4" for="inputSuccess">Agent ID<span class="required">*</span>
												</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="12" data-required="1" name="agentId" value="${agentBean.agentId}" readonly>
													<input name="request" type="hidden" value="agentEdit" >
												</div>
											</div>
										</div>
										
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4" for="inputSuccess">Agent Name<span class="required">*</span>
												</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="20" data-required="1" name="name" value="${agentBean.name}" >
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Status<span class="required">*</span></label>
												<div class="col-sm-6">
													<select name="active" class="select2me form-control" id="active">
														<option value="1" >ACTIVE</option>
														<option value="2" selected>INACTIVE</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Bank Code<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="20" placeholder="" name="bankCode" value="${agentBean.bankCode}" >
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Branch<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="100" placeholder="" name="branch" value="${agentBean.branch}" >
												</div>
											</div>
										</div>
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Account<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="20" placeholder="" name="account" value="${agentBean.account}" >
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="control-label col-sm-4">Account Holder<span class="required">*</span></label>
												<div class="col-sm-6">
													<input type="text" class="form-control" maxlength="100" placeholder="" name="accountHolder" value="${agentBean.accountHolder}" >
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
										<a class="btn green btn-sm" href="javascript:getPageContent('/member/agentForm.jsp');"><i class="fa fa-reorder"></i>&nbsp;List Page&nbsp;&nbsp;</a>
										<a class="btn dark btn-sm" href="javascript:getPageContent('/member.do?request=aview&agentId=${agentBean.agentId}');"><i class="fa fa-chevron-left "></i>&nbsp;Prev&nbsp;&nbsp;</a>
										<button type="submit" class="btn purple btn-sm loading-btn" data-loading-text="Loading..." ><i class="fa fa-search"></i>&nbsp;Submit</button>
									</div>
								</div>
								
							</form>
						</div>
					</div>
					<!-- END ADD FORM TABLE-->
					<!-- BEGIN FORM JAVASCRIPT -->

					<script>
						//SELECT 정보 설정 
						$("#active").val("${agentBean.active}");
						
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
			                    agentId: {
			                        minlength: 5,
			                        required: true,
			                        remote:{
						                url: "/ajax.do?request=checkAgentId", //make sure to return true or false with a 200 status code
						                type: "post",
						                data: {
						                    agentId: function() {
						                        return $("#agentId").val();
						                    }
						                }
						            }
			                    },
			                    bankCode: {
			                        required: true,
			                        email: true
			                    },
			                    branch: {
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
			                    ajaxFormSubmit('/member.do?request=aview&agentId=${agentBean.agentId}');	//PAGE 이동
			                }
			            });
					</script>
					<!-- END FORM JAVASCRIPT -->
				</div>
			</div>
