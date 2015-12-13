tinymce.PluginManager.add('pesquisaregranegocio', function(editor, url) {
    // Add a button that opens a window
    editor.addButton('pesquisaregranegocio', {
        text: 'Incluir Regra',
        icon: false,
        onclick: function() {
            // Open window
            editor.windowManager.open({
                title: 'Nova Regra',
                body: [
                    {type: 'textbox', name: 'codigo', label: 'Código'}
                ],
                onsubmit: function(e) {
                    editor.insertContent('[r(' + e.data.codigo + ')]' );
                }
            });
        }
    });

    // Adds a menu item to the tools menu
    editor.addMenuItem('pesquisaregranegocio', {
        text: 'Selecionar Regra',
        context: 'tools',
        onclick: function() {
            editor.windowManager.open({
                title: 'Pesquisar Regra de Negócio',
                url: editor.settings.url_regra_negocio,
                height: 400,
                width: 765,
                buttons: [{text: 'Fechar', onclick: 'close'}]
            });
        }
    });
});