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
		usuario = new Usuario(1,"Alejandro", "Ruiz", 1, "alex@uc3m.es","636780470","VISA",1, "1234");
		Usuario usuario_2 = new Usuario(2,"Miguel", "Solera", 1, "miguel@uc3m.es","636780470","VISA",0, "1234");

		usuarios = new ArrayList<Usuario>();
		usuarios.add(usuario);
		usuarios.add(usuario_2);

		
		/*CURSOS*/
		Curso curso = new Curso(1, "Matematicas", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 1, 3, 3);
		Curso curso1 = new Curso(2, "Ingles", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 1, 3, 3);
		Curso curso2 = new Curso(3, "Lengua", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 1, 3, 3);
		Curso curso3 = new Curso(4, "Arrte", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 0, 3, 3);
		Curso curso4 = new Curso(4, "Programacion", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 0, 3, 3);
		Curso curso5 = new Curso(4, "Geografia", "Actualmente, todas las ciencias aportan problemas que son estudiados por matemáticos, al mismo tiempo que aparecen nuevos problemas dentro de las propias matemáticas. Por ejemplo, el físico Richard Feynman propuso la integral de caminos como fundamento de la mecánica cuántica, combinando el razonamiento matemático y el enfoque de la física, pero todavía no se ha logrado una definición plenamente satisfactoria en términos matemáticos. Similarmente, la teoría de cuerdas, una teoría científica en desarrollo que trata de unificar las cuatro fuerzas fundamentales de la física, sigue inspirando a las más modernas matemáticas.", 2, 2, 30, 30, 0, 1, 3);

		cursos = new ArrayList<Curso>();
		cursos.add(curso);
		cursos.add(curso1);
		cursos.add(curso2);
		cursos.add(curso3);
		cursos.add(curso4);
		cursos.add(curso5);
		
		//Crear BBDD matriculas
		Matricula matricula = new Matricula(1, 1, 20);
		Matricula matricula1 = new Matricula(1, 2, 20);
		Matricula matricula2 = new Matricula(1, 3, 20);
		matriculas = new ArrayList<Matricula>();
		matriculas.add(matricula);
		matriculas.add(matricula1);
		matriculas.add(matricula2);
	
		
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
		
				pagina = ENTRADA_ALUMNO_JSP;
			
			
				
			request.setAttribute("usuarios", usuarios);
			sesion.setAttribute("usuario", u);
			sesion.setAttribute("acceso", "ok");
			context.setAttribute("cursos", cursos);
			sesion.setAttribute("matriculas", matriculas);
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