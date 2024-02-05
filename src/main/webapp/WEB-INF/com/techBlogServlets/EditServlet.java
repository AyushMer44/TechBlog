package com.techBlogServlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.techBlogDao.UserDao;
import com.techBlogEntites.Message;
import com.techBlogEntites.User;
import com.techBlogHelper.ConnectionProvider;
import com.techBlogHelper.Helper;

// Jyada JAR File rakhe bhi babaal h... Jo JAR File pehle dependencies m jaati h...usse classes import ki jaati h...

@MultipartConfig
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter ayu = resp.getWriter();

//       Fetch all data....

        String userName = req.getParameter("user_name");
        String userEmail = req.getParameter("user_email");
        String userPassword = req.getParameter("user_password");
        String userAbout = req.getParameter("user_about");
        Part part = req.getPart("image");
        String imageName = part.getSubmittedFileName();

        // Get the user from the session...

        HttpSession s = req.getSession();
        User user = (User)s.getAttribute("currentUser");
        // Update the user data...
        user.setName(userName);
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setAbout(userAbout);
        String oldFile = user.getProfile();
        user.setProfile(imageName);

        // Updating to database...

        UserDao userDao = new UserDao(ConnectionProvider.getConnection());

        boolean ans = userDao.updateUser(user);
        if(ans){
            String path = req.getRealPath("/")+"pics"+ File.separator+user.getProfile();
            // Starting photo saving work...
            // Delete file code

            String pathOldFile = req.getRealPath("/")+"pics"+ File.separator+oldFile;

            if(!oldFile.equals("default.png")){
                Helper.deleteFile(pathOldFile);
            }


                if(Helper.saveFile(part.getInputStream(),path)){
                    ayu.println("Profile updated...");
                    Message msg = new Message("Profile details Updated","success","alert-success");
                    s.setAttribute("msg",msg);

                }
                else{
                    ayu.println("Not updated...");
                    Message msg = new Message("Something went wrong!","error","alert-danger");
                    s.setAttribute("msg",msg);
                }
        }
        else{
            ayu.println("Not updated...");
            Message msg = new Message("Something went wrong!","error","alert-danger");
            s.setAttribute("msg",msg);
        }

        resp.sendRedirect("profile.jsp");
    }
}
