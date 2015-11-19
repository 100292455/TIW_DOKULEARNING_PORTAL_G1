

$(document).ready(function(){
	//crear usuario
	var añadiroferta = true;
	
	$(':radio').mousedown(function(e){
		  var $self = $(this);
		  if( $self.is(':checked') ){
		    var uncheck = function(){
		      setTimeout(function(){$self.removeAttr('checked');},0);
		    };
		    var unbind = function(){
		      $self.unbind('mouseup',up);
		    };
		    var up = function(){
		      uncheck();
		      unbind();
		    };
		    $self.bind('mouseup',up);
		    $self.one('mouseout', unbind);
		  }
		});
	
	$(".mens").hide();
	
	



	/* Al pulsar el boton anadir 	*/
  
  	$("input[type=submit]").click(function(){
  			validar();
	  });

  

});		

	function validar(){
			
			var nombre = document.getElementById("nombre");
			var apellidos = document.getElementById("apellidos");
			var correo = document.getElementById("correo");
			var telefono = document.getElementById("telefono");
			var contraseña1 = document.getElementById("password1");
			var contraseña2 = document.getElementById("password2");
			
			var validacion = true; /*variable para crear la oferta*/
			
			if (nombre.value == "" || nombre.value == null || nombre.value == '' || (/^([a-z ñáéíóú]{2,60})$/i.test(nombre))){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
				  $("#mens1").show();
		         validacion=false;
		     }else{
		         $("#mens1").hide();      /* Si si lo introduce, esconde el mensaje */
	         }
				
		
			if (apellidos.value == "" || apellidos.value == null || apellidos.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens2").show();
		         validacion=false;
		
		     }else{
		         $("#mens2").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
				

			if (correo.value == "" || correo.value == null || correo.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens4").show();
		         validacion=false;
		
		     }else{
		         $("#mens4").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
			
			if (telefono.value == "" || telefono.value == null || telefono.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens5").show();
		         validacion=false;
		
		     }else{
		         $("#mens5").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
			
			
		

			if (contraseña2.value == "" || contraseña2.value == null || contraseña2.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens10").show();
		         validacion=false;
		
		     }else{
		         $("#mens10").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
		
			if (contraseña1.value == "" || contraseña1.value == null || contraseña1.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens9").show();
		         validacion=false;
		
		     }else{
		         $("#mens9").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
		
				if(document.getElementById("acepto").checked){
				}else{
					validacion=false;
					}
		if(contraseña2.value != contraseña1.value){
			
			validacion=false;
		}
		$('body, html').animate({
			scrollTop: '200px'
		}, 300);
		
			return validacion;
	}
		
			
	
		
  
		
		
		
		
		
	
		
		
		
		