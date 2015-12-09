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
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import es.uc3m.tiw.model.Curso;
import es.uc3m.tiw.model.Mensaje;
import es.uc3m.tiw.model.Usuario;
import es.uc3m.tiw.model.dao.CursoDAOImpl;
import es.uc3m.tiw.model.dao.MensajeDAOImpl;
import es.uc3m.tiw.model.dao.UsuarioDAOImpl;
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
	private UsuarioDAOImpl usDao;
	private CursoDAOImpl curDao;
	@Inject
	private EscribirEnQueue colaMensajes;
       

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		msgDao = new MensajeDAOImpl(em, ut);
		usDao = new UsuarioDAOImpl(em,ut);
		curDao = new CursoDAOImpl(em,ut);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession sesion = request.getSession();
		Curso c = (Curso) sesion.getAttribute("curso");
		Collection<Mensaje> mensajes = msgDao.recuperarMensajePorCurso(c.getID_curso());
		request.setAttribute("listaMensajes", mensajes);
		this.getServletContext().getRequestDispatcher("/Foro.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession sesion = request.getSession();
		String mensaje = request.getParameter("mensaje");
		Usuario u = usDao.buscarPorEmail("carlos@uc3m.es");
		int numero = 3;
		Curso c = curDao.recuperarCursoPorPK(numero);
		Mensaje msg = new Mensaje(mensaje,u, c);
	
		
		colaMensajes.enviar(msg);
		
		this.getServletConfig().getServletContext().getRequestDispatcher("/Foro.jsp").forward(request, response);
		
		
		
	
	}

}
