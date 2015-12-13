if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

$(function() {
    //$('*[data-toggle="popover"]').popover()
    $('*[data-toggle="tooltip"]').tooltip({container: 'body'})

    $('#modal').on('loaded.bs.modal', function (e) {
        $('#modal .modal-body *[data-toggle="tooltip"]').tooltip({container: $('#modal .modal-body')})
    })

    $('body').on('hidden.bs.modal', '.modal', function () {
        $(this).removeData('bs.modal');
        if(window.location.hash != undefined && window.location.hash != ""){
            document.location.href = document.location.href
        }
    })
})