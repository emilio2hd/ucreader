<%@ page import="leitorcasouso.CasoDeUso" %>

<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'nome', 'has-error')}">
    <label for="nome" class="col-sm-2 control-label">
        <g:message code="casoDeUso.nome.label" default="Nome" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="nome" class="form-control" value="${casoDeUsoInstance?.nome}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'descricao', 'has-error')}">
    <label for="descricao" class="col-sm-2 control-label">
        <g:message code="casoDeUso.descricao.label" default="Descricao" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textArea name="descricao" class="form-control">${casoDeUsoInstance?.descricao}</g:textArea>
    </div>
</div>

<div class="form-group ${hasErrors(bean: casoDeUsoInstance, field: 'descricao', 'has-error')}">
    <div class="col-sm-10 col-sm-offset-2">
        <div class="panel panel-default">
            <div class="panel-body">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active">
                        <a href="#prePosCondicoes" data-toggle="tab">
                            <g:message code="casoDeUso.prePosCondicoes.label" default="Pre/Pos Condições" />
                        </a>
                    </li>
                    <li>
                        <a href="#fluxoBasico" data-toggle="tab">
                            <g:message code="casoDeUso.fluxoBasico.label" default="Fluxo Básico" />
                        </a>
                    </li>
                    <li>
                        <a href="#fluxosAlternativo" data-toggle="tab">
                            <g:message code="casoDeUso.fluxosAlternativos.label" default="Fluxos Alternativos" />
                        </a>
                    </li>
                    <li>
                        <a href="#fluxosExcecao" data-toggle="tab">
                            <g:message code="casoDeUso.fluxosExcecao.label" default="Fluxos Exceção" />
                        </a>
                    </li>
                    <li>
                        <a href="#listaInformacoes" data-toggle="tab">
                            <g:message code="casoDeUso.listaInformacoes.label" default="Lista de Informações" />
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="prePosCondicoes"><g:render template="prePosCondicoes" /></div>
                    <div class="tab-pane" id="fluxoBasico"><g:render template="fluxoBasico" /></div>
                    <div class="tab-pane" id="fluxosAlternativo"><g:render template="fluxosAlternativos" /></div>
                    <div class="tab-pane" id="fluxosExcecao"><g:render template="fluxosExcecao" /></div>
                    <div class="tab-pane" id="listaInformacoes"><g:render template="listaInformacoes" /></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#myTab a:first').tab('show')
    })
</script>