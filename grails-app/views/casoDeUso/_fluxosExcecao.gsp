<%@ page import="org.springframework.web.util.JavaScriptUtils" %>
<div id="listaFluxosExcecao">
    <a class="addrow btn btn-primary btn-xs" href="javascript:void(0);">
        <i class="glyphicon glyphicon-plus"></i>
        <g:message code="default.new.label" args="['Fluxo Exceção']" />
    </a>
    <g:each in="${casoDeUsoInstance?.fluxosExcecao}" var="fluxoExcecao" status="i">
        <div class="fluxo-excecao">
            <div class="form-group ${hasErrors(bean: fluxoExcecao, field: 'codigo', 'error')}">
                <label for="fluxosExcecao[${i}].codigo" class="col-sm-2 control-label">
                    <g:message code="casoDeUso.fluxo.codigo.label" default="Código" />
                    <span class="required-indicator">*</span>
                </label>
                <div class="col-sm-9">
                    <g:hiddenField name="fluxosExcecao[${i}].id" value="${fluxoExcecao?.id}"/>
                    <g:textField name="fluxosExcecao[${i}].codigo" class="form-control"
                                 value="${fluxoExcecao?.codigo}"/>
                </div>
                <div class="col-sm-1">
                    <a class="delrow btn btn-danger btn-xs" data-toggle="tooltip" data-placement="top" title="Remover"
                       href="javascript:void(0);">
                        <i class="glyphicon glyphicon-trash"></i>
                    </a>
                </div>
            </div>
            <div class="form-group ${hasErrors(bean: fluxoExcecao, field: 'codigo', 'error')}">
                <div class="col-sm-12">
                    <g:textArea name="fluxosExcecao[${i}].descricao" class="form-control editorNormal" rows="5"
                                value="${fluxoExcecao?.descricao}"/>
                </div>
            </div>
        </div>
    </g:each>
</div>
<script>
    var linhasFluxosExcecao = ${casoDeUsoInstance?.fluxosExcecao ? casoDeUsoInstance?.fluxosExcecao?.size() : 0}

    $('#listaFluxosExcecao').on('click', '.delrow', function () {
        $('*[data-toggle="tooltip"]').tooltip('hide')
        $(this).closest('div.fluxo-excecao').remove()
    }).on('click', '.addrow', function () {
        $('#listaFluxosExcecao').append(buildLinhaFluxoExcecao())
        carregaTinymceRegraNegocio()
        $('*[data-toggle="tooltip"]').tooltip({container: 'body'})
    })

    function buildLinhaFluxoExcecao(){
        var linha = '${JavaScriptUtils.javaScriptEscape(g.render(template: "linhaFluxo",
            model: [propriedade: 'fluxosExcecao']).toString())}'
        var div = $('<div />', { class: 'fluxo-excecao', html: linha.replace(/\{linha\}/g, linhasFluxosExcecao) })

        linhasFluxosExcecao++

        return div
    }
</script>