package com.abrar.usermanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.abrar.usermanagement.bean.User;
import com.abrar.usermanagement.dao.UserDao;

@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao dao_obj=null;
	public void init() {
		dao_obj = new UserDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getServletPath();
		
		PrintWriter pw=response.getWriter();
		pw.println("Abrar");
		
		
		
		switch(action)
		{
			case "/new" :
			{
				showNewForm(request,response);
				break;
			}
			
			case "/insert":
			{
				try {
					insert(request,response);
				} catch (IOException | ServletException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			
			case "/delete":
			{
				try {
					deleteUser(request,response);
				} catch (SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			
			case "/update":
			{
				try {
					update(request,response);
				} catch (SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "/edit":
			{
				try {
					showeditForm(request,response);
				} catch (SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			
			default :
			{
				try {
					listUser(request,response);
				} catch (SQLException | IOException | ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
		}

		
	}
	
	protected void showNewForm(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		jakarta.servlet.RequestDispatcher rd=request.getRequestDispatcher("User-form.jsp");
		rd.forward(request, response);
	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException,SQLException
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String country=request.getParameter("country");
		
		User user=new User(name,email,country);
		
		dao_obj.insertUser(user);
		
		response.sendRedirect("list");
		
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException 
	{
		int id = Integer.parseInt(request.getParameter("id"));
		dao_obj.deleteUser(id);
		response.sendRedirect("list");

	}
	
	private void update(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException 
	{
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");

		User upd_user = new User(id, name, email, country);
		dao_obj.updateUser(upd_user);
		response.sendRedirect("list");
	}
	
	private void showeditForm(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException 
	{
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = dao_obj.selectUsersById(id);
		jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("User-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException 
	{
		List<User> al=dao_obj.selectAllUsers();
		
		request.setAttribute("listUsers", al);
		jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("User-list.jsp");
		
		dispatcher.forward(request, response);
		
		
	}

	

}
