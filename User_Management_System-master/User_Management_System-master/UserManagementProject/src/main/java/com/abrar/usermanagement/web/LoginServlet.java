package com.abrar.usermanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		if(email.equals("Abrar@gmail.com") && pass.equals("abrar"))
		{
			HttpSession session =request.getSession();
			session.setAttribute("session_id", email);
			response.sendRedirect("UserServlet");
		}
		else
		{
			response.sendRedirect("login_page.jsp");
		}
		
	}

	

}
