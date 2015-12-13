modules = {
    application {
        resource url:'js/application.js'
        //resource url:'js/libs/jquery.cookie.js'
    }

    funcoes {
        resource url:'js/funcoes.js', disposition:'head'
    }

    editable {
        dependsOn 'jquery'
        resource  url: 'js/libs/jquery.edittable.js'
        resource  url: 'css/jquery.edittable.css'
    }

    tinymce {
        resource  url: 'js/libs/tinymce/tinymce.min.js'
        resource  url: 'js/libs/tinymce/themes/modern/theme.min.js'
        resource  url: 'js/libs/tinymce/plugins/table/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/advlist/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/lists/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/autolink/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/preview/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/image/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/anchor/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/link/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/code/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/media/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/searchreplace/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/charmap/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/paste/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/fullscreen/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/visualblocks/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/contextmenu/plugin.min.js'
        resource  url: 'js/libs/tinymce/plugins/pesquisamodal/plugin.js'
        resource  url: 'js/libs/tinymce/plugins/pesquisaregranegocio/plugin.js'
    }

    bootstrap {
        dependsOn 'jquery', 'application', 'filterpane'
        resource url:'css/bootstrap.css', disposition:'head'
        resource url:'css/dashboard.css', disposition:'head'
        resource url:'js/libs/bootstrap.js', disposition:'head'
        resource url:'css/font-awesome.min.css', disposition:'head'
    }
}