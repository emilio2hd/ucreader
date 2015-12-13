<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'informacoes', 'has-error')}">
    <label for="informacoes" class="col-sm-2 control-label">
        <g:message code="casoDeUso.informacoes.label" default="Informacoes" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="informacoes" class="form-control editorComTabela" value="${casoDeUsoInstance?.informacoes}"/>
    </div>
</div>