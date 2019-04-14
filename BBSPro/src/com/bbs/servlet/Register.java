package com.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.User;
import com.bbs.dao.UserDao;

public class Register extends HttpServlet {

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String uname = request.getParameter("uname");
		boolean flag = new UserDao().checkName(uname);
		if(flag){
			out.print("<script>alert('用户名已被占用');history.go(-1);</script>");
		}else{
			out.print("<script>alert('用户名可以使用');history.go(-1);</script>");
		}
		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		int role = Integer.parseInt(request.getParameter("role"));
		String phone = request.getParameter("phone");
		String real_name = request.getParameter("real_name");
		String stuid = request.getParameter("sid");
		String img = request.getParameter("img");
		UserDao udao = new UserDao();
		User u = new User(name,pwd,role,img,phone,real_name,stuid);
		boolean flag = udao.add(u);
		if(flag){
			out.write("<script>alert('注册成功');</script>");
			request.getSession().setAttribute("user", udao.login(u));
			response.sendRedirect("front/index.jsp");
		}else{
			out.write("<script>alert('注册失败，请重试');history.go(-1);</script>");
			return;
		}
	}

}
