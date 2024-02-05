package com.techBlogServlets;

import com.techBlogDao.LikeDao;
import com.techBlogHelper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter out = resp.getWriter();

        String operation = req.getParameter("operation");
        int uid= Integer.parseInt(req.getParameter("uid"));
        int pid = Integer.parseInt(req.getParameter("pid"));

//        out.println("Data from server");
//        out.println(operation);
//        out.println(uid);
//        out.println(pid);

        LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

        if(operation.equals("like")){
            boolean f = ldao.insertLike(pid,uid);
            out.println(f);
        }
    }
}
