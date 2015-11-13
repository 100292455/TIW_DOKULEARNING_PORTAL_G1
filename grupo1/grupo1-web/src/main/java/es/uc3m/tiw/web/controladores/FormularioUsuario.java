package es.uc3m.tiw.web.controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.uc3m.tiw.web.dominio.Usuario;


/**
 * Servlet implementation class FormularioUsuario
 */
@WebServlet("/FormularioUsuario")
public class FormularioUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormularioUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    /**Validate email **/
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nombre=request.getParameter("nombre");
		String apellido=request.getParameter("apellidos");
		String sexo=request.getParameter("sex");
		String email=request.getParameter("correo");
		String tel=request.getParameter("telefono");
		String cobro=request.getParameter("cobro");	
		String descripcion=request.getParameter("descripcion");
		String password=request.getParameter("password");
		
		if (nombre == "" || nombre == null){
			System.out.println("No ha llegado la variable nombre correctamente al servlet");
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (apellido == "" || apellido == null){
			System.out.println("No ha llegado la variable apellido correctamente al servlet");
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (email == "" || email == null){
			System.out.println("No ha llegado la variable email correctamente al servlet");
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
		if (tel == "" || tel == null){
			System.out.println("No ha llegado la variable telefono correctamente al servlet");
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
	
		
		if (password == "" || password == null){
			System.out.println("No ha llegado la variable password codigo postal correctamente al servlet");
			request.getRequestDispatcher("formulario-usuario.jsp");
		}
		
	
		
		
		
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		Usuario usuario = new Usuario();
		
		usuario.nombre=nombre;
		usuario.apellido=apellido;
		PrintWriter out = response.getWriter();
		out.println("rol antes" + descripcion);
		out.println("sexoantes" + sexo);
		
		
		
		if(sexo.equals("hombre")){
			
			usuario.sexo=1;
		}
		if(sexo.equals("mujer")){
			
			usuario.sexo=0;
		}
	
		usuario.email=email;
		usuario.telefono=tel;
		usuario.medio_cobro=cobro;
	
		
		if(cobro.equals("otros")){
			
			usuario.tipo_usuario=0;
		}else{
			
			usuario.tipo_usuario=1;
		}
		
	
		usuario.clave=password;


		
		usuarios.add(usuario);
		
		HttpSession sesion = request.getSession();	
		ServletContext context = sesion.getServletContext();
		
	    context.setAttribute("usuarios", usuarios);
		
		
			this.getServletContext().getRequestDispatcher("/miPerfilAlumno.jsp").forward(request, response);
			
		
	
		
	}

}
