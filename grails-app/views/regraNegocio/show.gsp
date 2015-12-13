
<%@ page import="leitorcasouso.RegraNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'regraNegocio.label', default: 'RegraNegocio')}" />
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
		<div id="show-regraNegocio" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<dl class="property-list regraNegocio">
				<g:if test="${regraNegocioInstance?.titulo}">
                    <dt class="fieldcontain">
                        <span class="property-value" aria-labelledby="titulo-label">
                            <g:fieldValue bean="${regraNegocioInstance}" field="codigo"/>
                            -
                            <g:fieldValue bean="${regraNegocioInstance}" field="titulo"/>
                        </span>
                    </dt>
				</g:if>

                %{--<button type="button" class="btn btn-default bt-popover" data-container="body" data-toggle="popover"
                        data-placement="top"
                        data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                    Popover on left
                </button>--}%

				<g:if test="${regraNegocioInstance?.descricao}">
				<dh class="fieldcontain">
                    <span class="property-value" aria-labelledby="descricao-label">
                        <compilador:compileMensagem descricao="${regraNegocioInstance.descricao}"
                                                 mensagens="${regraNegocioInstance?.mensagens}" />
                    </span>
				</dh>
				</g:if>
			
				%{--<g:if test="${regraNegocioInstance?.casoDeUso}">
				<li class="fieldcontain">
					<span id="casoDeUso-label" class="property-label"><g:message code="regraNegocio.casoDeUso.label" default="Caso De Uso" /></span>
					
						<span class="property-value" aria-labelledby="casoDeUso-label"><g:link controller="casoDeUso" action="show" id="${regraNegocioInstance?.casoDeUso?.id}">${regraNegocioInstance?.casoDeUso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>--}%
			
			</dl>
            <g:form class="form-horizontal">
                <g:hiddenField name="id" value="${regraNegocioInstance?.id}" />
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:link class="btn btn-default" action="edit" id="${regraNegocioInstance?.id}">
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
