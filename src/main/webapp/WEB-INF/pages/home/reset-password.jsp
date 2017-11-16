<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
			<fieldset>
				<h2 class="text-center text-capitalize text-primary"><spring:message code='label.account' /></h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email">
				</div>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="submit" class="btn btn-lg btn-success btn-block" value="">
                        	<spring:message code='label.account.login' />
                       	</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>
