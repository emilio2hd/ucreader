<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'preCondicoes', 'has-error')}">
    <label for="preCondicoes" class="col-sm-2 control-label">
        <g:message code="casoDeUso.preCondicoes.label" default="Pre Condicoes" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="preCondicoes" class="form-control editorNormal" rows="5" value="${casoDeUsoInstance?.preCondicoes}"/>
    </div>
</div>
<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'posCondicoes', 'has-error')}">
    <label for="posCondicoes" class="col-sm-2 control-label">
        <g:message code="casoDeUso.posCondicoes.label" default="Pos Condicoes" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="posCondicoes" class="form-control editorNormal" rows="5" value="${casoDeUsoInstance?.posCondicoes}"/>
    </div>
</div>