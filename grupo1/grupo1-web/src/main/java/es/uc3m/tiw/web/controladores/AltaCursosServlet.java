package es.uc3m.tiw.web.controladores;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import es.uc3m.tiw.web.dominio.Curso;

@WebServlet("/AltaCursos")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50,
location = "/")   // 50MB
public class AltaCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/misCursos.jsp";
	private static final String MIS_CURSOS_JSP = "/misCursos.jsp";
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "cursoImages";
	private int new_IDCurso = 10;
	@Override
	public void init() throws ServletException {
	

	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		this.getServletContext().getRequestDispatcher(MIS_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String pagina = MIS_CURSOS_JSP;
			String mensaje ="";
			
			//no se pierda la pestaña
			request.setAttribute("selectedTab", "1");
			String titulo = request.getParameter("titulo");
			String descripcion = request.getParameter("descripcion");
			String dificultadStr = request.getParameter("dificultad");
			String horasStr = request.getParameter("horas");
			String precioStr = request.getParameter("precio");		
			String codProfStr = "10";
			
			String m = comprobarCurso(titulo, descripcion, dificultadStr, horasStr, precioStr);
			if (m == null || m == ""){
				int dificultad = Integer.parseInt(dificultadStr);
				int horas = Integer.parseInt(horasStr);
				int precio = Integer.parseInt(precioStr);  
				int codProf = Integer.parseInt(codProfStr);
				
				HttpSession sesion = request.getSession(true);
				ArrayList<Curso> cursoscreados = (ArrayList<Curso>) sesion.getAttribute("cursoscreados");
				crearCurso(titulo, descripcion, dificultad, horas, precio, codProf, cursoscreados);
				sesion.setAttribute("cursoscreados", cursoscreados);

				
				
			}else{
				
				mensaje = m;
				request.setAttribute("mensaje", mensaje);
			}
			
				this.getServletContext().getRequestDispatcher(pagina).forward(request, response);

			
		
	}

	private Curso crearCurso(String titulo, String descripcion, int dificultad, int horas, int precio, int profesor, ArrayList<Curso> cursoscreados) {
		Curso c = new Curso();
		
		c.setCOD_profesor(profesor);
		c.setDES_descripcion(descripcion);
		c.setDES_titulo(titulo);
		c.setHoras(horas);
		c.setID_curso(new_IDCurso);
		c.setPrecio_final(precio);
		c.setPrecio_inicial(precio);
		c.setTIPO_destacado(0);
		c.setTIPO_dificultad(dificultad);
		c.setTIPO_estado(0);
		cursoscreados.add(c);
		/* AÑADIR CURSO A LA TABLA DE CURSOS */
		new_IDCurso++;
		
		return c;
	}



	private String comprobarCurso(String titulo, String descripcion, String dificultad, String horas, String precio) {
		String m = "";
		
		if (titulo.equals("") || titulo.equals(null) || descripcion.equals("") || descripcion.equals(null) || dificultad.equals("-1") || horas.equals("") || horas.equals(null) || precio.equals("") || precio.equals(null) ) {
			m ="Fallo al crear nuevo curso. ";
		}
		
		return m;
	}

}