
<%@ page import="org.grails.plugin.filterpane.FilterPaneUtils; leitorcasouso.RegraNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'regraNegocio.label', default: 'RegraNegocio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <nav class="action-bar navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.list.label" args="[entityName]" />
                    </a>
                </div>
            </div>
        </nav>
		<div id="list-regraNegocio" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="panel panel-default">
                <g:form action="filter" class="form-horizontal" name="filterPaneForm">
                    <div class="panel-body">
                        <filterpane:currentCriteria domainBean="RegraNegocio" removeImgDir="images"
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
                        <filterpane:filterPane domain="leitorcasouso.RegraNegocio"
                                               customForm="true"
                                               visible="n"
                                               showSortPanel="n"
                                               showTitle="n"
                                               associatedProperties="mensagens.descricao, mensagens.codigo"
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
					
						<g:sortableColumn property="codigo" title="${message(code: 'regraNegocio.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'regraNegocio.titulo.label', default: 'Titulo')}" />
					
						%{--<g:sortableColumn property="descricao" title="${message(code: 'regraNegocio.descricao.label', default: 'Descricao')}" />--}%
					
						%{--<th><g:message code="regraNegocio.casoDeUso.label" default="Caso De Uso" /></th>--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regraNegocioInstanceList}" status="i" var="regraNegocioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
                            <g:link data-tinymce="${regraNegocioInstance.codigo}" action="show"
                                    id="${regraNegocioInstance.id}">
                                ${fieldValue(bean: regraNegocioInstance, field: "codigo")}
                            </g:link>
                        </td>
					
						<td>${fieldValue(bean: regraNegocioInstance, field: "titulo")}</td>
					
						%{--<td>${fieldValue(bean: regraNegocioInstance, field: "descricao")}</td>--}%
					
						%{--<td>${fieldValue(bean: regraNegocioInstance, field: "casoDeUso")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
                <g:paginate total="${regraNegocioInstanceTotal}" params="${filterParams}" />
			</div>
		</div>
        <script>
            $(function() {
                if(top.tinymce){
                    $('a[data-tinymce]').each(function(){
                        var $link = $(this)
                        $link.click(function(){
                            top.tinymce.activeEditor.execCommand( 'mceInsertContent', false
                                    , '[r('+$link.attr('data-tinymce')+')]' );
                            top.tinymce.activeEditor.windowManager.close();
                        }).attr('href', 'javascript:void(0)').attr('title', 'Clique para selecionar a regra')
                    })
                }
            })
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
	</body>
</html>
