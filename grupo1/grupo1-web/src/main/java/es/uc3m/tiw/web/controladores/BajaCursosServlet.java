package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.Collection;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import es.uc3m.tiw.model.Curso;
import es.uc3m.tiw.model.Cupon;
import es.uc3m.tiw.model.Promocion;
import es.uc3m.tiw.model.Usuario;
import es.uc3m.tiw.model.dao.CuponDAO;
import es.uc3m.tiw.model.dao.CuponDAOImpl;
import es.uc3m.tiw.model.dao.CursoDAO;
import es.uc3m.tiw.model.dao.CursoDAOImpl;
import es.uc3m.tiw.model.dao.PromocionDAO;
import es.uc3m.tiw.model.dao.PromocionDAOImpl;

@WebServlet("/BajaCursos")
public class BajaCursosServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/GestionCursos.jsp";
	private static final String GESTION_CURSOS_JSP = "/GestionCursos.jsp";
	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName = "demoTIW")
	private EntityManager em;
	@Resource
	private UserTransaction ut;
	private ServletConfig config2;
	private PromocionDAO promDao;
	private CuponDAO cupDao;
	private CursoDAO curDao;
	@Override
	public void init(ServletConfig config) throws ServletException {
		config2 = config;
		cupDao = new CuponDAOImpl(em, ut);
		curDao = new CursoDAOImpl(em, ut);
		promDao = new PromocionDAOImpl(em, ut);

	}
	
	public void destroy() {
		cupDao = null;
		curDao = null;
		promDao = null;
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		config2.getServletContext().getRequestDispatcher(GESTION_CURSOS_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* Cuando el profesor clique en BORRAR CURSO, eliminamos el curso del arrayList 'cursos'. Habria que eliminarlo de la BBDD */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		String idCursoStr = request.getParameter("IdCurso");
		int idCurso = Integer.parseInt(idCursoStr);
		Curso curso=curDao.recuperarCursoPorPK(idCurso);
		try {
			curDao.borrarCurso(curso);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Collection<Curso> listadoCursos = curDao.buscarTodosLosCursos();
		pagina = ENTRADA_JSP;
		sesion.setAttribute("cursos", listadoCursos);
		config2.getServletContext().getRequestDispatcher(pagina).forward(request, response);
		
	}

}