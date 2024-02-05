package com.techBlogServlets;

import com.techBlogDao.UserDao;
import com.techBlogEntites.Message;
import com.techBlogEntites.User;
import com.techBlogHelper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter out = resp.getWriter();
//        Fetch username and password from request...
        String useremail = req.getParameter("email");
        String password = req.getParameter("password");

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User u = dao.getUserByEmailAndPassword(useremail,password);

        if(u == null){
//            Login Error
//            out.println("Invalid Details... Try Again...");
            Message msg = new Message("Invalid Details!Try again","error","alert-danger");
            HttpSession s = req.getSession();
            s.setAttribute("msg",msg);

            resp.sendRedirect("Login_Page.jsp");
        }

        else{
//            Login success
            HttpSession s = req.getSession();
            s.setAttribute("currentUser",u);
            resp.sendRedirect("profile.jsp");
        }
    }
}
