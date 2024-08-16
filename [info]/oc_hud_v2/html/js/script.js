// Draggable elements
$(function(){
   setTimeout(function(){
     $('#ui').show();
   },5000);
});
$(function() {
  $('#healthdiv').draggable({
    drag: function(event, ui){
      dragpositionHealthdivTop = ui.position.top;
      dragpositionHealthdivLeft = ui.position.left;
      localStorage.setItem("healthdivTop", dragpositionHealthdivTop);
      localStorage.setItem("healthdivLeft", dragpositionHealthdivLeft);
    }
  });
  });
  $('#walletdiv').draggable({
    drag: function(event, ui){
      dragpositionwalletdivTop = ui.position.top;
      dragpositionwalletdivLeft = ui.position.left;
      localStorage.setItem("walletdivTop", dragpositionwalletdivTop);
      localStorage.setItem("walletdivLeft", dragpositionwalletdivLeft);
    }
  });

  $('#bankdiv').draggable({
    drag: function(event, ui){
      dragpositionbankdivTop = ui.position.top;
      dragpositionbankdivLeft = ui.position.left;
      localStorage.setItem("bankdivTop", dragpositionbankdivTop);
      localStorage.setItem("bankdivLeft", dragpositionbankdivLeft);
    }
  });

  $('#societydiv').draggable({
    drag: function(event, ui){
      dragpositionsocietydivTop = ui.position.top;
      dragpositionsocietydivLeft = ui.position.left;
      localStorage.setItem("societydivTop", dragpositionsocietydivTop);
      localStorage.setItem("societydivLeft", dragpositionsocietydivLeft);
    }
  });


  $('#blackMoneydiv').draggable({
    drag: function(event, ui){
      dragpositionblackMoneydivTop = ui.position.top;
      dragpositionblackMoneydivLeft = ui.position.left;
      localStorage.setItem("blackMoneydivTop", dragpositionblackMoneydivTop);
      localStorage.setItem("blackMoneydivLeft", dragpositionblackMoneydivLeft);
    }
  });


  $('#timediv').draggable({
    drag: function(event, ui){
      dragpositiontimedivTop = ui.position.top;
      dragpositiontimedivLeft = ui.position.left;
      localStorage.setItem("timedivTop", dragpositiontimedivTop);
      localStorage.setItem("timedivLeft", dragpositiontimedivLeft);
    }
  });
  $("#armordiv").draggable({
    drag: function(event, ui){
      dragpositionArmordivTop = ui.position.top;
      dragpositionArmordivLeft = ui.position.left;
      localStorage.setItem("armordivTop", dragpositionArmordivTop);
      localStorage.setItem("armordivLeft", dragpositionArmordivLeft);
    }
  });
  $("#hungerdiv").draggable({
    drag: function(event, ui){
      dragpositionHungerdivTop = ui.position.top;
      dragpositionHungerdivLeft = ui.position.left;
      localStorage.setItem("hungerdivTop", dragpositionHungerdivTop);
      localStorage.setItem("hungerdivLeft", dragpositionHungerdivLeft);
    }
  });
  $("#thirstdiv").draggable({
    drag: function(event, ui){
      dragpositionThirstdivTop = ui.position.top;
      dragpositionThirstdivLeft = ui.position.left;
      localStorage.setItem("thirstdivTop", dragpositionThirstdivTop);
      localStorage.setItem("thirstdivLeft", dragpositionThirstdivLeft);
    }
  });
  $("#staminadiv").draggable({
    drag: function(event, ui){
      dragpositionStaminadivTop = ui.position.top;
      dragpositionStaminadivLeft = ui.position.left;
      localStorage.setItem("staminadivTop", dragpositionStaminadivTop);
      localStorage.setItem("staminadivLeft", dragpositionStaminadivLeft);
    }
  });
  $("#oxygendiv").draggable({
    drag: function(event, ui){
      dragpositionOxygendivTop = ui.position.top;
      dragpositionOxygendivLeft = ui.position.left;
      localStorage.setItem("oxygendivTop", dragpositionOxygendivTop);
      localStorage.setItem("oxygendivLeft", dragpositionOxygendivLeft);
    }
  });
  $("#iddiv").draggable({
    drag: function(event, ui){
      dragpositioniddivTop = ui.position.top;
      dragpositioniddivLeft = ui.position.left;
      localStorage.setItem("iddivTop", dragpositioniddivTop);
      localStorage.setItem("iddivLeft", dragpositioniddivLeft);
    }
  });


  $("#job").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("jobTop", dragpositionjobTop);
      localStorage.setItem("jobLeft", dragpositionjobLeft);
    }
  });
  $("#logo").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("logoTop", dragpositionjobTop);
      localStorage.setItem("logoLeft", dragpositionjobLeft);
    }
  });
  $("#Healthcircle").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("HealthcircleTop", dragpositionjobTop);
      localStorage.setItem("HealthcircleLeft", dragpositionjobLeft);
    }
  });
  $("#Armorcircle").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("ArmorcircleTop", dragpositionjobTop);
      localStorage.setItem("ArmorcircleLeft", dragpositionjobLeft);
    }
  });
    $("#Hungercircle").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("HungercircleTop", dragpositionjobTop);
      localStorage.setItem("HungercircleLeft", dragpositionjobLeft);
    }
  });
    $("#Thirstcircle").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("ThirstcircleTop", dragpositionjobTop);
      localStorage.setItem("ThirstcircleLeft", dragpositionjobLeft);
    }
  });
    $("#Oxygencircle").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("OxygencircleTop", dragpositionjobTop);
      localStorage.setItem("OxygencircleLeft", dragpositionjobLeft);
    }
  });
  
  
  $("#voice").draggable({
    drag: function(event, ui){
      dragpositionjobTop = ui.position.top;
      dragpositionjobLeft = ui.position.left;
      localStorage.setItem("voiceTop", dragpositionjobTop);
      localStorage.setItem("voiceLeft", dragpositionjobLeft);
    }
  });

$(function () {
  $('#color-block').on('colorchange', function () {
    let color = $(this).wheelColorPicker('value')
    switch ($("#selection").val()) {
      case "health-option":
        $('#health').css('background', color);
        localStorage.setItem("healthColor", color);
      break;

      case "armor-option":
        $('#armor').css('background', color);
        localStorage.setItem("armorColor", color);
      break;

      case "stamina-option":
        $('#stamina').css('background', color);
        localStorage.setItem("staminaColor", color);
      break;

      case "hunger-option":
        $('#hunger').css('background', color);
        localStorage.setItem("hungerColor", color);
      break;

      case "thirst-option":
        $('#thirst').css('background', color);
        localStorage.setItem("thirstColor", color);
      break;


      case "oxygen-option":
        $('#oxygen').css('background', color);
        localStorage.setItem("oxygenColor", color);
      break;
	  
	  case "Healthcircle-option":
        $('#Healthcircle').css('background', color);
        localStorage.setItem("HealthcircleColor", color);
      break;
	  case "Armorcircle-option":
        $('#Armorcircle').css('background', color);
        localStorage.setItem("ArmorcircleColor", color);
      break;
	  case "Hungercircle-option":
        $('#Hungercircle').css('background', color);
        localStorage.setItem("HungercircleColor", color);
      break;
	  case "Thirstcircle-option":
        $('#Thirstcircle').css('background', color);
        localStorage.setItem("ThirstcircleColor", color);
      break;
	  case "Oxygencircle-option":
        $('#Oxygencircle').css('background', color);
        localStorage.setItem("OxygencircleColor", color);
      break;
	  



    };
  });
});



// Data
window.addEventListener("message", function(event) {
  switch (event.data.action) {
    case "show":
      $("#setting").fadeIn();
    break;


   case "setColors":
    {
        $('#hunger').css('background', localStorage.getItem("hungerColor"));
        $('#thirst').css('background', localStorage.getItem("thirstColor"));
      };
      $('#health').css('background', localStorage.getItem("healthColor"));
      $('#armor').css('background', localStorage.getItem("armorColor"));
      $('#stamina').css('background', localStorage.getItem("staminaColor"));
      $('#oxygen').css('background', localStorage.getItem("oxygenColor"));
	  
	  $('#Healthcircle').css('background', localStorage.getItem("HealthcircleColor"));
	  $('#Armorcircle').css('background', localStorage.getItem("ArmorcircleColor"));
	  $('#Hungercircle').css('background', localStorage.getItem("HungercircleColor"));
	  $('#Thirstcircle').css('background', localStorage.getItem("ThirstcircleColor"));
	  $('#Oxygencircle').css('background', localStorage.getItem("OxygencircleColor"));

    break;

    case "hide":
      $("#setting").fadeOut();
    break;

    case "setPosition":
{
 $("#hungerdiv").animate({ top: localStorage.getItem("hungerdivTop"), left: localStorage.getItem("hungerdivLeft") });
 $("#thirstdiv").animate({ top: localStorage.getItem("thirstdivTop"), left: localStorage.getItem("thirstdivLeft") });
};
$("#healthdiv").animate({ top: localStorage.getItem("healthdivTop"), left: localStorage.getItem("healthdivLeft") });
$("#armordiv").animate({ top: localStorage.getItem("armordivTop"), left: localStorage.getItem("armordivLeft") });
$("#staminadiv").animate({ top: localStorage.getItem("staminadivTop"), left: localStorage.getItem("staminadivLeft") });
$("#oxygendiv").animate({ top: localStorage.getItem("oxygendivTop"), left: localStorage.getItem("oxygendivLeft") });

$("#job").animate({ top: localStorage.getItem("jobTop"), left: localStorage.getItem("jobLeft") });
$("#iddiv").animate({ top: localStorage.getItem("iddivTop"), left: localStorage.getItem("iddivLeft") });
$("#bankdiv").animate({ top: localStorage.getItem("bankdivTop"), left: localStorage.getItem("bankdivLeft") });
$("#walletdiv").animate({ top: localStorage.getItem("walletdivTop"), left: localStorage.getItem("walletdivLeft") });
$("#blackMoneydiv").animate({ top: localStorage.getItem("blackMoneydivTop"), left: localStorage.getItem("blackMoneydivLeft") });
$("#societydiv").animate({ top: localStorage.getItem("societydivTop"), left: localStorage.getItem("societydivLeft") });
$("#timediv").animate({ top: localStorage.getItem("timedivTop"), left: localStorage.getItem("timedivLeft") });
$("#logo").animate({ top: localStorage.getItem("logoTop"), left: localStorage.getItem("logoLeft") });
$("#Healthcircle").animate({ top: localStorage.getItem("HealthcircleTop"), left: localStorage.getItem("HealthcircleLeft") });
$("#Armorcircle").animate({ top: localStorage.getItem("ArmorcircleTop"), left: localStorage.getItem("ArmorcircleLeft") });
$("#Hungercircle").animate({ top: localStorage.getItem("HungercircleTop"), left: localStorage.getItem("HungercircleLeft") });
$("#Thirstcircle").animate({ top: localStorage.getItem("ThirstcircleTop"), left: localStorage.getItem("ThirstcircleLeft") });
$("#Oxygencircle").animate({ top: localStorage.getItem("OxygencircleTop"), left: localStorage.getItem("OxygencircleLeft") });
$("#voice").animate({ top: localStorage.getItem("voiceTop"), left: localStorage.getItem("voiceLeft") });

    break;

    case "hud":
$("#id").text(event.data.id);
$("#iddiv").text(event.data.iddiv);
$("#time").text(event.data.time);
$("#job").text(event.data.job);
$("#healthdiv").text(event.data.job);	
$("#Healthcircle").text(event.data.job);	
$("#Hungercircle").text(event.data.job);	
$("#Thirstcircle").text(event.data.job);	
$("#Oxygencircle").text(event.data.job);	
$("#Armorcircle").text(event.data.job);	
$("#armordiv").text(event.data.job);	
$("#hungerhdiv").text(event.data.job);	
$("#thirstdiv").text(event.data.job);	
$("#walletdiv").text(event.data.walletdiv);	
$("#bankdiv").text(event.data.bankdiv);	
$("#societydiv").text(event.data.societydiv);	
$("#blackMoneydiv").text(event.data.blackMoneydiv);	
$("#timediv").text(event.data.timediv);	
$("#oxygendiv").text(event.data.oxygendiv);	
$("#staminadiv").text(event.data.staminadiv);	
$("#logo").text(event.data.logo);
$("#main").text(event.data.main);
$("#main2").text(event.data.main2);
$("#voice").text(event.data.voice);
    break;

// Actions
    case "walletdivHide":
      $("#walletdiv").fadeOut();
    break;
    case "bankdivHide":
      $("#bankdiv").fadeOut();
    break;
    case "societydivHide":
      $("#societydiv").fadeOut();
    break;
    case "blackMoneydivHide":
      $("#blackMoneydiv").fadeOut();

    break;
    case "healthHide":
      $("#health").fadeOut();
      $("#healthdiv").fadeOut();
	  $("#Healthcircle").fadeOut();
    break;

    case "armorHide":
      $("#armordiv").fadeOut();
	  $("#armor").fadeOut();
	  $("#Armorcircle").fadeOut();
    break;

    case "staminaHide":
      $("#stamina").fadeOut();
      $("#staminadiv").fadeOut();
    break;

    case "hungerHide":
      $("#hungerdiv").fadeOut();
	  $("#hunger").fadeOut();
	  $("#Hungercircle").fadeOut();
    break;

    case "thirstHide":
      $("#thirstdiv").fadeOut();
      $("#thirst").fadeOut();
	  $("#Thirstcircle").fadeOut();
    break;

    case "oxygenHide":
      $("#oxygendiv").fadeOut();
      $("#oxygen").fadeOut();
	  $("#Oxygencircle").fadeOut();
    break;
    case "idHide":
      $("#id").fadeOut();
      $("#iddiv").fadeOut();
    break;
    case "timeHide":
      $("#time").fadeOut();
	  $("#timediv").fadeOut();
    break;
    case "microphoneHide":
      $("#microphone").fadeOut();
      $("#voice").fadeOut();
      $("#box").fadeOut();
	  $("#micro").fadeOut();
    break;
    case "jobHide":
      $("#job").fadeOut();
    break;
    case "streetinfoHide":
      $("#streetinfo").fadeOut();
    break;	
    case "logoHide":
      $("#logo").fadeOut();
    break;
	case "mapHide":
      $("#map").fadeOut();
    break;
	case "resethudstyleHide":
      $("#main").fadeOut();
    break;		
	case "changehudstyleHide":
      $("#ui").fadeOut();
    break;	
	case "mainHide":
      $("#ui").fadeOut();
    break;	
	case "speedometerHide":
      $("#speedometer").fadeOut();
    break;	
	

    // Show elements
	
	case "cinematicShow":
      $("#main").fadeIn();
    break;
	case "speedometerShow":
      $("#speedometer").fadeIn();
    break;	
    case "walletdivShow":
      $("#walletdiv").fadeIn();
    break;
    case "bankdivShow":
      $("#bankdiv").fadeIn();
    break;
    case "societydivShow":
      $("#societydiv").fadeIn();
    break;
    case "blackMoneydivShow":
      $("#blackMoneydiv").fadeIn();
    break;
    case "jobShow":
      $("#job").fadeIn();
    break;
	    case "streetinfoShow":
      $("#streetinfo").fadeIn();
    break;
    case "healthShow":
      $("#health").fadeIn();
      $("#healthdiv").fadeIn();
	  $("#Healthcircle").fadeIn();
    break;

    case "armorShow":
      $("#armor").fadeIn();
	  $("#armordiv").fadeIn();
	  $("#Armorcircle").fadeIn();
    break;

    case "staminaShow":
      $("#stamina").fadeIn();
      $("#staminadiv").fadeIn();
    break;

    case "hungerShow":
      $("#hunger").fadeIn();
      $("#hungerdiv").fadeIn();
	  $("#Hungercircle").fadeIn();
    break;

    case "thirstShow":
      $("#thirst").fadeIn();
      $("#thirstdiv").fadeIn();
	  $("#Thirstcircle").fadeIn();
    break;

    case "oxygenShow":
      $("#oxygendiv").fadeIn();
	  $("#oxygen").fadeIn();
	  $("#Oxygencircle").fadeIn();
    break;

    case "idShow":
      $("#id").fadeIn();
      $("#iddiv").fadeIn();
    break;


    case "timeShow":
	  $("#timediv").fadeIn();
      $("#time").fadeIn();
    break;

    case "microphoneShow":
      $("#microphone").fadeIn();
      $("#voice").fadeIn();
      $("#box").fadeIn();
	  $("#micro").fadeIn();
    break;
    case "logoShow":
      $("#logo").fadeIn();
    break;
	case "mapShow":
      $("#map").fadeIn();
    break;
	case "resethudstyleShow":  
      $("#main").fadeIn();
    break;
	case "changehudstyleShow":  
	  $("#circle-bars").fadeIn();

    break;
	case "mainShow":
      $("#ui").fadeIn();
    break;	
  }
});


	
// Toggle switch and position reset
$("#changehudstyle-switch").click(function () { $.post('https://oc_hud_v2/change', JSON.stringify({ action: 'resethudstyle' })) });
$("#resethudstyle-switch").click(function () { $.post('https://oc_hud_v2/change', JSON.stringify({ action: 'resethudstyle' })) });
$("#logo-switch").click(function () { $.post('https://oc_hud_v2/change', JSON.stringify({ action: 'logo' })) });
$("#map-switch").click(function () { $.post('https://oc_hud_v2/change', JSON.stringify({ action: 'map' })) });
$("#cinematic-switch").click(function () { $.post('https://oc_hud_v2/change', JSON.stringify({ action: 'cinematic' })) });
$("#close").click(function () { $.post('https://oc_hud_v2/close');});

$("#reset-position").click(function () {
{
    $("#hungerdiv").animate({top: "0px", left: "0px"});
    localStorage.setItem("hungerdivTop", "0px");
    localStorage.setItem("hungerdivLeft", "0px");
    $("#thirstdiv").animate({top: "0px", left: "0px"});
    localStorage.setItem("thirstdivTop", "0px");
    localStorage.setItem("thirstdivLeft", "0px");
  };
  $("#healthdiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("healthdivTop", "0px");
  localStorage.setItem("healthdivLeft", "0px");
  $("#walletdiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("walletdivTop", "0px");
  localStorage.setItem("walletdivLeft", "0px");
  $("#bankdiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("bankdivTop", "0px");
  localStorage.setItem("bankdivLeft", "0px");
  $("#societydiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("societydivTop", "0px");
  localStorage.setItem("societydivLeft", "0px");
  $("#blackMoneydiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("blackMoneydivTop", "0px");
  localStorage.setItem("blackMoneydivLeft", "0px");
  $("#timediv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("timedivTop", "0px");
  localStorage.setItem("timedivTop", "0px");
  $("#armordiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("armordivTop", "0px");
  localStorage.setItem("armordivLeft", "0px");
  $("#staminadiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("staminadivTop", "0px");
  localStorage.setItem("staminadivLeft", "0px");
  $("#oxygendiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("oxygendivTop", "0px");
  localStorage.setItem("oxygendivLeft", "0px");
  $("#iddiv").animate({ top: "0px", left: "0px" });
  localStorage.setItem("iddivTop", "0px");
  localStorage.setItem("iddivLeft", "0px");


  $("#job").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("jobTop", "0px");
  localStorage.setItem("jobLeft", "0px");
  $("#logo").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("logoTop", "0px");
  localStorage.setItem("logoLeft", "0px");
  $("#timediv").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("timedivTop", "0px");
  localStorage.setItem("timedivLeft", "0px");
  $("#Healthcircle").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("HealthcircleTop", "0px");
  localStorage.setItem("HealthcircleLeft", "0px");
  $("#Hungercircle").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("HungercircleTop", "0px");
  localStorage.setItem("HungercircleLeft", "0px");
  $("#Armorcircle").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("ArmorcircleTop", "0px");
  localStorage.setItem("ArmorcircleLeft", "0px");
  $("#Thirstcircle").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("ThirstcircleTop", "0px");
  localStorage.setItem("ThirstcircleLeft", "0px");
  $("#Oxygencircle").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("OxygencircleTop", "0px");
  localStorage.setItem("OxygencircleLeft", "0px");
  $("#voice").animate({ top: "0px" , left: "0px"});
  localStorage.setItem("voiceTop", "0px");
  localStorage.setItem("voiceLeft", "0px");
});


$("#reset-color").click(function () {
  $('#hunger').css('background', '#cfcfcf');
  localStorage.setItem("hungerColor", '#cfcfcf');
  $('#thirst').css('background', '#cfcfcf');
  localStorage.setItem("thirstColor", '#cfcfcf');
  $('#health').css('background', '#cfcfcf');
  localStorage.setItem("healthColor", '#cfcfcf');
  $('#armor').css('background', '#cfcfcf');
  localStorage.setItem("armorColor", '#cfcfcf');
  $('#stamina').css('background', '#cfcfcf');
  localStorage.setItem("staminaColor", '#cfcfcf');
  $('#oxygen').css('background', '#cfcfcf');
  localStorage.setItem("oxygenColor", '#cfcfcf'); 
  $('#Healthcircle').css('background', '');
  localStorage.setItem("HealthcircleColor", '');
  $('#Oxygencircle').css('background', '');
  localStorage.setItem("OxygencircleColor", '');
  $('#Hungercircle').css('background', '');
  localStorage.setItem("HungercircleColor", '');
  $('#Thirstcircle').css('background', '');
  localStorage.setItem("ThirstcircleColor", '');
  $('#Armorcircle').css('background', '');
  localStorage.setItem("ArmorcircleColor", '');
});
// Color picker function
$(function () {
  $('#color-block').on('colorchange', function () {
    let color = $(this).wheelColorPicker('value');
    let alpha = $(this).wheelColorPicker('color').a;
    $('.color-preview-box').css('background-color', color);
    $('.color-preview-alpha').text(Math.round(alpha * 100) + '%');
  });
});

function print(value) {
  console.log(value)
}


// Listener
$(function () {
	window.addEventListener('message', function (event) {
		switch (event.data.action) {
			case 'setJob':
				$('.job-text').text(event.data.data)
				break
			
		}
	})
})

// Listener




var isArmorShown = false;
$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    window.addEventListener('message', function(event) {
        if (event.data.type === "ui") {
            if (event.data.status == true) {
                display(true)
            }
            else {
                display(false)
            }
        }
        else if (event.data.type === "update") {
            
           
			
       }
    }) 
})




// Microphone effects

				$(function() {
					var $level = $("#voice");
					var $box = $("#box");

					window.addEventListener('message', function(event){
					

					
					 	$box.css("width", event.data.level + "%");
						
					 	if (event.data.talking == true) 
					 	{
					 		$box.css("background", "#198754",);
							$level.css("animation", "soundwave 1s infinite",);
					 	
					 	}
					 	else if (event.data.talking == false)
					 	{
					 		$box.css("background", "#212529");
							$level.css("animation", "soundwave 0s",);
					 	}
						
					}); 
				});


// Disable other toggle switch
document.querySelectorAll('input[name=main]').forEach(element => element.addEventListener('click', disableOther))
function disableOther(event) {
  if (event.target.checked) {
    document.querySelectorAll('input[type=checkbox]').forEach(element => element.disabled = true);
	document.querySelectorAll('label[class=switch]').forEach(element => element.style.opacity = "0.5")
	document.querySelectorAll('label[name="mainswitchlabel"]').forEach(element => element.style.opacity = "1")
    event.target.disabled = false;
  } else {

    document.querySelectorAll('input[type=checkbox]').forEach(element => element.disabled = false)
	document.querySelectorAll('label[class=switch]').forEach(element => element.style.opacity = "1")
  }
}


// Close menu
document.onkeyup = function (event) {
  if (event.key == 'Escape') {
    $.post('https://oc_hud_v2/close');
  }
};

// Health save
$(document).ready(function() {
  if (window.localStorage.getItem("save1") != null) {
    var pb = window.localStorage.getItem("save1");
    if (pb == "true") {
      $(".save1").hide();
    }
  }

  $("#health-switch").click(function() {
    var v = $(".save1").is(":visible")
    $(".save1").fadeToggle(500, "swing");
    window.localStorage.setItem("save1", v)
  });
// Armor save
  if (window.localStorage.getItem("save2") != null) {
    var pb = window.localStorage.getItem("save2");
    if (pb == "true") {
      $(".save2").hide();
    }
  }

  $("#armor-switch").click(function() {
    var v = $(".save2").is(":visible")
    $(".save2").fadeToggle(500, "swing");
    window.localStorage.setItem("save2", v)
  });
// Hunger save
  if (window.localStorage.getItem("save3") != null) {
    var pb = window.localStorage.getItem("save3");
    if (pb == "true") {
      $(".save3").hide();
    }
  }

  $("#hunger-switch").click(function() {
    var v = $(".save3").is(":visible")
    $(".save3").fadeToggle(500, "swing");
    window.localStorage.setItem("save3", v)
  });
// Thirst save
  if (window.localStorage.getItem("save4") != null) {
    var pb = window.localStorage.getItem("save4");
    if (pb == "true") {
      $(".save4").hide();
    }
  }

  $("#thirst-switch").click(function() {
    var v = $(".save4").is(":visible")
    $(".save4").fadeToggle(500, "swing");
    window.localStorage.setItem("save4", v)
  });
// Stamina save
  if (window.localStorage.getItem("save5") != null) {
    var pb = window.localStorage.getItem("save5");
    if (pb == "true") {
      $(".save5").hide();
    }
  }

  $("#stamina-switch").click(function() {
    var v = $(".save5").is(":visible")
    $(".save5").fadeToggle(500, "swing");
    window.localStorage.setItem("save5", v)
  });
// Oxygen save
  if (window.localStorage.getItem("save6") != null) {
    var pb = window.localStorage.getItem("save6");
    if (pb == "true") {
      $(".save6").hide();
    }
  }

  $("#oxygen-switch").click(function() {
    var v = $(".save6").is(":visible")
    $(".save6").fadeToggle(500, "swing");
    window.localStorage.setItem("save6", v)
  });
// Job save
  if (window.localStorage.getItem("save7") != null) {
    var pb = window.localStorage.getItem("save7");
    if (pb == "true") {
      $(".save7").hide();
    }
  }

  $("#job-switch").click(function() {
    var v = $(".save7").is(":visible")
    $(".save7").fadeToggle(500, "swing");
    window.localStorage.setItem("save7", v)
  });
// id save
  if (window.localStorage.getItem("save8") != null) {
    var pb = window.localStorage.getItem("save8");
    if (pb == "true") {
      $(".save8").hide();
    }
  }

  $("#id-switch").click(function() {
    var v = $(".save8").is(":visible")
    $(".save8").fadeToggle(500, "swing");
    window.localStorage.setItem("save8", v)
  });
// bank save
  if (window.localStorage.getItem("save9") != null) {
    var pb = window.localStorage.getItem("save9");
    if (pb == "true") {
      $(".save9").hide();
    }
  }

  $("#bankdiv-switch").click(function() {
    var v = $(".save9").is(":visible")
    $(".save9").fadeToggle(500, "swing");
    window.localStorage.setItem("save9", v)
  });
// wallet save
  if (window.localStorage.getItem("save10") != null) {
    var pb = window.localStorage.getItem("save10");
    if (pb == "true") {
      $(".save10").hide();
    }
  }

  $("#walletdiv-switch").click(function() {
    var v = $(".save10").is(":visible")
    $(".save10").fadeToggle(500, "swing");
    window.localStorage.setItem("save10", v)
  });
// society save
  if (window.localStorage.getItem("save11") != null) {
    var pb = window.localStorage.getItem("save11");
    if (pb == "true") {
      $(".save11").hide();
    }
  }

  $("#societydiv-switch").click(function() {
    var v = $(".save11").is(":visible")
    $(".save11").fadeToggle(500, "swing");
    window.localStorage.setItem("save11", v)
  });
// blackmoney save
  if (window.localStorage.getItem("save12") != null) {
    var pb = window.localStorage.getItem("save12");
    if (pb == "true") {
      $(".save12").hide();
    }
  }

  $("#blackMoneydiv-switch").click(function() {
    var v = $(".save12").is(":visible")
    $(".save12").fadeToggle(500, "swing");
    window.localStorage.setItem("save12", v)
  });
// time save
  if (window.localStorage.getItem("save13") != null) {
    var pb = window.localStorage.getItem("save13");
    if (pb == "true") {
      $(".save13").hide();
    }
  }

  $("#time-switch").click(function() {
    var v = $(".save13").is(":visible")
    $(".save13").fadeToggle(500, "swing");
    window.localStorage.setItem("save13", v)
  });
// microphone save
  if (window.localStorage.getItem("save14") != null) {
    var pb = window.localStorage.getItem("save14");
    if (pb == "true") {
      $(".save14").hide();
    }
  }

  $("#microphone-switch").click(function() {
    var v = $(".save14").is(":visible")
    $(".save14").fadeToggle(500, "swing");
    window.localStorage.setItem("save14", v)
  });
// logo save
  if (window.localStorage.getItem("save15") != null) {
    var pb = window.localStorage.getItem("save15");
    if (pb == "true") {
      $(".save15").hide();
    }
  }

  $("#logo-switch").click(function() {
    var v = $(".save15").is(":visible")
    $(".save15").fadeToggle(500, "swing");
    window.localStorage.setItem("save15", v)
  });
// map save -- do not change
  if (window.localStorage.getItem("save18") != null) {
    var pb = window.localStorage.getItem("save18");
    if (pb == "true") {
      $(".save18").hide();
    }
  }


  
  // streetinfo
    if (window.localStorage.getItem("save20") != null) {
    var pb = window.localStorage.getItem("save20");
    if (pb == "true") {
      $(".save20").hide();
    }
  }

  $("#streetinfo-switch").click(function() {
    var v = $(".save20").is(":visible")
    $(".save20").fadeToggle(500, "swing");
    window.localStorage.setItem("save20", v)
  });

  // speedometer
    if (window.localStorage.getItem("speedometersave") != null) {
    var pb = window.localStorage.getItem("speedometersave");
    if (pb == "true") {
      $(".speedometersave").hide();
    }
  }

  $("#speedometer-switch").click(function() {
    var v = $(".speedometersave").is(":visible")
    $(".speedometersave").fadeToggle(500, "swing");
    window.localStorage.setItem("speedometersave", v)
  });
  
  // resethudstyle save
  if (window.localStorage.getItem("defaulthudsave") != null) {
    var pb = window.localStorage.getItem("defaulthudsave");
    if (pb == "true") {
      $(".defaulthudsave").hide();
    }
  }

  $("#resethudstyle-switch").click(function() {
    var v = $(".defaulthudsave").is(":visible")
    $(".defaulthudsave").fadeToggle(500, "swing");
    window.localStorage.setItem("defaulthudsave", v)
  });
  // resethudstyle save
  if (window.localStorage.getItem("circlesave1") != null) {
    var pb = window.localStorage.getItem("circlesave1");
    if (pb == "true") {
      $(".circlesave1").hide();
	  	document.getElementById("circle-bars").style.display = "none";
    }
  }

  $("#changehudstyle-switch").click(function() {
    var v = $(".circlesave1").is(":visible")
    $(".circlesave1").fadeToggle(500, "swing");
    window.localStorage.setItem("circlesave1", v)
  });


});








var formValues = JSON.parse(localStorage.getItem('formValues')) || {};
var $checkboxes = $("#setting :checkbox");
var $button = $("#do-not-change button");

function allChecked(){
  return $checkboxes.length === $checkboxes.filter(":checked").length;
}

function updateButtonStatus(){
  $button.text(allChecked()? "Uncheck all" : "Check all");
}

function handleButtonClick(){
  $checkboxes.prop("checked", allChecked()? false : true)
}

function updateStorage(){
  $checkboxes.each(function(){
    formValues[this.id] = this.checked;
  });

  formValues["buttonText"] = $button.text();
  localStorage.setItem("formValues", JSON.stringify(formValues));
}

$button.on("click", function() {
  handleButtonClick();
  updateButtonStatus();
  updateStorage();
});

$checkboxes.on("change", function(){
  updateButtonStatus();
  updateStorage();
});

// On page load
$.each(formValues, function(key, value) {
  $("#" + key).prop('checked', value);
});

$button.text(formValues["buttonText"]);


function func() {
    document.getElementById('cinametic-switch').value  = 'server';
}



function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


const priceDiv = document.querySelector('#bank');
priceDiv.textContent = (+priceDiv.textContent).toLocaleString('en-US');

// Default switch status



// Speedometer
window.addEventListener("message", function (event) {
  let data = event.data;


  if (data.speed > 0) {
    $("#Speed").text(data.speed);
    let multiplier = data.maxspeed * 0.1;
    let SpeedoLimit = data.maxspeed + multiplier;
  } else if (data.speed == 0) {
    $("#Speed").text("0");
  }


  if (data.showSpeedo == true) {
    $("#Speedometer").fadeIn();
  } else if (data.showSpeedo == false) {
    $("#Speedometer").fadeOut();
  }
});


var loadJS = function(url, implementationCode, location) {
	var scriptTag = document.createElement('script');
	scriptTag.src = url;

	scriptTag.onload = implementationCode;
	scriptTag.onreadystatechange = implementationCode;

	location.appendChild(scriptTag);
};




window.onload = (e) => {
  window.addEventListener('message', onMessageRecieved);
};

function onMessageRecieved(event){
	let item = event.data;
  
	if (item && item.type === 'streetLabel:MSG') {
    if (!item.active) {
			$("#container").hide();
		} else {
			$("#container").show();
      
			let direction	= item.direction;
			let zone = item.zone;
			let street = item.street;

			$('#direction').text(direction);
			$('#zone').text(zone);
			$('#street').text(street);
		}
	} 
  
  if (item && item.type === 'streetLabel:DATA') {
      if (item.color) { $('#street').css('color', item.color); }
      /* Position/Scale HUD according to configuration file */
      if (item.offsetX) { container.style.left = item.offsetX + '%'; }
      if (item.offsetY) { container.style.bottom = item.offsetY + '%'; }
      if (item.scale) { container.style.transform = `scale(${item.scale})`; }

      /* Dynamic stylesheet control */

	}
}













$(document).ready(function () {
	
  Healthcircle = new ProgressBar.Circle("#Healthcircle", {
    color: "rgb(240, 240, 240)",
    trailColor: "180,180,180,0.71",
    strokeWidth: 10,
    trailWidth: 10,
    duration: 250,
    easing: "easeInOut",
  });

  Armorcircle = new ProgressBar.Circle("#Armorcircle", {
    color: "rgb(240, 240, 240)",
    trailColor: "rgb(180,180,180,0.71)",
    strokeWidth: 10,
    trailWidth: 10,
    duration: 250,
    easing: "easeInOut",
  });

  Hungercircle = new ProgressBar.Circle("#Hungercircle", {
    color: "rgb(240, 240, 240)",
    trailColor: "rgb(180,180,180,0.71)",
    strokeWidth: 10,
    trailWidth: 10,
    duration: 250,
    easing: "easeInOut",
  });

  Thirstcircle = new ProgressBar.Circle("#Thirstcircle", {
    color: "rgb(240, 240, 240)",
    trailColor: "rgb(180,180,180,0.71)",
    strokeWidth: 10,
    trailWidth: 10,
    duration: 250,
    easing: "easeInOut",
  });


  Oxygencircle = new ProgressBar.Circle("#Oxygencircle", {
    color: "rgb(240, 240, 240)",
    trailColor: "rgb(180,180,180,0.71)",
    strokeWidth: 10,
    trailWidth: 10,
    duration: 250,
    easing: "easeInOut",
  });




});

window.addEventListener("message", function (event) {
  let data = event.data;


  if (data.action == "update_circle") {
    Armorcircle.animate(data.armor / 100);
    Healthcircle.animate(data.health / 100);
    Hungercircle.animate(data.hunger / 100);
    Thirstcircle.animate(data.thirst / 100);
    Oxygencircle.animate(data.oxygen / 100);

  }

});











