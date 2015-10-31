package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Curso;
import es.uc3m.tiw.web.dominio.Leccion;
import es.uc3m.tiw.web.dominio.Matricula;
import es.uc3m.tiw.web.dominio.Seccion;
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
@WebServlet("/sesion")
public class SesionServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/miPerfilProfesor.jsp";
	private static final String ENTRADA_ALUMNO_JSP = "/miPerfilAlumno.jsp";
	private static final String LOGIN_JSP = "/login.jsp";
	private static final String INDEX_JSP = "/index.jsp";
	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private ArrayList<Usuario> usuarios;

	private ArrayList<Seccion> secciones;//BBDD promociones
	private ArrayList<Leccion> lecciones;//BBDD lecciones

	private ArrayList<Curso> cursos;//BBDD cursos
	private ArrayList<Matricula> matriculas;//BBDD matriculas
	@Override
	public void init() throws ServletException {
		usuario = new Usuario(1,"Alejandro", "Ruiz", 1, "alex@uc3m.es","636780470","VISA",0, "1234");
		Usuario usuario_2 = new Usuario(1,"Miguel", "Solera", 1, "miguel@uc3m.es","636780470","VISA",1, "1234");

		usuarios = new ArrayList<Usuario>();
		usuarios.add(usuario);
		usuarios.add(usuario_2);

		
		/*CURSOS*/
		Curso curso = new Curso(1, "tituloCurso1", "descripcionCurso1", 2, 2, 30, 30, 1, 3, 3);
		Curso curso1 = new Curso(2, "tituloCurso2", "descripcionCurso2", 2, 2, 30, 30, 1, 3, 3);
		Curso curso2 = new Curso(3, "tituloCurso3", "descripcionCurso3", 2, 2, 30, 30, 1, 3, 3);
		Curso curso3 = new Curso(4, "tituloCurso4", "descripcionCurso4", 2, 2, 30, 30, 0, 3, 3);
		cursos = new ArrayList<Curso>();
		cursos.add(curso);
		cursos.add(curso1);
		cursos.add(curso2);
		cursos.add(curso3);
		
		//Crear BBDD matriculas
		Matricula matricula = new Matricula(1, 1, 20);
		Matricula matricula1 = new Matricula(2, 2, 20);
		Matricula matricula2 = new Matricula(3, 3, 20);
		matriculas = new ArrayList<Matricula>();
		matriculas.add(matricula);
		
		
		//Crear BBDD Secciones
		Seccion seccion1 = new Seccion(50, 1, "Seccion 1");
		Seccion seccion2 = new Seccion(30, 1, "Seccion 2");
		secciones = new ArrayList<Seccion>();
		secciones.add(seccion1);
		secciones.add(seccion2);
		
		//Crear BBDD Lecciones
		Leccion leccion1 = new Leccion("Leccion 1 de la Seccion 1", "Descripcion de la Leccion", "formato", 50);
		Leccion leccion2 = new Leccion("Leccion 2 de la Seccion 1", "Descripcion de la Leccion", "formato", 50);;
		Leccion leccion3 = new Leccion("Leccion 1 de la Seccion 2", "Descripcion de la Leccion", "formato", 30);;
		Leccion leccion4 = new Leccion("Leccion 2 de la Seccion 2", "Descripcion de la Leccion", "formato", 30);
		lecciones = new ArrayList<Leccion>();
		lecciones.add(leccion1);
		lecciones.add(leccion2);
		lecciones.add(leccion3);
		lecciones.add(leccion4);

		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String salir = request.getParameter("accion");
		if (salir != null && !salir.equals("")) {
			request.getSession().invalidate();
		}
		this.getServletContext().getRequestDispatcher(INDEX_JSP).forward(request, response);
		
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
		HttpSession sesion = request.getSession(true);
		ServletContext context = sesion.getServletContext();
		Usuario u = comprobarUsuario(user, password);
		if (u != null){
			if (u.getTipo_usuario() == 1){
				pagina = ENTRADA_JSP;
			}
			else if(u.getTipo_usuario()==0){
				pagina = ENTRADA_ALUMNO_JSP;
			}
			
				
			context.setAttribute("usuarios", usuarios);
			context.setAttribute("usuario", u);
			context.setAttribute("acceso", "ok");
			context.setAttribute("cursos", cursos);
			context.setAttribute("matriculas", matriculas);
			context.setAttribute("secciones", secciones);
			context.setAttribute("lecciones", lecciones);

			
		}else{
			
			mensaje = "Usuario o password incorrectos";
			request.setAttribute("mensaje", mensaje);
		}
		
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Usuario  comprobarUsuario(String user, String password) {
		Usuario u = null;
		for (Usuario usuario : usuarios) {
			if (user.equals(usuario.getEmail()) && password.equals(usuario.getClave())){
				u = usuario;
				break;
			}
		}
		return u;
	}

}