package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Usuario;

@WebServlet("/contenidoCursos")
public class ContenidoCursosServlet extends HttpServlet {
	private static final String ENTRADACONTENIDOCURSO_JSP = "/contenidoCurso.jsp";
	private static final String AVISOMATRICULA_JSP = "/avisoMatricula.jsp";
	private static final long serialVersionUID = 1L;
	private Usuario usuarioMatriculado;
	private ArrayList<Usuario> usuarios;
	private ArrayList<Usuario> usuariosMatriculados;
	@Override
	public void init() throws ServletException {
	
		//Crear BBDD de alumnos matriculados en este curso
		usuarioMatriculado = new Usuario(1, "Pepe", "dd", "david", "clave");
		Usuario usuarioMatriculado1 = new Usuario(2, "Juan", "perez", "juan", "12345678");
		Usuario usuarioMatriculado2 = new Usuario(3, "Daniel", "Garcia", "dani", "12345678");
		usuariosMatriculados = new ArrayList<Usuario>();
		usuariosMatriculados.add(usuarioMatriculado);
		usuariosMatriculados.add(usuarioMatriculado1);
		usuariosMatriculados.add(usuarioMatriculado2);
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		ServletContext context = sesion.getServletContext();
		
		//Coger BBDD usuarios del sistema
		usuarios = (ArrayList<Usuario>) context.getAttribute("usuarios");
		
		Usuario user = (Usuario) context.getAttribute("usuario");
		String nombreCurso = request.getParameter("nombreCurso");
		
		//Comprobar si el usuario esta dentro de la BBDD del curso
		Usuario u = comprobarUsuario(user.getNombre(), user.getPassword());
		
		//Si el usuario esta dentro de la BBDD de este curso el servlet le manda a ver el contenido del curso
		if (u != null){
			this.getServletContext().getRequestDispatcher(ENTRADACONTENIDOCURSO_JSP).forward(request, response);
		}
		//Si el usuario no esta dentro de la BBDD de este curso le manda a matricularse
		else{
			//Meto el titulo del curso en el contexto para que el servlet AñadirMatriculaServlet pueda leerlo
			context.setAttribute("cursoMatricular", nombreCurso);
			//meto la bbdd del curso en el contexto para poder actualizarla cuando el usuario se matricule
			context.setAttribute("usuariosMatriculados", usuariosMatriculados);
			this.getServletContext().getRequestDispatcher(AVISOMATRICULA_JSP).forward(request, response);

		}		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

	private Usuario  comprobarUsuario(String user, String password) {
		Usuario u = null;
		for (Usuario usuario : usuariosMatriculados) {
			if (user.equals(usuario.getNombre()) && password.equals(usuario.getPassword())){
				u = usuario;
				break;
			}
		}
		return u;
	}

}
