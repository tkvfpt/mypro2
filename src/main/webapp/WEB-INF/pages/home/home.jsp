<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="${pageContext.request.contextPath}/js/carousel.js"></script>

<div class="row">
	<div class="jumbotron" align="center">
		<img class="img-responsive" src="<c:url value='/img/human_resource_logo.png' />" />
	</div>
</div>

<div class="row">
	<div class="col-sm-4">
		<div class="panel panel-success text-center">
			<div class="panel-heading">
				<h1><i class="fa fa-fw fa-users"></i> </h1>
			</div>
			<div class="panel-body">
				<p>
					<strong>20</strong> Lorem
				</p>
				<p>
					<strong>15</strong> Ipsum
				</p>
				<p>
					<strong>5</strong> Dolor
				</p>
				<p>
					<strong>2</strong> Sit
				</p>
				<p>
					<strong>Endless</strong> Amet
				</p>
			</div>
			<div class="panel-footer">
				<h3>total:</h3>
				<h4>${totalDepart}</h4>
				<a href="${pageContext.request.contextPath}/depart/list" class="btn btn-success btn-lg btn-block">
					<i class="fa fa-list"></i> lorem</a>
			</div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-info text-center">
			<div class="panel-heading">
				<h1><i class="fa fa-fw fa-user-md"></i></h1>
			</div>
			<div class="panel-body">
				<p>
					<strong>50</strong> Lorem
				</p>
				<p>
					<strong>25</strong> Ipsum
				</p>
				<p>
					<strong>10</strong> Dolor
				</p>
				<p>
					<strong>5</strong> Sit
				</p>
				<p>
					<strong>Endless</strong> Amet
				</p>
			</div>
			<div class="panel-footer">
				<h3>:</h3>
				<h4>${totalStaff}</h4>
				<a href="${pageContext.request.contextPath}/staff/list" class="btn btn-info btn-lg btn-block">
					<i class="fa fa-list"></i> </a>
			</div>
		</div>
	</div>
	<div class="col-sm-4">
		<div class="panel panel-warning text-center">
			<div class="panel-heading">
				<h1><i class="fa fa-fw fa-book"></i> </h1>
			</div>
			<div class="panel-body">
				<p>
					<strong>100</strong> Lorem
				</p>
				<p>
					<strong>50</strong> Ipsum
				</p>
				<p>
					<strong>25</strong> Dolor
				</p>
				<p>
					<strong>10</strong> Sit
				</p>
				<p>
					<strong>Endless</strong> Amet
				</p>
			</div>
			<div class="panel-footer">
				<h3>:</h3>
				<h4>${totalRecord}</h4>
				<a href="${pageContext.request.contextPath}/record/list" class="btn btn-warning btn-lg btn-block">
					<i class="fa fa-list"></i> </a>
			</div>
		</div>
	</div>
</div>



<div class="row">
	
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h1 class="text-center"><i class="fa fa-star" aria-hidden="true"></i> </h1>
		</div>
	<div class="panel-body">
		<div class="col-md-1"></div>
	<c:forEach var="rate" items="${rateTopList.list}" varStatus="status">
		<div class="col-md-2 portfolio-item text-center" align="center">
			<div class="rate-frame thumbnail">
				<p class="text-center text-success bg-info">
			            <a href="#" >${rate.name}</a>
			        </p>
		        <a href="${pageContext.request.contextPath}/staff/view?id=${rate.id}">
		            <img class="img-responsive center-block" src="${pageContext.request.contextPath}/img/staff?id=${rate.id}" width="180" alt="">
		        </a>
		        <div class="rate-info">
			        <p class="text-center rate-mark text-success">: ${rate.praise - rate.down}</p>
		        </div>
	        </div>
	    </div>
	    <c:if test="${status.index == 4 }">
	    	<div class="col-md-12"></div>
	    	<div class="col-md-1"></div>
    	</c:if>
	</c:forEach>
	</div>
</div>
	
	
	
</div>
<!-- /.row -->