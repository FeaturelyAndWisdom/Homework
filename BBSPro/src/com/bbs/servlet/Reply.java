package com.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bean.Comment;
import com.bbs.bean.Essay;
import com.bbs.bean.User;
import com.bbs.dao.CommentDao;
import com.bbs.dao.EssayDao;

public class Reply extends HttpServlet {

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
		int eid = Integer.parseInt(request.getParameter("eid"));
		EssayDao edao = new EssayDao();
		Map<Essay, List<Comment>> map = edao.findCommentById(eid);
		edao.readNumAdd(eid);
		request.setAttribute("map", map);
		request.getRequestDispatcher("front/detail.jsp").forward(request, response);;
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
		String cont = request.getParameter("repcont");
		int eid = Integer.parseInt(request.getParameter("eid"));
		User user = (User) request.getSession().getAttribute("user");
		CommentDao cdao = new CommentDao();
		boolean flag = cdao.add(new Comment(user.getUid(), eid, cont, new Date()));
		if(flag){
			out.write("<script>alert('回复成功');window.location='Reply?eid="+eid+"';</script>");
		}else{
			out.write("<script>alert('回复失败，请稍后重试');history.go(-1);</script>");
		}
	}

}
