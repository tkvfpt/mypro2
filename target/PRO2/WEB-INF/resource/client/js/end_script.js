$(document).ready(
	function() {

		// send delete modal
		$('#deleteModal').on(
				'show.bs.modal',
				function(e) {
					$(this).find('.btn-ok').attr('href',
							$(e.relatedTarget).data('href'));
				});
		// send multiple delete modal
		$('#deleteMultipleSubmit').click(
				function() {
//					alert('123');
					var input = $('<input>').attr('type', 'hidden').attr(
							'name', 'btnDelete').val('btnDelete');
					$('#listForm').append($(input));
					$('#listForm').submit();
				});

		$("#index-alert").delay(2000).fadeOut();

	})