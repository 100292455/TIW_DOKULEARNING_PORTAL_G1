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
import es.uc3m.tiw.web.dominio.Leccion;
import es.uc3m.tiw.web.dominio.Seccion;

@WebServlet("/AltaLeccion")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50,
location = "/")   // 50MB
public class AltaLeccionServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/gestionlecciones.jsp";
	private static final String GESTION_CURSOS_JSP = "/contenidoCurso.jsp";
	private static final long serialVersionUID = 1L;
	private Leccion leccion;
	ServletContext context;
	private ArrayList<Leccion> lecciones;
	private int new_IDLeccion = 0;
	@Override
	public void init() throws ServletException {
	
		context= this.getServletConfig().getServletContext();
		lecciones=(ArrayList<Leccion>) context.getAttribute("lecciones");
		
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(GESTION_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		context= this.getServletConfig().getServletContext();
		
		String titulo = request.getParameter("titulo");
		String formato = request.getParameter("formato");
		String descripcion= request.getParameter("descripcion");
		 
		int id_seccion= (int) context.getAttribute("idseccion");
		
		Seccion seccionactual=(Seccion) context.getAttribute("seccion_actual");
		String nombreseccionactual=seccionactual.getNombre();
		context.setAttribute("nombreseccionactual",nombreseccionactual);
		
		
		
		/*****/
		
		String mensaje ="";
		String pagina = "";
		pagina = ENTRADA_JSP;
		
	
		String m = comprobarLeccion(titulo, descripcion, formato);
		if (m == null || m == ""){
		  
			
		
			Leccion c = crearLeccion(titulo, descripcion,formato,id_seccion);
			
			
			
			pagina = GESTION_CURSOS_JSP;
			context.setAttribute("lecciones", lecciones);
			context.setAttribute("leccion", c);
			
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
			context.setAttribute("lecciones", lecciones);
		}
			
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	private Leccion crearLeccion(String titulo, String descripcion, String formato, int id_seccion) {
		Leccion c = new Leccion();
		
	c.setTitulo(titulo);
	c.setDes(descripcion);
	c.setFormato(formato);
	c.setId_seccion(id_seccion);
	c.setId_leccion(new_IDLeccion);
	
		/* AÑADIR CURSO A LA TABLA DE CURSOS */
		lecciones.add(c);
		new_IDLeccion++;
		
		return c;
	}



	private String comprobarLeccion(String titulo, String descripcion, String formato) {
		String m = "";
		
		if (titulo.equals("") || titulo.equals(null) || descripcion.equals("") || descripcion.equals(null)) {
			m ="Fallo al crear nuevo curso. ";
		}
		
		return m;
	}

}