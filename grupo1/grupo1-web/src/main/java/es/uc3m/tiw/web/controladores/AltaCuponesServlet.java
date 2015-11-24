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

import es.uc3m.tiw.model.Cupon;
import es.uc3m.tiw.model.Curso;
import es.uc3m.tiw.model.Promocion;

@WebServlet("/AltaCupones")
public class AltaCuponesServlet extends HttpServlet {
	private static final String ENTRADA_JSP = "/GestionCupones.jsp";
	private static final String GESTION_CUPONES_JSP = "/GestionCupones.jsp";
	private static final long serialVersionUID = 1L;
	private Cupon cupon;
	private ArrayList<Cupon> cupones;//La tabla de cupones de la BBDD
	private ArrayList<Curso> cursos;//La tabla de cursos de la BBDD
	private ArrayList<Promocion> promociones;//BBDD promociones
	private int new_IDCupon = 0;//El id del cupon que ira aumentando en +1 a medida que vayamos creando un cupon
	@Override
	//Inicializamos la tabla de cupones de la BBDD
	public void init() throws ServletException {
	
		cupones = new ArrayList<Cupon>();
		promociones = new ArrayList<Promocion>();
	
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(GESTION_CUPONES_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Coger los datos del cupon que el profesor quiere crear
		String nombreCurso = request.getParameter("nombreCurso");
		String precio1 = request.getParameter("precio");
		String tipo_cupon1 = request.getParameter("tipo_cupon");
		String fecha_fin = request.getParameter("fecha_fin");
		/*****/
		
		String mensaje ="";
		String pagina = "";
		pagina = GESTION_CUPONES_JSP;
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		
		//Recuperar la tabla de cursos del sistema de la BBDD
		cursos = (ArrayList<Curso>) context.getAttribute("cursos");
		
		
		//Comprobar que los datos almacenados en la peticion no estan vacios
		String m = comprobarCupon(nombreCurso, precio1, tipo_cupon1, fecha_fin);
		//Si el cupon a crear presenta todos los datos necesarios para crearlo, entonces:
		if (m == null || m == ""){
			int precio2 = Integer.parseInt(precio1);
			int tipo_cupon2 = Integer.parseInt(tipo_cupon1);
			//Coger el identificador del curso sobre el que se desea aplicar el cupon
			Curso c = cogerIdCurso(nombreCurso);
			//Creamos el cupon
			Cupon cupon = crearCupon(fecha_fin, 0, tipo_cupon2, c.getID_curso(), precio2);
			pagina = ENTRADA_JSP;
			//metemos el curso a matricular en el contexto para luego poder mostrar su informacion
			context.setAttribute("curso", c);
			//metemos la tabla de cupones en el contexto para poder utilizarla desde otras paginas
			context.setAttribute("cupones", cupones);
			
			//Las promociones tienen preferencia sobre los cupones
			if (promociones.isEmpty()) {
				//Comprobar que cursos tienen cupon y modificar su precio final
				comprobarCupon(cupones, cursos);
			}
			else {
				//Comprobar que cursos tienen promocion y modificar su precio final
				comprobarPromocion(promociones, cursos);
			}
			
			context.setAttribute("cursos", cursos);
		
		//Si falta algun dato de los introducidos por el formulario para crear el cupon, enviamos un mensaje de error a dicha pagina	
		}else{
			
			mensaje = m;
			request.setAttribute("mensaje", mensaje);
			context.setAttribute("cupon", cupon);
		}
			
			this.getServletContext().getRequestDispatcher(pagina).forward(request, response);
			
		
	}

	//Creamos el cupon
	private Cupon crearCupon(String fecha_fin, int id_profe, int tipo_cupon, int id_curso, int descuento) {
		Cupon c = new Cupon();
		c.setFecha_fin(fecha_fin);
		c.setId_profesor(id_profe);
		c.setTipo_descuento(tipo_cupon);
		c.setCod_curso(id_curso);
		c.setId_cupon(new_IDCupon);
		c.setDescuento(descuento);
		

		/* AÑADIR Cupon A LA TABLA DE Cupones */
		cupones.add(c);
		new_IDCupon++;
		return c;
	}


	//Comprobar que los datos almacenados en la peticion no estan vacios
	private String comprobarCupon(String nombrePromo, String precio, String tipo_promocion, String fecha_fin) {
		String m = "";
		
		if (nombrePromo.equals("") || precio.equals("") || tipo_promocion.equals("") || fecha_fin.equals("")) {
			m ="Fallo al crear nuevo cupon. ";
		}
		
		return m;
	}
	
	//Coger el id del curso para el que se quiere crear el cupon. Lo buscamos en la tabla de cursos de la BBDD
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
	
	private void comprobarCupon(ArrayList<Cupon> cupones, ArrayList<Curso> cursos) {
		for (Cupon cupon : cupones) {
			for (Curso curso : cursos) {
				if (cupon.getCod_curso()==curso.getID_curso()){
					int precioInicial = curso.getPrecio_inicial();
					int descuento = cupon.getDescuento();
					int tipoDescuento = cupon.getTipo_descuento();
					if (tipoDescuento==0) {
						curso.setPrecio_final(precioInicial-descuento);
						curso.setFechaFinDescuento(cupon.getFecha_fin());
					}
					else{
						
						int descuentoTotal = (int) (precioInicial-((descuento*0.01)*precioInicial));
						curso.setPrecio_final(descuentoTotal);
						curso.setFechaFinDescuento(cupon.getFecha_fin());
					}
					
					break;
				}
				
			}
			
		}
	}
	
	private void comprobarPromocion(ArrayList<Promocion> promociones, ArrayList<Curso> cursos) {
		Promocion promo=promociones.get(0);
			for (Curso curso : cursos) {
				int precioInicial = curso.getPrecio_inicial();
				int descuento = promo.getDescuento();
				int tipoDescuento = promo.getTipo_promo();
				if (tipoDescuento==0) {
					curso.setPrecio_final(precioInicial-descuento);
				}
				else{
					
					int descuentoTotal = (int) (precioInicial-((descuento*0.01)*precioInicial));
					curso.setPrecio_final(descuentoTotal);
					
				}
				
				curso.setFechaFinDescuento(promo.getFecha_fin());
				
			}
			
		}

}