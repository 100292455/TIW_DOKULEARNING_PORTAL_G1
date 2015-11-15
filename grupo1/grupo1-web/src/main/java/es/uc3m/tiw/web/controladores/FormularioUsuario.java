package es.uc3m.tiw.web.controladores;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Usuario;


/**
 * Servlet implementation class FormularioUsuario
 */
@WebServlet("/FormularioUsuario")
public class FormularioUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormularioUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    /**Validate email **/
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellidos");
		String sexo=request.getParameter("sex");
		String email=request.getParameter("correo");
		String tel=request.getParameter("telefono");
		String cobro=request.getParameter("cobro");	
	//	String descripcion=request.getParameter("descripcion");
		String password1=request.getParameter("contraseña1");
		String password2=request.getParameter("contraseña2");

		
		if (nombre == "" || nombre == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (apellido == "" || apellido == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (email == "" || email == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (tel == "" || tel == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
	
		
		if (password1 == "" || password1 == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (password2 == "" || password2 == null){
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		
		HttpSession sesion = request.getSession();	
		
		
		Usuario usuario = new Usuario();
		usuario.setNombre(nombre);
		usuario.setApellido(apellido);
		usuario.setEmail(email);
		usuario.setTelefono(tel);
		usuario.setClave(password1);
		
		
		if(sexo.equals("hombre")){
			
			usuario.sexo=1;
		}
		if(sexo.equals("mujer")){
			
			usuario.sexo=0;
		}	
		
		if(cobro.equals("otros")){
			usuario.setTipo_usuario(0);
		}else{
			usuario.setTipo_usuario(1);
		}
		
		sesion.setAttribute("usuario", usuario);

		

		

		
		
			this.getServletContext().getRequestDispatcher("/miPerfilAlumno.jsp").forward(request, response);
			
		
	
		
	}

}
