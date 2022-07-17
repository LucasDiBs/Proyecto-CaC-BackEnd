package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelos.Mensaje;
import modelos.Usuario;

/**
 * Servlet implementation class SigninController
 */
@WebServlet("/Signin")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/vistas/signin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String accion = request.getParameter("accion");
		String id = request.getParameter("id");
		String alias = request.getParameter("alias");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String codigoPostal = request.getParameter("codigoPostal");
		String email = request.getParameter("email");
		String clave = request.getParameter("clave");
		RequestDispatcher disp = null;
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tecnotiendadb", "root", "mysqlpas");
			String textoMsj = ""; //"El Registro ha sido exitoso"
			String statement = "";
			PreparedStatement pst = null;
			if(accion.equals("registrar")) {
				statement = "insert into usuarios (alias, nombre, apellido, codigo_postal, email, clave) values (?,?,?,?,?,?)";
				pst = con.prepareStatement(statement);
				
				pst.setString(1, alias);
				pst.setString(2, nombre);
				pst.setString(3, apellido);
				pst.setString(4, codigoPostal);
				pst.setString(5, email);
				pst.setString(6, clave);
				
				textoMsj = "El Registro ha sido exitoso";
				
			} else if(accion.equals("actualizar")) {
				statement = "update usuarios set alias=?, nombre=?, apellido=?, codigo_postal=?, email=?, clave=? where id = ?";
				pst = con.prepareStatement(statement);
				
				pst.setString(1, alias);
				pst.setString(2, nombre);
				pst.setString(3, apellido);
				pst.setString(4, codigoPostal);
				pst.setString(5, email);
				pst.setString(6, clave);
				pst.setLong(7, Long.parseLong(id));

				textoMsj = "El Registro ha sido actualizado";
				
				Usuario usuario = new Usuario(email, alias);				
				usuario.setId(Long.parseLong(id));
				usuario.setNombre(nombre);
				usuario.setApellido(apellido);
				usuario.setCodigoPostal(codigoPostal);
				usuario.setClave(clave);
				
				request.getSession().setAttribute("usuario", usuario);
			} else {
			}
			
			pst.executeUpdate();
			
			Mensaje mensaje;			
			mensaje  = new Mensaje("success", textoMsj, "Home");
			request.setAttribute("mensaje", mensaje);
			disp = request.getRequestDispatcher("/vistas/mensaje.jsp");
			disp.forward(request, response);
			
		} catch (SQLException e) {
			Mensaje mensaje;
			if (e.getErrorCode() == 1062) {
				mensaje  = new Mensaje("warning", "El email ya se encuentra registrado", "Signin");
				request.setAttribute("mensaje", mensaje);
				disp = request.getRequestDispatcher("/vistas/mensaje.jsp");
				disp.forward(request, response);
			} else {
				mensaje  = new Mensaje("danger", "Error, no fue posible procesar la informaicón.", "Signin");
				request.setAttribute("mensaje", mensaje);
				disp = request.getRequestDispatcher("/vistas/mensaje.jsp");
				disp.forward(request, response);
			}
			//response.getWriter().append(e.getMessage()).append("-").append(e.getSQLState()).append("-").append(e.getErrorCode()+"");
			//e.printStackTrace();
		} catch (ClassNotFoundException e) {
			response.getWriter().append(e.getMessage());
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
