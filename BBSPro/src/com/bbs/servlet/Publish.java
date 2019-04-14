package com.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Essay;
import com.bbs.bean.User;
import com.bbs.dao.EssayDao;

public class Publish extends HttpServlet {

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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		EssayDao edao = new EssayDao();
		List<Essay> lst = edao.findAllEssay();
		request.getSession().setAttribute("essays", lst);
		response.sendRedirect("front/index.jsp");
		
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
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		Date date = new Date();
		User user = (User)request.getSession().getAttribute("user");
		Essay e = new Essay(user.getUid(), title, cont, date);
		boolean flag = new EssayDao().add(e);
		if(flag){
			out.write("<script>alert('提交成功');window.location.href='Publish';</script>");
		}else{
			out.write("<script>alert('提交失败，请重试');history.go(-1);</script>");
			return;
		}
	}

}
