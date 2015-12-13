<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <r:require module="bootstrap"/>
    <g:layoutHead/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <g:javascript library="funcoes"/>
    <r:layoutResources />
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">UC Reader</a>
        </div>
        <div class="navbar-collapse collapse">
            %{--<ul class="nav navbar-nav navbar-left">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>--}%
            <g:form class="navbar-form navbar-right" method="get" controller="busca">
                <g:textField name="query" class="form-control" placeholder="Pesquisar..." />
            </g:form>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                %{--<li class="active"><a href="#">Overview</a></li>--}%
                <li><g:link uri="/"><g:message code="default.home.label" default="Principal" /></g:link></li>
                <li>
                    <g:link controller="casoDeUso" action="list">
                        <g:message code="casoDeUso.label" default="Caso de Uso" />
                    </g:link>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li>
                    <g:link controller="mensagem" action="list">
                        <g:message code="mensagem.label" default="Mensagem" />
                    </g:link>
                </li>
                <li>
                    <g:link controller="regraNegocio" action="list">
                        <g:message code="regraNegocio.label" default="Regras de Negócio" />
                    </g:link>
                </li>
            </ul>

            %{--<ul class="nav nav-sidebar">
                <li><a href="">Nav item</a></li>
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
                <li><a href="">More navigation</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
            </ul>--}%
        </div>
        <div class="col-xs-12 col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <g:layoutBody />
            <!-- Modal -->
            <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
