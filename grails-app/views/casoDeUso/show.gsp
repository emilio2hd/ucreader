
<%@ page import="leitorcasouso.CasoDeUso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'casoDeUso.label', default: 'CasoDeUso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            #menuAcaoSuspenso > .dropdown-menu {
                position: static;
                display: block;
                margin-bottom: 5px;
            }

            #tituloSuspendo{
                position: fixed;
                top: 51px;
            }

            #tituloSuspendo > .navbar{
                border-radius: 0px 0px 4px 4px;
            }
        </style>
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
		<div id="show-casoDeUso" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <dl class="property-list casoDeUso">
                <dh class="fieldcontain">
                    <span class="ancora" id="Topo"></span>
                    <span class="property-value" aria-labelledby="titulo-label">
                        <h3><g:fieldValue bean="${casoDeUsoInstance}" field="nome"/></h3>
                        <g:fieldValue bean="${casoDeUsoInstance}" field="descricao"/>
                    </span>
                </dh>
                <dh class="fieldcontain">
                    <h3><g:message code="casoDeUso.preCondicoes.label" default="Pre Condições" /></h3>
                    <span class="property-value" aria-labelledby="titulo-label">
                        ${casoDeUsoInstance.preCondicoes}
                    </span>
                </dh>
                <dh class="fieldcontain">
                    <h3><g:message code="casoDeUso.posCondicoes.label" default="Pós Condições" /></h3>
                    <span class="property-value" aria-labelledby="titulo-label">
                        ${casoDeUsoInstance.posCondicoes}
                    </span>
                </dh>
                <dh class="fieldcontain">
                    <h3>
                        <g:message code="casoDeUso.fluxoBasico.label" default="Fluxo Basico" />
                        -
                        ${casoDeUsoInstance.fluxoPrincipal.codigo}
                    </h3>
                    <span class="property-value" aria-labelledby="titulo-label">
                        <compilador:compileFluxo casoUso="${casoDeUsoInstance}" fluxo="${casoDeUsoInstance.fluxoPrincipal}" />
                    </span>
                </dh>
                <dh class="fieldcontain">
                    <h3><g:message code="casoDeUso.fluxosAlternativos.label" default="Fluxos Alternativos" /></h3>
                    <g:each in="${casoDeUsoInstance.fluxosAlternativos}" var="fluxoAlternativo">
                        <span class="ancora" id="${fluxoAlternativo.codigo}"></span>
                        <h4>${fluxoAlternativo.codigo}</h4>
                        <compilador:compileFluxo casoUso="${casoDeUsoInstance}" fluxo="${fluxoAlternativo}" />
                    </g:each>
                </dh>
                <dh class="fieldcontain">
                    <h3><g:message code="casoDeUso.fluxosExcecao.label" default="Fluxos Excecao" /></h3>
                    <g:each in="${casoDeUsoInstance.fluxosExcecao}" var="fluxoExcecao">
                        <span class="ancora" id="${fluxoExcecao.codigo}"></span>
                        <h4>${fluxoExcecao.codigo}</h4>
                        <compilador:compileFluxo casoUso="${casoDeUsoInstance}" fluxo="${fluxoExcecao}" />
                    </g:each>
                </dh>
                <dh class="fieldcontain">
                    <h3><g:message code="casoDeUso.listaInformacoes.label" default="Lista Informacoes" /></h3>
                    ${casoDeUsoInstance.informacoes}
                </dh>
            </dl>
            <span class="ancora" id="Final"></span>
			<g:form class="form-horizontal">
                <g:hiddenField name="id" value="${casoDeUsoInstance?.id}" />
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:link class="btn btn-default" action="edit" id="${casoDeUsoInstance?.id}">
                            <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <g:actionSubmit class="btn btn-danger" action="delete"
                                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message'
                                                , default: 'Are you sure?')}');" />
                    </div>
                    <div id="tituloSuspendo" class="col-sm-9">
                        <nav class="navbar navbar-default" role="navigation">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <a class="navbar-brand" href="#">
                                        <g:fieldValue bean="${casoDeUsoInstance}" field="nome"/>
                                    </a>
                                </div>
                                <div class="navbar-right">
                                    <div class="btn-group">
                                        <g:link class="btn btn-primary navbar-btn" action="edit" id="${casoDeUsoInstance?.id}">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            <g:message code="default.button.edit.label" default="Edit" />
                                        </g:link>
                                        <a class="btn btn-danger navbar-btn" href="javascript:remove();">
                                            <i class="glyphicon glyphicon-trash"></i>
                                            Remover
                                        </a>
                                    </div>

                                    <div class="btn-group">
                                        <a data-toggle="tooltip" data-placement="bottom" title="Ir para Topo"
                                                class="btn btn-default navbar-btn" href="#Topo">
                                            <i class="glyphicon glyphicon-chevron-up"></i>
                                        </a>
                                        <a data-toggle="tooltip" data-placement="bottom" title="Ir para Final"
                                                class="btn btn-default navbar-btn" href="#Final">
                                            <i class="glyphicon glyphicon-chevron-down"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
			</g:form>
		</div>
        <script>
            $(document).ready(function () {
                menuSuspenso();
            });

            $(window).scroll(function () {
                menuSuspenso();
            });

            function menuSuspenso() {
                ($(document).scrollTop() > 100) ? $('#tituloSuspendo').fadeIn() : $('#tituloSuspendo').fadeOut();
            }

            function remove(){
                $('input[name="_action_delete"]').click()
            }
            function scroll() {
                window.scrollTo(0, 0)
            }
        </script>
	</body>
</html>
