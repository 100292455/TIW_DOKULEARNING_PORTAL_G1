package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.Collection;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import es.uc3m.tiw.model.Curso;
import es.uc3m.tiw.model.Matricula;
import es.uc3m.tiw.model.Mensaje;
import es.uc3m.tiw.model.Usuario;
import es.uc3m.tiw.model.dao.MatriculaDAO;
import es.uc3m.tiw.model.dao.MatriculaDAOImpl;
import es.uc3m.tiw.model.dao.MensajeDAOImpl;
import es.uc3m.tiw.web.jms.EscribirEnQueue;
/**
 * Servlet implementation class MensajesServlet
 */
@WebServlet("/mensajes")
public class MensajesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "demoTIW")
	private EntityManager em;
	@Resource
	private UserTransaction ut;
	private MensajeDAOImpl msgDao;
	private MatriculaDAO matDao;
	@Inject
	private EscribirEnQueue colaMensajes;
       

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		msgDao = new MensajeDAOImpl(em, ut);
		matDao = new MatriculaDAOImpl(em, ut);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		/*CARGAR LOS MENSAJES*/
		
		HttpSession sesion = request.getSession();
		
		/*Recuperamos de la sesion el curso del foro*/
		Curso c = (Curso) sesion.getAttribute("curso");
		
		/*Recuperamos de la BBDD los matriculados y los mensajes del curso*/
		Collection<Mensaje> mensajes = msgDao.recuperarMensajePorCurso(c.getID_curso());
		Collection<Matricula> matriculas = matDao.recuperarMatriculaPorCurso(c.getID_curso());
		
		/*Enviamos a la vista los mensajes y los matriculados*/
		request.setAttribute("listaMensajes", mensajes);
		request.setAttribute("matriculascursoactual", matriculas);
		
		/*Dispahcher*/
		this.getServletContext().getRequestDispatcher("/Foro.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		
		/*Recuperamos el usuario y el curso de sesion*/
		Usuario u = (Usuario) sesion.getAttribute("usuario");
		Curso c = (Curso) sesion.getAttribute("curso");

		/*Recuperamos el mensaje*/
		String mensaje = request.getParameter("mensaje");

		/*Creamos un mensaje con el contenido, el emisor y el curso del foro y lo metemos en la cola*/
		Mensaje msg = new Mensaje(mensaje,u, c);
		colaMensajes.enviar(msg);
		
		Collection<Mensaje> mensajes = msgDao.recuperarMensajePorCurso(c.getID_curso());
		request.setAttribute("listaMensajes", mensajes);
		
		this.getServletConfig().getServletContext().getRequestDispatcher("/Foro.jsp").forward(request, response);
		
		
		
	
	}

}
