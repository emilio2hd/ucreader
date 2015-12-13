<div class="form-group">
    <label for="${propriedade}[{linha}].codigo" class="col-sm-2 control-label">
        <g:message code="casoDeUso.fluxo.codigo.label" default="Código" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-9">
        <g:hiddenField name="${propriedade}[{linha}].id" />
        <g:textField name="${propriedade}[{linha}].codigo" class="form-control" />
    </div>
    <div class="col-sm-1">
        <a class="delrow btn btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Remover"
           href="javascript:void(0);">
            <i class="glyphicon glyphicon-trash"></i>
        </a>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-12">
        <g:textArea name="${propriedade}[{linha}].descricao" class="form-control editorNormal" rows="5" />
    </div>
</div>