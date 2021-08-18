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
	PhoneBookDAO dao = new PhoneBookDAOImpl();
	if(actionName == null) {
		List<PhoneBookVO> list = dao.getList();
		req.setAttribute("list", list);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(req, resp);
	}
}
}
