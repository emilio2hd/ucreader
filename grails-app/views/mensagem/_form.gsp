<%@ page import="leitorcasouso.Mensagem" %>

<div class="form-group ${hasErrors(bean: mensagemInstance, field: 'codigo', 'error')} required">
    <label for="codigo" class="col-sm-2 control-label">
        <g:message code="mensagem.codigo.label" default="Código" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="codigo" class="form-control" maxlength="255" required="" value="${mensagemInstance?.codigo}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: mensagemInstance, field: 'codigo', 'error')} required">
    <label for="descricao" class="col-sm-2 control-label">
        <g:message code="mensagem.descricao.label" default="Descricao" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="descricao" class="form-control" maxlength="255" required="" value="${mensagemInstance?.descricao}"/>
    </div>
</div>


