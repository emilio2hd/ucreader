<%@ page import="org.grails.plugin.filterpane.FilterPaneUtils; leitorcasouso.CasoDeUso" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'casoDeUso.label', default: 'CasoDeUso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.list.label" args="[entityName]" />
                    </a>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
		<div id="list-casoDeUso" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="panel panel-default">
                <g:form action="filter" class="form-horizontal" name="filterPaneForm">
                    <div class="panel-body">
                        <filterpane:currentCriteria domainBean="CasoDeUso" removeImgDir="images"
                                                    removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no"
                        />
                        <g:if test="${!FilterPaneUtils.isFilterApplied(params)}">
                            <div id="filtroRapido" class="form-group">
                                <label class="col-sm-2 control-label">Busca Rápida</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <g:textField name="query" class="form-control" value="${params?.query}" />
                                        <span class="input-group-btn">
                                            <a href="${g.createLink(action: 'filter')}" class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-trash"></i>
                                                Limpar
                                            </a>
                                            <button class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-search"></i>
                                                Procurar
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </g:if>
                        <filterpane:filterPane domain="leitorcasouso.CasoDeUso"
                                               customForm="true"
                                               visible="n"
                                               showSortPanel="n"
                                               showTitle="n"
                                               associatedProperties="regrasNegocio.codigo, mensagens.codigo, fluxosAlternativos.codigo, fluxosExcecao.codigo"
                                               fullAssociationPathFieldNames="false" />
                    </div>
                    <div class="panel-footer">
                        <filterpane:filterButton class="btn btn-default" />
                        <g:link class="btn btn-default" action="create">
                            <g:message code="default.new.label" args="[entityName]" />
                        </g:link>
                    </div>
                </g:form>
            </div>
			<table class="table table-striped">
				<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'casoDeUso.nome.label', default: 'Nome')}" />
                        <th width="5%"></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${casoDeUsoInstanceList}" status="i" var="casoDeUsoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${casoDeUsoInstance.id}">${fieldValue(bean: casoDeUsoInstance, field: "nome")}</g:link></td>
                        <td>
                            <g:link action="edit" id="${casoDeUsoInstance.id}">
                                editar
                            </g:link>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${casoDeUsoInstanceTotal}" />
			</div>
            <script>
                function abraFiltro(filter){
                    if($('#filtroRapido').is(':visible') === false){
                        $('#filtroRapido').show()
                    }else{
                        $('#filtroRapido').hide()
                    }
                    grailsFilterPane.toggleElement(filter);
                }

                function fecharFiltro(filter){
                    $('#filtroRapido').show()
                    grailsFilterPane.toggleElement(filter);
                }
            </script>
		</div>
	</body>
</html>
