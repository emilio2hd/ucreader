<div class="form-group ${hasErrors(bean: casoDeUsoInstance.fluxoPrincipal, field: 'codigo', 'has-error')}">
    <label for="fluxoPrincipal.codigo" class="col-sm-2 control-label">
        <g:message code="casoDeUso.fluxo.codigo.label" default="Pre Condicoes" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:hiddenField name="fluxoPrincipal.id" value="${casoDeUsoInstance?.fluxoPrincipal?.id}"/>
        <g:textField name="fluxoPrincipal.codigo" class="form-control"
                     value="${casoDeUsoInstance?.fluxoPrincipal?.codigo}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: casoDeUsoInstance.fluxoPrincipal, field: 'codigo', 'has-error')}">
    <label for="fluxoPrincipal.codigo" class="col-sm-2 control-label">
        <g:message code="casoDeUso.fluxoPrincipal.descricao.label" default="Pre Condicoes" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="fluxoPrincipal.descricao" class="form-control editorComTabela" rows="5"
                    value="${casoDeUsoInstance?.fluxoPrincipal?.descricao}"/>
    </div>
</div>