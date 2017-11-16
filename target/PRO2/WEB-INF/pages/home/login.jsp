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
                    <input type="email" name="username" id="username" class="form-control input-lg" placeholder="Email">
				</div>
				<div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="<spring:message code='label.account.password' />">
				</div>
				<span class="button-checkbox">
<%-- 					<button type="button" class="btn" data-color="info"><spring:message code='label.account.rememberMe' /></button> --%>
                    <input type="checkbox" name="remember_me" id="remember_me" class=""> <spring:message code='label.account.rememberMe' />
<!-- 					<a href="" class="btn btn-link pull-right">Forgot Password?</a> -->
				</span>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <button type="submit" class="btn btn-lg btn-success btn-block" value="">
                        	<spring:message code='label.account.login' />
                       	</button>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="${pageContext.request.contextPath}/resetPassword" class="btn btn-lg btn-primary btn-block">Forgot password</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</div>
