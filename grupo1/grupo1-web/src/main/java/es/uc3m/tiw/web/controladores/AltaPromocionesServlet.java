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
import es.uc3m.tiw.web.dominio.Promocion;

@WebServlet("/AltaPromociones")
public class AltaPromocionesServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/GestionPromociones.jsp";
	private static final String GESTION_CURSOS_JSP = "/GestionPromociones.jsp";
	private static final long serialVersionUID = 1L;
	private Promocion promocion;
	private ArrayList<Promocion> promociones;//Coger tabla promociones de la BBDD
	private int new_IDPromo = 0;//El id de cada promocion. Aumenta en +1 a medida que creamos una promo
	@Override
	//Inicializamos la tabla de promociones de la BBDD
	public void init() throws ServletException {
	
		promociones = new ArrayList<Promocion>();
		
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
		
		//Coger los datos de la promocion que el admin quiere crear
		String nombrePromo = request.getParameter("nombrePromo");
		String precio1 = request.getParameter("precio");
		String tipo_promocion1 = request.getParameter("tipo_promocion");
		String fecha_fin = request.getParameter("fecha_fin");
		
		String mensaje ="";
		String pagina = "";
		pagina = GESTION_CURSOS_JSP;
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		
		//Comprobar que los datos almacenados en la peticion no estan vacios
		String m = comprobarPromocion(nombrePromo, precio1, tipo_promocion1, fecha_fin);
		//Si la promocion a crear presenta todos los datos necesarios para crearla, entonces:
		if (m == null || m == ""){
			int precio2 = Integer.parseInt(precio1);
			int tipo_promocion2 = Integer.parseInt(tipo_promocion1);
			//Creamos la promocion
			Promocion p = crearPromocion(nombrePromo, precio2, tipo_promocion2, fecha_fin);
			pagina = ENTRADA_JSP;
			//metemos la tabla de promociones en el contexto para poder utilizarla desde otras paginas
			context.setAttribute("promociones", promociones);
			//metemos la promocion  en el contexto para poder mostar su informacion en las paginas de promociones creadas (GestionPromociones)
			context.setAttribute("promocion", promocion);
			
			//Si falta algun dato de los introducidos por el formulario para crear la promocion, enviamos un mensaje de error a dicha pagina	
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
			context.setAttribute("promocion", promocion);
		}
			
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}
	//Creamos la promocion
	private Promocion crearPromocion(String nombrePromo, int precio, int tipo_promocion, String fecha_fin) {
		Promocion p = new Promocion();
		
		p.setNombrePromo(nombrePromo);
		p.setId_promo(new_IDPromo);
		p.setDescuento(precio);
		p.setTipo_promo(tipo_promocion);
		p.setFecha_fin(fecha_fin);

		/* AÑADIR Promocion A LA TABLA DE Promociones */
		promociones.add(p);
		new_IDPromo++;
		
		return p;
	}


	//Comprobar que los datos almacenados en la peticion no estan vacios
	private String comprobarPromocion(String nombrePromo, String precio, String tipo_promocion, String fecha_fin) {
		String m = "";
		
		if (nombrePromo.equals("") || precio.equals("") || tipo_promocion.equals("") || fecha_fin.equals("")) {
			m ="Fallo al crear nuevo cupon. ";
		}
		
		return m;
	}

}