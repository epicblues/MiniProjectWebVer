package com.phonebook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.phonebook.dao.PhoneBookDAO;
import com.phonebook.dao.PhoneBookDAOImpl;
import com.phonebook.vo.PhoneBookVO;

public class ControllerServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		if("insert".equals(actionName)) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/phonebook/insert.jsp");
			rd.forward(req, resp);
		} else if("modal".equals(actionName)){
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getList();
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/includes/modal.jsp");
			rd.forward(req, resp);
		} else {
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getList();
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		}
		
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		PhoneBookDAO dao = new PhoneBookDAOImpl();
		if ("insert".equals(actionName)) {
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String tel = req.getParameter("tel");

			PhoneBookVO vo = new PhoneBookVO(name, hp, tel);
			boolean result = dao.insert(vo);
			if (result) {
				
				resp.sendRedirect(req.getContextPath() + "/?a=modal");
			}
		} else if ("delete".equals(actionName)) {
			Long id = Long.parseLong(req.getParameter("id"));
			boolean result = dao.delete(id);
			if (result) {
				resp.sendRedirect(req.getContextPath() + "/");
			}
		} else if ("search".equals(actionName)) {
			String keyword = req.getParameter("search");
			List<PhoneBookVO> list = dao.search(keyword);
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath());
		}
	}
}
