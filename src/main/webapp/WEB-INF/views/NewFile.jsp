<div class="row">
					<div class="card-body">
						<a href="javascript:void(0)" data-toggle="modal"
							data-target="#add-new-event"
							class="btn m-t-20 btn-info btn-block waves-effect waves-light">
							<i class="ti-plus"></i> 그룹 생성하기
						</a>
					</div>
					<div class="col-lg-9"></div>
				</div>
				<!-- Modal Add Category -->
				<div class="modal fade none-border" id="add-new-event">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">
									<strong>Add</strong> a group
								</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<form action="/group" method="POST">
								<div class="modal-body">
									<div class="row">
										<div class="col-md-10">
											<label class="control-label">Group Name</label> <input
												class="form-control form-white"
												placeholder="그룹 이름을 작성해 주세요." type="text" name="g_name"
												required="required" /> <input type="hidden" name="u_id"
												value="${user.u_id}" />
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit"
										class="btn btn-danger waves-effect waves-light save-category" id ="addNoticeBtn" onclick="addNotice();">Save</button>
									<button type="button" class="btn btn-secondary waves-effect"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- END MODAL -->