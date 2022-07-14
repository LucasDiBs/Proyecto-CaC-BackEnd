package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList; // import the ArrayList class
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelos.Producto;

/**
 * Servlet implementation class ProductosController
 */
@WebServlet("/Home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		HttpSession session= request.getSession(true);
		RequestDispatcher disp = null;		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tecnotiendadb", "root", "mysqlpas");
			final String QUERY = "select * from productos where destacado limit 3"; //es equivalente a destacado = true
			PreparedStatement ps = con.prepareStatement(QUERY);
			ResultSet rs = ps.executeQuery();
			
			List<Producto> productosDestacados = new ArrayList<Producto>();
			Producto producto;
			while (rs.next()) {
				producto = new Producto(rs.getLong("id"), rs.getString("nombre"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setImg(rs.getString("img"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setStock(rs.getInt("stock"));
				producto.setDestacado(rs.getBoolean("destacado"));
				producto.setCategoria(rs.getString("categoria"));
				
				productosDestacados.add(producto);

			}
//			session.setAttribute("productosDestacados", productosDestacados);				
			request.setAttribute("productosDestacados", productosDestacados);				
			disp = request.getRequestDispatcher("index.jsp");
			disp.forward(request, response);
			
		} catch (Exception e) {
			response.getWriter().append(e.getMessage());
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
