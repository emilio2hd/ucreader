<%@ page import="org.grails.plugin.filterpane.FilterPaneUtils; leitorcasouso.CasoDeUso" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'casoDeUso.label', default: 'CasoDeUso')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div id="list-casoDeUso" class="content scaffold-list" role="main">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Acesso Rápido</div>
                <div class="panel-body">
                    <div class="bs-glyphicons">
                        <ul class="bs-glyphicons-list">
                            <li>
                                <g:link controller="mensagem">
                                    <span class="glyphicon glyphicon-asterisk"></span>
                                    <span class="glyphicon-class">Mensagens</span>
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="regraNegocio">
                                    <span class="glyphicon glyphicon-plus"></span>
                                    <span class="glyphicon-class">Regras de Negócio</span>
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="casoDeUso">
                                    <span class="glyphicon glyphicon-plus"></span>
                                    <span class="glyphicon-class">Caso de Uso</span>
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Últimos Casos de Uso</div>
                <div class="panel-body">
                    <table class="table table-striped table-condensed" style="margin-bottom: 0px">
                        <tbody>
                            <tr><td>Teste</td></tr>
                            <tr><td>Teste</td></tr>
                            <tr><td>Teste</td></tr>
                            <tr><td>Teste</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>