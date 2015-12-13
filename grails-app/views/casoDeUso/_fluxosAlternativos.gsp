<%@ page import="org.springframework.web.util.JavaScriptUtils" %>
<div id="listaFluxosAlternativos">
    <a class="addrow btn btn-primary btn-xs" href="javascript:void(0);">
        <i class="glyphicon glyphicon-plus"></i>
        <g:message code="default.new.label" args="['Fluxo Alternativo']" />
    </a>
<g:each in="${casoDeUsoInstance?.fluxosAlternativos}" var="fluxoAlternativo" status="i">
    <div class="fluxo-alternativo">
        <div class="form-group ${hasErrors(bean: fluxoAlternativo, field: 'codigo', 'error')}">
            <label for="fluxosAlternativos[${i}].codigo" class="col-sm-2 control-label">
                <g:message code="casoDeUso.fluxo.codigo.label" default="Código" />
                <span class="required-indicator">*</span>
            </label>
            <div class="col-sm-9">
                <g:hiddenField name="fluxosAlternativos[${i}].id" value="${fluxoAlternativo?.id}"/>
                <g:textField name="fluxosAlternativos[${i}].codigo" class="form-control"
                             value="${fluxoAlternativo?.codigo}"/>
            </div>
            <div class="col-sm-1">
                <a class="delrow btn btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Remover"
                   href="javascript:void(0);">
                    <i class="glyphicon glyphicon-trash"></i>
                </a>
            </div>
        </div>
        <div class="form-group ${hasErrors(bean: fluxoAlternativo, field: 'codigo', 'error')}">
            <div class="col-sm-12">
                <g:textArea name="fluxosAlternativos[${i}].descricao" class="form-control editorNormal" rows="5"
                            value="${fluxoAlternativo?.descricao}"/>
            </div>
        </div>
    </div>
</g:each>
</div>
<script>
    var linhasFluxosAlternativos = ${casoDeUsoInstance?.fluxosAlternativos ? casoDeUsoInstance?.fluxosAlternativos?.size() : 0};

    $('#listaFluxosAlternativos').on('click', '.delrow', function () {
        $('*[data-toggle="tooltip"]').tooltip('hide');
        $(this).closest('div.fluxo-alternativo').remove()
    }).on('click', '.addrow', function () {
        $('#listaFluxosAlternativos').append(buildLinhaFluxoAlternativo())
        carregaTinymceRegraNegocio()
        $('*[data-toggle="tooltip"]').tooltip({container: 'body'})
    })

    function buildLinhaFluxoAlternativo(){
        var linha = '${JavaScriptUtils.javaScriptEscape(g.render(template: "linhaFluxo",
            model: [propriedade: 'fluxosAlternativos']).toString())}'
        var div = $('<div />', { class: 'fluxo-alternativo', html: linha.replace(/\{linha\}/g, linhasFluxosAlternativos) })

        linhasFluxosAlternativos++

        return div
    }
</script>