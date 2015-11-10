package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;

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

/**
 * Servlet implementation class AñadirCurso
 */
@WebServlet("/AnadirMatricula")
public class AnadirMatriculaServlet extends HttpServlet {
	private static final String MISCURSOS_JSP = "/misCursos.jsp";
	private ArrayList<Matricula> matriculas;//tabla matriculas
	private ArrayList<Curso> cursos;//tabña cursos
	private ArrayList<Usuario> usuarios;//tabla usuarios
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirMatriculaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    @Override
	public void init() throws ServletException {
		
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		ServletContext context = sesion.getServletContext();
		
		//Recuperar todas las BBDD del sistema
		cursos = (ArrayList<Curso>) context.getAttribute("cursos");
		usuarios = (ArrayList<Usuario>) context.getAttribute("usuarios");
		matriculas = (ArrayList<Matricula>) context.getAttribute("matriculas");
		
		//Coger el titulo del curso y coger su ID
		String nombreCurso = (String) context.getAttribute("nombreCurso");
		Curso cursoMatricular = cogerIdCurso(nombreCurso);
		int cod_curso = cursoMatricular.getID_curso();
		
		//Coger el precio final del curso de la BBDD
		int precio_pagado = cursoMatricular.getPrecio_final();
		
		//Coger el ID del usuario
		Usuario user = (Usuario) context.getAttribute("usuario");
		int cod_alumno = user.getID_usuario();
		
		//Crear la nueva matricula y metela en la BBDD de matriculas
		Matricula matriculaNueva = new Matricula(cod_alumno, cod_curso, precio_pagado);
		matriculas.add(matriculaNueva);
		context.setAttribute("matriculas", matriculas);
		this.getServletContext().getRequestDispatcher(MISCURSOS_JSP).forward(request, response);

		// TODO Auto-generated method stub
	
		
	}

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
