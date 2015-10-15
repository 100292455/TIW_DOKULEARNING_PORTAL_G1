package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Usuario;

@WebServlet("/contenidoCursos")
public class ContenidoCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/contenidoCurso.jsp";
	private static final String FORMULARIOMATRICULA_JSP = "/formularioMatricula.jsp";
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(true);
		if (sesion.getAttribute("acceso")!=null && sesion.getAttribute("acceso").equals("ok")) { //buscamos el token de autenticacion
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("Peticion recibida por post");
			out.println("<h1>Acceso OK "+"</h1>");
			out.close();
			
		}else{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("Peticion recibida por GET");
			out.println("<h1>No acceso"+"</h1>");
			out.close();
		}
		//String password = request.getParameter("password");
		//String mensaje ="";
		//String pagina = "";
		//pagina = FORMULARIOMATRICULA_JSP;
		
		//Usuario u = comprobarUsuario(user, password);
		
		//if (u != null){
			
		//pagina = ENTRADA_JSP;
		//request.setAttribute("usuarios", usuarios);
		//sesion.setAttribute("usuario", u);
		//sesion.setAttribute("acceso", "ok");
			
		//}else{
			
			
		//mensaje = "Usuario o password incorrectos";
		//request.setAttribute("mensaje", mensaje);
		//}
		
		
			//this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
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
