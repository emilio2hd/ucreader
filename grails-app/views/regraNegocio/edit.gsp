<%@ page import="leitorcasouso.RegraNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'regraNegocio.label', default: 'RegraNegocio')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="tinymce"/>
	</head>
	<body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0);">
                        <g:message code="default.edit.label" args="[entityName]" />
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <g:link class="create" action="list">
                                <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                        <li>
                            <g:link class="create" action="create">
                                <g:message code="default.new.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
		<div id="edit-regraNegocio" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${regraNegocioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${regraNegocioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" class="form-horizontal" >
				<g:hiddenField name="id" value="${regraNegocioInstance?.id}" />
				<g:hiddenField name="version" value="${regraNegocioInstance?.version}" />
                <g:render template="form"/>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <g:actionSubmit class="btn btn-default" action="update"
                                        value="${message(code: 'default.button.update.label', default: 'Update')}" />

                        <g:actionSubmit class="btn btn-danger" action="delete"
                                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                        formnovalidate=""
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </div>
                </div>
			</g:form>
		</div>
        <script type="text/javascript">
            $(function(){
                tinymce.init({
                    skin_url: '<g:resource dir="js/libs/tinymce/skins/lightgray" absolute="true" />',
                    selector: 'textarea',
                    plugins: [
                        "advlist autolink lists link image charmap preview anchor",
                        "searchreplace code fullscreen",
                        "media table contextmenu paste",
                        "pesquisamodal"
                    ],
                    toolbar: [
                        "undo redo | styleselect | bold italic underline | link image | alignleft aligncenter alignright " +
                                "alignjustify bullist numlist outdent indent"
                    ],
                    url_mensagens: '${g.createLink(controller: 'mensagem', action: 'list')}'
                });
            })
        </script>
	</body>
</html>
