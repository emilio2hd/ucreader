<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">
        ${regraNegocioInstance.codigo}
        -
        ${regraNegocioInstance.titulo}
    </h4>
</div>
<div class="modal-body">
    <compilador:compileMensagem descricao="${regraNegocioInstance.descricao}"
                                mensagens="${regraNegocioInstance?.mensagens}" />
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>