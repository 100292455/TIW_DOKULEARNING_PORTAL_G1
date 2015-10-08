package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Usuario;

/**
 * Servlet de ejemplo que muestra distintos aspectos dentro de los ambitos request y session. 
 * -Como usar el metodo init para inicializar datos
 * -Como recoger datos desde un formulario por post
 * -Como no permitir acceso por get redirigiendo a la pagina de login.jsp
 * -Uso del objeto RequestDispatcher y forward
 * -Introduccion de atributos en el objeto request
 * -Uso de objeto sesion para mantener al usuario autenticado
 * -Control de flujo y logica de negicio de un controlador.
 * 
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/listado.jsp";
	private static final String LOGIN_JSP = "/login.jsp";
	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private ArrayList<Usuario> usuarios;
	@Override
	public void init() throws ServletException {
	
		usuario = new Usuario("David", "dd", "david", "clave");
		Usuario usuario2 = new Usuario("Juan", "perez", "juan", "12345678");
		Usuario usuario3 = new Usuario("Daniel", "Garcia", "dani", "12345678");
		
		usuarios = new ArrayList<Usuario>();
		usuarios.add(usuario);
		usuarios.add(usuario2);
		usuarios.add(usuario3);
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(LOGIN_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user = request.getParameter("usuario");
		String password = request.getParameter("password");
		String mensaje ="";
		String pagina = "";
		pagina = LOGIN_JSP;
		HttpSession sesion = request.getSession();
		Usuario u = comprobarUsuario(user, password);
		if (u != null){
			
			pagina = ENTRADA_JSP;
			request.setAttribute("usuarios", usuarios);
			sesion.setAttribute("usuario", u);
			sesion.setAttribute("acceso", "ok");
			
		}else{
			
			mensaje = "Usuario o password incorrectos";
			request.setAttribute("mensaje", mensaje);
		}
		
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Usuario  comprobarUsuario(String user, String password) {
		Usuario u = null;
		for (Usuario usuario : usuarios) {
			if (user.equals(usuario.getUsuario()) && password.equals(usuario.getPassword())){
				u = usuario;
				break;
			}
		}
		return u;
	}

}