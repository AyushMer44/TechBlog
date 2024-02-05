package com.techBlogServlets;

import com.techBlogEntites.Message;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter out = resp.getWriter();

        HttpSession s = req.getSession();
        s.removeAttribute("currentUser");

        Message m = new Message("Logout Successfully","success","alert-success");
        s.setAttribute("msg",m);

        resp.sendRedirect("Login_Page.jsp");
    }
}
