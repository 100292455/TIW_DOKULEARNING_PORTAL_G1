package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Cupon;
import es.uc3m.tiw.web.dominio.Curso;
import es.uc3m.tiw.web.dominio.CursoDescuento;
import es.uc3m.tiw.web.dominio.Matricula;
import es.uc3m.tiw.web.dominio.Promocion;
import es.uc3m.tiw.web.dominio.Usuario;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final String LISTADOCURSOS_JSP = "/listadoCursos.jsp";
	private static final String LOGIN_JSP = "/login.jsp";
	private static final long serialVersionUID = 1L;
	private Usuario usuario;
	private Matricula matricula;
	private Curso curso;
	private Promocion promocion;
	private Cupon cupon;
	private ArrayList<Matricula> matriculas;//BBDD matriculas
	private ArrayList<Curso> cursos;//BBDD cursos
	private ArrayList<Usuario> usuarios;//BBDD usuarios
	private ArrayList<Promocion> promociones;//BBDD promociones
	private ArrayList<Cupon> cupones;//BBDD cupones

	
	
	
	@Override
	public void init() throws ServletException {
	
		//Creando BBDD usuario
		usuario = new Usuario(1,"David", "dd", "david", "clave");
		Usuario usuario2 = new Usuario(2, "Juan", "perez", "juan", "12345678");
		Usuario usuario3 = new Usuario(3, "Daniel", "Garcia", "dani", "12345678");
		usuarios = new ArrayList<Usuario>();
		usuarios.add(usuario);
		usuarios.add(usuario2);
		usuarios.add(usuario3);
		
		//Crear BBDD matriculas
		matricula = new Matricula(1, 1, 20);
		Matricula matricula1 = new Matricula(2, 2, 20);
		Matricula matricula2 = new Matricula(3, 3, 20);
		matriculas = new ArrayList<Matricula>();
		matriculas.add(matricula);
				
		//Crear BBDD cursos
		Curso curso = new Curso(1, "tituloCurso1", "descripcionCurso1", 2, 2, 30, 30, 3, 3, 3);
		Curso curso1 = new Curso(2, "tituloCurso2", "descripcionCurso2", 2, 2, 30, 30, 3, 3, 3);
		Curso curso2 = new Curso(3, "tituloCurso3", "descripcionCurso3", 2, 2, 30, 30, 3, 3, 3);
		Curso curso3 = new Curso(4, "tituloCurso4", "descripcionCurso4", 2, 2, 30, 30, 3, 3, 3);
		cursos = new ArrayList<Curso>();
		cursos.add(curso);
		cursos.add(curso1);
		cursos.add(curso2);
		cursos.add(curso3);
		
		//Crear BBDD promociones
		Promocion promo = new Promocion(1, new Date(), 7, 1);
		promociones = new ArrayList<Promocion>();
		promociones.add(promo);
				
		//Crear BBDD cupones
		Cupon cuponPorcentaje = new Cupon(2, new Date(), 4, 50, "porcentaje", 2);
		Cupon cuponPrecioFijo = new Cupon(3, new Date(), 4, 20, "fijo", 3);
		cupones = new ArrayList<Cupon>();
		cupones.add(cuponPorcentaje);
		cupones.add(cuponPrecioFijo);
		
	}
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String user = request.getParameter("usuario");
		String password = request.getParameter("password");
		HttpSession sesion = request.getSession();
		ServletContext context = sesion.getServletContext();
		
		//Comprobar que el usuario esta registrado en el sistema
		Usuario u = comprobarUsuario(user, password);
		//Meter usuario en el contexto
		context.setAttribute("usuario", u);
		//Comprobar que cursos tienen cupon y modificar su precio final
		comprobarCupon(cupones, cursos);
		//Comprobar que cursos tienen promocion y modificar su precio final
		comprobarPromocion(promociones, cursos);
		
		//Meter en BBDD del sistema cada una de las BBDD's
		context.setAttribute("usuarios", usuarios);
		context.setAttribute("cursos", cursos);
		context.setAttribute("matriculas", matriculas);
		context.setAttribute("promociones", promociones);
		context.setAttribute("cupones", cupones);
		

		//Redirigir a la pagina donde aparecen todos los cursos disponibles
		this.getServletContext().getRequestDispatcher(LISTADOCURSOS_JSP).forward(request, response);
		
			
			
	}
	
	//Comprobar que el usuario esta en la BBDD del sistema
	private Usuario  comprobarUsuario(String user, String password) {
		Usuario u = null;
		for (Usuario usuario : usuarios) {
			if (user.equals(usuario.getUsuario()) && password.equals(usuario.getPassword())){
				u = usuario;
				break;
			}
		}
		return u;
	}
	
	private void comprobarCupon(ArrayList<Cupon> cupones, ArrayList<Curso> cursos) {
		for (Cupon cupon : cupones) {
			for (Curso curso : cursos) {
				if (cupon.getCod_curso()==curso.getID_curso()){
					int precioInicial = curso.getPrecio_inicial();
					int descuento = cupon.getDescuento();
					String tipoDescuento = cupon.getTipo_descuento();
					if (tipoDescuento.equals("fijo")) {
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
		for (Promocion promo : promociones) {
			for (Curso curso : cursos) {
				if (promo.getCod_curso()==curso.getID_curso()){
					int precioInicial = curso.getPrecio_inicial();
					int descuento = promo.getDescuento();
					curso.setPrecio_final(precioInicial-descuento);
					curso.setFechaFinDescuento(promo.getFecha_fin());
					break;
				}
				
			}
			
		}
	}

}
