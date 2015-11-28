$(document).ready(function() {
	
	$('.answer-box').hide();
	toggle = 0;
	
	$('.answer-button').on('click', function(event) {
		if(toggle==0) {
			toggle = 1;
			$('.answer-box').show();
		}
		else {
			toggle = 0;
			$('.answer-box').hide();
		}
	})
})