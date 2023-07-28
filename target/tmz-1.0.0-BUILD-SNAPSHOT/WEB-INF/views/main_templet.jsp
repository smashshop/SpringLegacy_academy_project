<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

<%@ include file = "../templet/header.jsp"%>
<div class="col-md-12 grid-margin stretch-card">
  <div class="card">
    <div class="card-body">
      <%-- <div class="d-flex flex-row justify-content-between">
        <h3 class="card-title mb-1">${frnd_info.frnd_title }</h3>   
      </div><br>
      <div class="d-flex flex-row justify-content-between">
      <p class="text-muted mb-1">${frnd_info.frnd_country }${frnd_info.frnd_city }</p>
      <p class="text-muted mb-1"><fmt:formatDate pattern = "YYYY-MM-dd" value="${frnd_info.frnd_startdate }"/>
        	&nbsp;~ &nbsp;<fmt:formatDate pattern = "YYYY-MM-dd" value="${frnd_info.frnd_enddate }"/>
      </p>
      <p class="text-muted mb-1">${frnd_info.frnd_writer }</p>
      </div>--%>
      
      
      <div class="row">
        <div class="col-12">
          <div class="preview-list">
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-primary">
                  <i class="mdi mdi-file-document"></i>
                </div>
              </div>
              <div class="preview-item-content d-sm-flex flex-grow">
                <div class="flex-grow">
                  <h6 class="preview-subject">Admin dashboard design</h6>
                  <p class="text-muted mb-0">Broadcast web app mockup</p>
                </div>
                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                  <p class="text-muted">15 minutes ago</p>
                  <p class="text-muted mb-0">30 tasks, 5 issues </p>
                </div>
              </div>
            </div>
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-success">
                  <i class="mdi mdi-cloud-download"></i>
                </div>
              </div>
              <div class="preview-item-content d-sm-flex flex-grow">
                <div class="flex-grow">
                  <h6 class="preview-subject">Wordpress Development</h6>
                  <p class="text-muted mb-0">Upload new design</p>
                </div>
                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                  <p class="text-muted">1 hour ago</p>
                  <p class="text-muted mb-0">23 tasks, 5 issues </p>
                </div>
              </div>
            </div>
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-info">
                  <i class="mdi mdi-clock"></i>
                </div>
              </div>
              <div class="preview-item-content d-sm-flex flex-grow">
                <div class="flex-grow">
                  <h6 class="preview-subject">Project meeting</h6>
                  <p class="text-muted mb-0">New project discussion</p>
                </div>
                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                  <p class="text-muted">35 minutes ago</p>
                  <p class="text-muted mb-0">15 tasks, 2 issues</p>
                </div>
              </div>
            </div>
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-danger">
                  <i class="mdi mdi-email-open"></i>
                </div>
              </div>
              <div class="preview-item-content d-sm-flex flex-grow">
                <div class="flex-grow">
                  <h6 class="preview-subject">Broadcast Mail</h6>
                  <p class="text-muted mb-0">Sent release details to team</p>
                </div>
                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                  <p class="text-muted">55 minutes ago</p>
                  <p class="text-muted mb-0">35 tasks, 7 issues </p>
                </div>
              </div>
            </div>
            <div class="preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-warning">
                  <i class="mdi mdi-chart-pie"></i>
                </div>
              </div>
              <div class="preview-item-content d-sm-flex flex-grow">
                <div class="flex-grow">
                  <h6 class="preview-subject">UI Design</h6>
                  <p class="text-muted mb-0">New application planning</p>
                </div>
                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                  <p class="text-muted">50 minutes ago</p>
                  <p class="text-muted mb-0">27 tasks, 4 issues </p>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="exampleTextarea1">Textarea</label>
              <textarea class="form-control" id="exampleTextarea1" rows="20" readonly="readonly" style = "background-color:#2a3038;color:white;">aaaaaaaaaaaa</textarea>
            </div>
          </div>
        </div>
      </div>
      
      
      
      <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Order Status</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </th>
                            <th> Client Name </th>
                            <th> Order No </th>
                            <th> Product Cost </th>
                            <th> Project </th>
                            <th> Payment Mode </th>
                            <th> Start Date </th>
                            <th> Payment Status </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </td>
                            <td>
                              <img src="assets/images/faces/face1.jpg" alt="image">
                              <span class="pl-2">Henry Klein</span>
                            </td>
                            <td> 02312 </td>
                            <td> $14,500 </td>
                            <td> Dashboard </td>
                            <td> Credit card </td>
                            <td> 04 Dec 2019 </td>
                            <td>
                              <div class="badge badge-outline-success">Approved</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </td>
                            <td>
                              <img src="assets/images/faces/face2.jpg" alt="image">
                              <span class="pl-2">Estella Bryan</span>
                            </td>
                            <td> 02312 </td>
                            <td> $14,500 </td>
                            <td> Website </td>
                            <td> Cash on delivered </td>
                            <td> 04 Dec 2019 </td>
                            <td>
                              <div class="badge badge-outline-warning">Pending</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </td>
                            <td>
                              <img src="assets/images/faces/face5.jpg" alt="image">
                              <span class="pl-2">Lucy Abbott</span>
                            </td>
                            <td> 02312 </td>
                            <td> $14,500 </td>
                            <td> App design </td>
                            <td> Credit card </td>
                            <td> 04 Dec 2019 </td>
                            <td>
                              <div class="badge badge-outline-danger">Rejected</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </td>
                            <td>
                              <img src="assets/images/faces/face3.jpg" alt="image">
                              <span class="pl-2">Peter Gill</span>
                            </td>
                            <td> 02312 </td>
                            <td> $14,500 </td>
                            <td> Development </td>
                            <td> Online Payment </td>
                            <td> 04 Dec 2019 </td>
                            <td>
                              <div class="badge badge-outline-success">Approved</div>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <div class="form-check form-check-muted m-0">
                                <label class="form-check-label">
                                  <input type="checkbox" class="form-check-input">
                                <i class="input-helper"></i></label>
                              </div>
                            </td>
                            <td>
                              <img src="assets/images/faces/face4.jpg" alt="image">
                              <span class="pl-2">Sallie Reyes</span>
                            </td>
                            <td> 02312 </td>
                            <td> $14,500 </td>
                            <td> Website </td>
                            <td> Credit card </td>
                            <td> 04 Dec 2019 </td>
                            <td>
                              <div class="badge badge-outline-success">Approved</div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
    </div>
  </div>
</div>
<%@ include file = "../templet/footer.jsp"%>