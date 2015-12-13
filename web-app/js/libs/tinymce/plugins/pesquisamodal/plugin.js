tinymce.PluginManager.add('pesquisamodal', function(editor, url) {
    // Add a button that opens a window
    editor.addButton('pesquisamodal', {
        text: 'Incluir Mensagem',
        icon: false,
        onclick: function() {
            // Open window
            editor.windowManager.open({
                title: 'Nova Mensagem',
                body: [
                    {type: 'textbox', name: 'codigo', label: 'Código'}
                ],
                onsubmit: function(e) {
                    editor.insertContent('[m(' + e.data.codigo + ')]' );
                }
            });
        }
    });

    // Adds a menu item to the tools menu
    editor.addMenuItem('pesquisamodal', {
        text: 'Selecionar Mensagen',
        context: 'tools',
        onclick: function() {
            editor.windowManager.open({
                title: 'Pesquisar Mensagem',
                url: editor.settings.url_mensagens,
                height: 400,
                width: 765,
                buttons: [{
                    text: 'Fechar',
                    onclick: 'close'
                }]
            }/*, {
                arg1: 42,
                arg2: "Hello world"
            }*/);
        }
    });
});