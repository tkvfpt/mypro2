<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
</script>
	
	<!-- Page Heading -->
	<div class="row" id="main">
		<div class="col-sm-12 col-md-12 well" id="content">
			<h1 class="text-center text-capitalize text-primary"><spring:message code="title.staff.view" /></h1>
		</div>
	</div>
	<div class="row">
		<div class="toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="">${staffInfo.name}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-4 col-lg-4" align="center">
                	<img alt="User Pic" src="${pageContext.request.contextPath}/img/staff?id=${staffInfo.id}" class="img-circle img-responsive">
               	</div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-8 col-lg-8 "> 
                  <table class="table table-user-information">
                    <tbody>
						<tr>
							<td><spring:message code="label.depart" />:</td>
							<td>${departName}</td>
						</tr>
						<tr>
							<td><spring:message code="label.id" />:</td>
							<td>${staffInfo.id}</td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.name" />:</td>
							<td>${staffInfo.name}</td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.email" />:</td>
							<td><a href="mailto:${staffInfo.email}">${staffInfo.email}</a></td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.gender" />:</td>
							<td>
								<c:if test="${staffInfo.gender == true}" >
									<spring:message code="label.staff.gender.male" />
								</c:if>
								<c:if test="${staffInfo.gender == false}" >
									<spring:message code="label.staff.gender.female" />
								</c:if>
							</td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.birthday" />:</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy" value="${staffInfo.birthday}" /></td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.phone" />:</td>
							<td>${staffInfo.phone}</td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.salary" />:</td>
							<td><fmt:formatNumber type="number" value="${staffInfo.salary}" /></td>
						</tr>
						<tr>
							<td><spring:message code="label.totalRecord" />:</td>
							<td>${rateInfo.praise + rateInfo.down}</td>
						</tr>
						<tr>
							<td><spring:message code="label.totalPraise" />:</td>
							<td class="text-primary">${rateInfo.praise}</td>
						</tr>
						<tr>
							<td><spring:message code="label.totalCriticize" />:</td>
							<td class="text-danger">${rateInfo.down}</td>
						</tr>
						<tr>
							<td><spring:message code="label.staff.notes" />:</td>
							<td>${staffInfo.notes}</td>
						</tr>
                    </tbody>
                  </table>
					<div class="row">
						<div class="col-xs-6 col-md-4">
<%-- 		                	<a href="${pageContext.request.contextPath}/staff/list" class="btn btn-primary btn-block"> --%>
<%-- 		                		<i class="fa fa-list"></i> <spring:message code="btn.staff.list" /></a> --%>
	                	</div>
<!-- 		                <div class="col-xs-6 col-md-4 col-md-offset-1"> -->
<%-- 			                <a href="${pageContext.request.contextPath}/staff/update?id=${staffInfo.id}&page=${recordList.currentPage}&viewSource=staff" --%>
<!-- 								class="btn btn-success btn-block"> -->
<%-- 								<i class="fa fa-edit"></i> <spring:message code="btn.staff.update" /></a> --%>
<!-- 						</div> -->
					</div>
                </div>
              </div>
            </div>
			<div class="panel-footer">
<!-- 				<a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a> -->
<!-- 				<span class="pull-right"> -->
<!-- 					<a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a> -->
<!-- 					<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a> -->
<!-- 				</span> -->
			</div>
          </div>
        </div>
	</div>
	<!-- 	end table profile -->
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="row">
		<form action="${pageContext.request.contextPath}/record"
			method="get" id="listForm">
			<div class="panel panel-success text-primary updown-padding">
				<div class="panel-heading medium-height">
					<div class="col-xs-6 col-sm-5">
						<input type="hidden" name="viewSource" value=staff />
						<span class="text-primary text-lg"><spring:message code="title.record.list" /></span>
					</div>
					<div class="col-xs-6 col-sm-3">
						
					</div>
					<div class="col-xs-6 col-sm-2">
					
					</div>
					<div class="col-xs-6 col-sm-2">
					
					</div>
					<!-- end table header content -->
				</div>
				<div class="panel-body">
					<table class="table table-hover col-xs-12">
						<thead>
							<tr>
								
								<th class="text-center"><spring:message code="label.number" /></th>
								<th class="text-center"><spring:message code="label.record.type" /></th>
								<th class="text-center"><spring:message code="label.record.reason" /></th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="record" items="${recordList.list}"
								varStatus="loop">
								<tr>
									
									<td class="text-center">${loop.count + (recordList.maxResult*(recordList.currentPage-1))}</td>
									<td class="text-center">
										<c:if test="${record.type == true}">
											<spring:message code='label.record.type.praise' />
										</c:if>
										<c:if test="${record.type == false}">
											<spring:message code='label.record.type.criticize' />
										</c:if>
									</td>
									<td>${record.reason}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- end table body content -->
				</div>
				<!-- end table body -->
				<div class="panel-footer medium-height">
					<div class="col-sx-6 col-sm-9"></div>
					<div class="col-xs-6 col-sm-3 text-right">
						<ul class="pagination nopadding">
							<c:if test="${recordList.totalPages > 1}">
								<c:forEach var="count" items="${recordList.navigationPages}">
									<li class="${count == recordList.currentPage ? 'active' : '' }">
										<a href="${pageContext.request.contextPath}/statistic??page=${count}">
											${count}
										</a>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- end table footer -->
			</div>
			<!-- end panel -->
		</form>
		<!-- end form -->
	</div>
