<%@ page import="leitorcasouso.RegraNegocio" %>

<div class="form-group ${hasErrors(bean: regraNegocioInstance, field: 'codigo', 'error')} required">
    <label for="codigo" class="col-sm-2 control-label">
        <g:message code="regraNegocio.codigo.label" default="Código" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="codigo" class="form-control" value="${regraNegocioInstance?.codigo}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: regraNegocioInstance, field: 'titulo', 'error')} required">
    <label for="titulo" class="col-sm-2 control-label">
        <g:message code="regraNegocio.titulo.label" default="Titulo" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="titulo" class="form-control" value="${regraNegocioInstance?.titulo}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: regraNegocioInstance, field: 'descricao', 'error')} required">
    <label for="titulo" class="col-sm-2 control-label">
        <g:message code="regraNegocio.descricao.label" default="Descricao" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="descricao" class="form-control" rows="5" value="${regraNegocioInstance?.descricao}"/>
    </div>
</div>

%{--<div class="form-group ${hasErrors(bean: regraNegocioInstance, field: 'mensagens', 'error')} required">
    <label for="titulo" class="col-sm-2 control-label">
        <g:message code="regraNegocio.mensagens.label" default="Mensagens" />
    </label>
    <div class="col-sm-10">
        <g:select name="mensagens" class="form-control many-to-many" from="${leitorcasouso.Mensagem.list()}" multiple="multiple"
                  optionKey="id" optionValue="codigo" size="5" noSelection="['': '']"
                  value="${regraNegocioInstance?.mensagens*.id}"/>
    </div>
</div>--}%

%{--
<div class="form-group ${hasErrors(bean: regraNegocioInstance, field: 'casoDeUso', 'error')} required">
    <label for="titulo" class="col-sm-2 control-label">
        <g:message code="regraNegocio.casoDeUso.label" default="Caso De Uso" />
    </label>
    <div class="col-sm-10">
        <g:select id="casoDeUso" name="casoDeUso.id" class="form-control many-to-one" from="${leitorcasouso.CasoDeUso.list()}"
                  optionKey="id" value="${regraNegocioInstance?.casoDeUso?.id}" noSelection="['null': '']"/>
    </div>
</div>--}%
