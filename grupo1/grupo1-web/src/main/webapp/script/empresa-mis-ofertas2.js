$(document).ready(function(){
	var añadiroferta = true;

  //Añadir una oferta nueva 
	$("#añadir-leccion").hide();
	$(".añadir-leccion").click(function(){
	   if (añadiroferta){
		$("#añadir-leccion").show();
		añadiroferta=false;
		$(".añadir-leccion").val("Ocultar añadir")
		window.scrollTo(0, 1500);
		
		
	}
		else{
			añadiroferta=true;
			$("#añadir").hide();
			$(".añadir-leccion").val("Añadir leccion")
			
		}
	  });
    
    
    /*Ocultar mensajes*/
    
	$("#mens1").hide();
    $("#mens2").hide();
    $("#mens4").hide();
    
    
    /* Al pulsar el boton anadir 	*/
    
    $("#añadir-leccion-button").click(function(){
    	validarcrearleccion();
 	  });



});	

function validarcrearleccion(){
	var comprobartit = $("#titulo-leccion").val();
	var comprobarform = $("#formato-leccion").val();
	var comprobardes = $("#añadir-descripcion").val();
	var validacion = true; /*variable para crear la oferta*/
	if (comprobartit == "" || comprobartit == null){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
	     $("#mens1").show();
	     validacion=false;

	 }else{
	     $("#mens1").hide();      /* Si si lo introduce, esconde el mensaje */
	     }
	if (comprobarform=="otro"){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
	     $("#mens2").show();
	     validacion=false;

	 }else{
	     $("#mens2").hide();      /* Si si lo introduce, esconde el mensaje */
	     }	
	if (comprobardes == "" || comprobardes == null){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
	     $("#mens4").show();
	     validacion=false;

	 }else{
	     $("#mens4").hide();      /* Si si lo introduce, esconde el mensaje */
	     }
	return validacion;

}