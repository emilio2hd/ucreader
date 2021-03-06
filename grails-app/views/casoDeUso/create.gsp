<%@ page import="leitorcasouso.CasoDeUso" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'casoDeUso.label', default: 'CasoDeUso')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript library="tinymce"/>
	</head>
	<body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.create.label" args="[entityName]" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <g:link class="create" action="list">
                                <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
		<div id="create-casoDeUso" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${casoDeUsoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${casoDeUsoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="save" class="form-horizontal">
                <g:render template="form"/>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:submitButton name="create" class="btn btn-default"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>
			</g:form>
		</div>
        <script type="text/javascript">
            function carregaTinymceRegraNegocio(){
                tinymce.init({
                    skin_url: '<g:resource dir="js/libs/tinymce/skins/lightgray" absolute="true" />',
                    selector: 'textarea.editorNormal',
                    plugins: [
                        "advlist autolink lists link image charmap preview anchor",
                        "searchreplace code fullscreen",
                        "media table contextmenu paste",
                        "pesquisaregranegocio pesquisamodal"
                    ],
                    toolbar: [
                        "undo redo | styleselect | bold italic | link image | alignleft aligncenter alignright " +
                                "alignjustify bullist numlist outdent indent pesquisaregranegocio pesquisamodal anchor"
                    ],
                    url_regra_negocio: '${g.createLink(controller: 'regraNegocio', action: 'list')}',
                    url_mensagens: '${g.createLink(controller: 'mensagem', action: 'list')}'
                });
            }

            $(function(){
                carregaTinymceRegraNegocio();

                tinymce.init({
                    skin_url: '<g:resource dir="js/libs/tinymce/skins/lightgray" absolute="true" />',
                    selector: 'textarea.editorComTabela',
                    plugins: 'table',
                    toolbar: [
                        "undo redo | styleselect | bold italic | link image | alignleft aligncenter alignright " +
                                "alignjustify bullist numlist outdent indent pesquisaregranegocio"
                    ],
                    url_regra_negocio: '${g.createLink(controller: 'regraNegocio', action: 'list')}'
                });
            })
        </script>
	</body>
</html>
