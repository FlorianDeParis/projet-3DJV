var months = new Array(); var days = new Array(); var dateext = new Array();
months.push('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
days.push('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
dateext.push('st', 'nd', 'rd', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'st', 'nd', 'rd', 'th', 'th', 'th', 'th', 'th', 'th', 'th', 'st');
function dg(nr) {
     return (nr<10?'0':'') + nr;  
}

function getCurrentTime(){
	var curr = new Date();
	date = days[curr.getDay()];
	mm = months[curr.getMonth()];
	dd = curr.getDate()+dateext[curr.getDate()];
	hr = curr.getHours();
	mn = curr.getMinutes();
	sc = curr.getSeconds()+00;
	
	$('#timeDate').html(" "+date+', '+mm+' '+dd+' &ndash; '+dg(hr)+':'+dg(mn)+':'+dg(sc));
	setTimeout(getCurrentTime,1000);
}


function getRelated(){

	var relTotal = $('#relTotal');
	var rr = 0;
	var HTMLi = "";
	
	if(relTotal!=null){
		$('#related').attr('style','display:block;');
		for(r=0; r<relTotal.val(); r++){
			rr=r+1;
			var relTitle = $('#relTit'+rr).val();
			var relPermalink = $('#relPer'+rr).val();
			HTMLi+= "<li><a href='"+relPermalink+"'>";
			HTMLi+= relTitle;
			HTMLi+= "</a></li>" ;
		}
		$('#box-related').html(HTMLi);
	}
}






var prevId = 0;


function setupTabs() {
	if($('#TABS') != null){
		for(i=1; i<3; i++){
			if(i==1){
				$('#tabsButton'+i).removeClass();
				$('#tabsButton'+i).addClass('TABon');
				$('#tabsContent'+i).attr('style','display:block;');
			} else {
				$('#tabsButton'+i).removeClass();
				$('#tabsButton'+i).addClass('TABoff');
				$('#tabsContent'+i).attr('style','display:none;');
			}
		}
	}
}

var currentTab=1;
var isAnimating=false;

function setTabs(TAB){
	if(isAnimating==false && currentTab!=TAB){
		isAnimating=true;
		for(i=1; i<3; i++){
			if(i==TAB){
				$('#tabsButton'+i).removeClass();
				$('#tabsButton'+i).addClass('TABon');
			} else {
				$('#tabsButton'+i).removeClass();
				$('#tabsButton'+i).addClass('TABoff');
			}
		}
		$("#tabsContent"+currentTab).fadeOut(100, function(){
			$("#tabsContent"+TAB).fadeIn(400, function(){
				isAnimating=false;
			});
		});
		currentTab=TAB;
		return false;
	}
}


function sendmail(url){
	var mailquery = url+'&nm='+$('#con_name').val()+'&em='+$('#con_email').val()+'&sbj='+$('#con_subject').val()+'&msg='+$('#con_message').val()+'&sending=1';
	window.location = mailquery;
}