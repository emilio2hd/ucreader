<%@ page import="leitorcasouso.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header pull-left">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.create.label" args="[entityName]" />
                    </a>
                </div>
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <g:link class="create" action="list" params="${params}">
                            <g:message code="default.list.label" args="[entityName]" />
                        </g:link>
                    </li>
                </ul>
            </div>
        </nav>
		<div id="create-mensagem" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${mensagemInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${mensagemInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            <g:form action="save" class="form-horizontal">
                <g:hiddenField name="ehModal" value="${params?.ehModal}"/>
                <g:render template="form"/>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:submitButton name="create" class="btn btn-default"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
			</g:form>
		</div>
	</body>
</html>
