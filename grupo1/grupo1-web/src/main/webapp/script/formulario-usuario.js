

$(document).ready(function(){
	//crear usuario
	var añadiroferta = true;
	
	
	
	$(".mens").hide();
	
	$(function() {
    $("input[name=fecha]").datepicker();
  });



	/* Al pulsar el boton anadir */
  
  	$("input[type=submit]").click(function(){
	   comprobarTexto();
	  });

	

});		

	function validar(){
			
			var nombre = document.getElementById("nombre");
			var apellidos = document.getElementById("apellidos");
			var sexo = document.getElementById("sex");
			var correo = document.getElementById("correo");
			var telefono = document.getElementById("telefono");
			var cobro = document.getElementById("cobro");
			var rol = document.getElementById("rol");
			var contraseña1 = document.getElementById("password1");
			var contraseña2 = document.getElementById("password2");
			
			var validacion = true; /*variable para crear la oferta*/
		    
		    
			
			if (nombre.value == "" || nombre.value == null || nombre.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
				  $("#mens1").show();
		         validacion=false;
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
		
			
			if (cobro.value == "" || cobro.value == null || cobro.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens6").show();
		         validacion=false;
		
		     }else{
		         $("#mens6").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
		
			if (rol.value == "" || rol.value == null || rol.value == ''){   /* Si no introduce el titulo enseña el mensaje de error y pone la variable validacion a false*/
		         $("#mens7").show();
		         validacion=false;
		
		     }else{
		         $("#mens7").hide();      /* Si si lo introduce, esconde el mensaje */
		         }
				 
			if(rol.value !="Profesor" && rol.value !="Alumno"){
				validacion=false;
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
		
		
			return validacion;
	}
		
			
	
		
  
		
		
		
		
		
	
		
		
		
		