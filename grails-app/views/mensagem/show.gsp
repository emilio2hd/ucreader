<%@ page import="leitorcasouso.Mensagem" %>

<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.show.label" args="[entityName]" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <g:link action="list">
                                <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                        <li>
                            <g:link action="create">
                                <g:message code="default.new.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
		<div id="show-mensagem" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mensagem">
			
				<g:if test="${mensagemInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="mensagem.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${mensagemInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensagemInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="mensagem.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${mensagemInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
			</ol>
            <g:form class="form-horizontal">
                <g:hiddenField name="id" value="${mensagemInstance?.id}" />
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:link class="btn btn-default" action="edit" id="${mensagemInstance?.id}">
                            <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <g:actionSubmit class="btn btn-danger" action="delete"
                                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message'                                        , default: 'Are you sure?')}');" />
                    </div>
                </div>
			</g:form>
		</div>
	</body>
</html>
