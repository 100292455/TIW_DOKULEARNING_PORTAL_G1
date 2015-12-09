
package es.uc3m.tiw.web.controladores;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletConfig;
import javax.transaction.UserTransaction;

import es.uc3m.tiw.model.Usuario;
import es.uc3m.tiw.model.dao.CursoDAOImpl;
import es.uc3m.tiw.model.dao.DeseoDAOImpl;
import es.uc3m.tiw.model.dao.MatriculaDAOImpl;
import es.uc3m.tiw.model.dao.UsuarioDAO;
import es.uc3m.tiw.model.dao.UsuarioDAOImpl;
import es.uc3m.tiw.model.Usuario;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50,
location = "/")   // 50MB
public class UploadServlet extends HttpServlet {
	private static final String MIS_CURSOS_JSP = "/miPerfilAlumno.jsp";
	private static final long serialVersionUID = 1L;
	 /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "usuarios-img";
	@PersistenceContext(unitName = "demoTIW")
	private EntityManager em;
	@Resource
	private UserTransaction ut;
	private ServletConfig config2;
	private UsuarioDAO usDao;
     
	@Override
	public void init(ServletConfig config) throws ServletException {
		config2 = config;
		usDao = new UsuarioDAOImpl(em, ut);

	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		usDao = null;
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
			 // gets absolute path of the web application
	        String appPath = request.getServletContext().getRealPath("/images");
	        // constructs path of the directory to save uploaded file
	        String savePath = appPath + File.separator + SAVE_DIR;
			HttpSession sesion = request.getSession(true);
			Usuario usuario = (Usuario)sesion.getAttribute("usuario");
			int idUsuario = usuario.getID_usuario();
	         
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("empresa");
			String telefono = request.getParameter("telefono");
			String correo = request.getParameter("correo");
			String descripcion = request.getParameter("descripcion");
			String intereses = request.getParameter("intereses");
			Part filePart = request.getPart("file");

			
			String m = comprobarCurso(nombre, apellido, telefono, correo);
			if (m == null || m.equals( "")){
				
				// creates the save directory if it does not exists
				// creates the save directory if it does not exists
		        File fileSaveDir = new File(savePath);
		        if (!fileSaveDir.exists()) {
		            fileSaveDir.mkdir();
		        }
		         
				
				 usuario = actualizarUsuario(nombre, apellido, telefono, correo, usuario, descripcion, intereses);
				sesion.setAttribute("usuario", usuario);

				
				
			}else{
				
				mensaje = m;
				request.setAttribute("mensaje", mensaje);
			}
			config2.getServletContext().getRequestDispatcher(pagina).forward(request, response);

			
		
	}

	private Usuario actualizarUsuario(String nombre, String apellido, String telefono, String correo, Usuario usuario, String descripcion, String intereses) {
		
		if(!usuario.getEmail().equals(correo)){
			Usuario u = null;
			try {
				u=usDao.buscarPorEmail(correo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (u == null) {
			usuario.setEmail(correo);
			}
		}
		
		usuario.setApellido(apellido);
		usuario.setNombre(nombre);
		usuario.setTelefono(telefono);
		usuario.setDescripcion(descripcion);
		usuario.setIntereses(intereses);
		
		try {
			usuario=usDao.modificarUsuario(usuario);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return usuario;
	}

	private String comprobarCurso(String nombre, String apellido, String telefono, String correo) {
		String m = "";
		
		if (nombre.equals("") || nombre ==null || apellido.equals("") || apellido == null || telefono.equals("") || telefono == null || correo.equals("") || correo == null) {
			m ="Fallo al actualizar. ";
		}
		
		return m;
	}

}
