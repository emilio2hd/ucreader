<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        <button type="button" class="btn btn-default" onclick="return fecharFiltro('${containerId}');">
            <i class="glyphicon glyphicon-remove"></i>
            ${cancelText}
        </button>

        <button type="button" class="btn btn-default" onclick="return grailsFilterPane.clearFilterPane('${formName}');">
            <i class="glyphicon glyphicon-refresh"></i>
            ${clearText}
        </button>

        <button type="submit" class="btn btn-default" name="_action_${action}">
            <i class="glyphicon glyphicon-ok"></i>
            ${applyText}
        </button>
    </div>
</div>