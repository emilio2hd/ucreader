<label class="col-sm-2 control-label">${fieldLabel}</label>
<div class="col-sm-10">
    <div class="row">
        <div class="col-xs-4">
            <g:select id="${opName}"
                      name="${opName}"
                      from="${opKeys}"
                      keys="${opKeys}"
                      value="${opValue}"
                      valueMessagePrefix="fp.op"
                      class="form-control"
                      onChange="grailsFilterPane.filterOpChange('${opName}', '${ctrlAttrs.id}');" />
        </div>
        <div class="col-xs-8">
            <filterpane:input ctrlType="${ctrlType}" ctrlAttrs="${ctrlAttrs + [class: 'form-control']}" />

            <g:if test="${toCtrlAttrs != null}">
                <span style="${toCtrlSpanStyle}" id="between-span-${toCtrlAttrs.id}">
                    &nbsp;<g:message code="fp.tag.filterPane.property.betweenValueSeparatorText" default="and" />&nbsp;
                    <filterpane:input ctrlType="${ctrlType}" ctrlAttrs="${toCtrlAttrs}" />
                </span>
            </g:if>
        </div>
        %{--<div class="col-xs-4">
            <input type="text" class="form-control" placeholder=".col-xs-4">
        </div>--}%
    </div>
</div>