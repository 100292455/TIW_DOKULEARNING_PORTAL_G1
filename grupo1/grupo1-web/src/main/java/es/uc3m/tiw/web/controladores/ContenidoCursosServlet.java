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

import es.uc3m.tiw.web.dominio.Curso;
import es.uc3m.tiw.web.dominio.Matricula;
import es.uc3m.tiw.web.dominio.Usuario;

@WebServlet("/contenidoCursos")
public class ContenidoCursosServlet extends HttpServlet {
	private static final String ENTRADACONTENIDOCURSO_JSP = "/contenidoCurso.jsp";
	private static final String AVISOMATRICULA_JSP = "/avisoMatricula.jsp";
	private static final long serialVersionUID = 1L;
	private Usuario usuarioMatriculado;
	private ArrayList<Usuario> usuarios;
	private ArrayList<Curso> cursos;
	private ArrayList<Matricula> matriculas;//BBDD matriculas
	@Override
	public void init() throws ServletException {
		matriculas = new ArrayList<Matricula>();
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*--------- RECUPERAR LAS TABLAS DE LA BBDD ---------*/
		String nombreCurso = (String) request.getAttribute("nombreCurso");
		HttpSession sesion = request.getSession(true);
		sesion.setAttribute("nombreCurso", nombreCurso);
		this.getServletContext().getRequestDispatcher(ENTRADACONTENIDOCURSO_JSP).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

	//Comprobar si el usuario ya esta matriculado en el curso
	private boolean  comprobarUsuarioMatriculado(int id_usuario,int id_cursoMatricular,ArrayList<Matricula> matriculas) {
		boolean b = false;
		for (Matricula matricula : matriculas) {
			if (matricula.getCod_alumno()==id_usuario && matricula.getCod_curso()==id_cursoMatricular){
				b = true;
				break;
			}
			
		}
		return b;
	}
	
	//Coger id del curso al que queremos matrcular al usuario
	private Curso  cogerIdCurso(String nombreCurso) {
		Curso c = null;
		for (Curso curso : cursos) {
			if (nombreCurso.equals(curso.getDES_titulo())){
				c = curso;
				break;
			}
		}
		return c;
	}

}
