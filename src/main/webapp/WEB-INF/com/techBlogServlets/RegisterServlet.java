package com.techBlogServlets;

import com.techBlogDao.UserDao;
import com.techBlogEntites.User;
import com.techBlogHelper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter out = resp.getWriter();
        // Fetch all form data...
        String check = req.getParameter("check");
        if(check == null){
            out.println("Please check terms and conditions...");
        }
        else {
            String name = req.getParameter("user_name");
            String email = req.getParameter("user_email");
            String password = req.getParameter("user_password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");

            // Create user object and set all data to that object...
            User user = new User(name,email,password,gender,about);
            // Create a user DataAccessObject(Dao)...

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            if(dao.saveUser(user)){
                // Saved
                out.println("Done");
            }
            else{
                out.println("Error...");
            }
        }
    }
}
