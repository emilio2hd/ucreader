<%@ page import="org.grails.plugin.filterpane.FilterPaneUtils; leitorcasouso.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require module="filterpane" />
	</head>
	<body>
        <nav class="action-bar navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header pull-left">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.list.label" args="[entityName]" />
                    </a>
                </div>
            </div>
        </nav>
		<div id="list-mensagem" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="panel panel-default">
                <g:form action="filter" class="form-horizontal" name="filterPaneForm">
                    <div class="panel-body">
                        <filterpane:currentCriteria domainBean="Mensagem" dateFormat="${[title: 'MM/dd/yyyy', releaseDate: 'MMM dd, yyyy']}"
                                                    removeImgDir="images" removeImgFile="bullet_delete.png" fullAssociationPathFieldNames="no"
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
                        <filterpane:filterPane domain="leitorcasouso.Mensagem"
                                               customForm="true"
                                               visible="n"
                                               showSortPanel="n"
                                               showTitle="n"
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
                    <g:sortableColumn property="codigo" params="${filterParams}" title="${message(code: 'mensagem.codigo.label', default: 'Codigo')}" />
                    <g:sortableColumn property="descricao" params="${filterParams}" title="${message(code: 'mensagem.descricao.label', default: 'Descricao')}" />
                    <th width="5%"></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${mensagemInstanceList}" status="i" var="mensagemInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>
                            <g:link data-tinymce="${mensagemInstance.codigo}" action="show"
                                    id="${mensagemInstance.id}">
                                ${fieldValue(bean: mensagemInstance, field: "codigo")}
                            </g:link>
                        </td>
                        <td>${fieldValue(bean: mensagemInstance, field: "descricao")}</td>
                        <td>
                            <g:link action="edit" id="${mensagemInstance.id}">editar</g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${mensagemInstanceTotal}" params="${filterParams}" />
            </div>
		</div>
        <script>
            $(function() {
                if(top.tinymce){
                    $('a[data-tinymce]').each(function(){
                        var $link = $(this)
                        $link.click(function(){
                            top.tinymce.activeEditor.execCommand( 'mceInsertContent', false
                                    , '[m('+$link.attr('data-tinymce')+')]' );
                            top.tinymce.activeEditor.windowManager.close();
                        }).attr('href', 'javascript:void(0)').attr('title', 'Clique para selecionar a mensagem')
                    })
                }
            });
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
