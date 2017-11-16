<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<<div class="container">
<div class="jumbotron text-center">
  <h1 class="text-danger"><i class="fa fa-ban red"></i> 403</h1>
  <p class="lead"><spring:message code="text.accessDenied" /> <em><span id="display-domain"></span></em>.</p>
    <p><a href="${pageContext.request.contextPath}/home" class="btn btn-info btn-lg green"><spring:message code="text.accessDenied.home" /></a>
      
    </p>
</div>
</div>