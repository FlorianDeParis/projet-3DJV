// script permettant de synchroniser les colonnes de l'accueil

(function($){
	$(document).ready(function(){
		var mainbox2 = $('#main-box-2').height();
		var mainbox3 = $('#main-box-3').height();

		if(mainbox2 > mainbox3){

			//$('#main-box-3').style('height', mainbox2);
			document.getElementById('main-box-3').style.height = mainbox2+'px';
		}
		else if(mainbox2 < mainbox3){
			//$('#main-box-2').style('height', mainbox3);
			document.getElementById('main-box-2').style.height = mainbox3+'px';
		}
	});
})(jQuery);

