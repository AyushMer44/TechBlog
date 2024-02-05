package com.techBlogServlets;

import com.techBlogDao.PostDao;
import com.techBlogEntites.Post;
import com.techBlogEntites.User;
import com.techBlogHelper.ConnectionProvider;
import com.techBlogHelper.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;");
        PrintWriter out = resp.getWriter();

        int cid=Integer.parseInt(req.getParameter("cid"));
        String pTitle = req.getParameter("pTitle");
        String pContent = req.getParameter("pContent");
        String pCode = req.getParameter("pCode");
        Part part = req.getPart("pic");

//        Getting currentUserid
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("currentUser");
//        out.println("Your post title is :"+pTitle);
//        out.println(part.getSubmittedFileName());

        Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(),null,cid, user.getId());
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        if(dao.savePost(p)){
            String path = req.getRealPath("/")+"blog_pics"+ File.separator+ part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(),path);
            out.println("done");
        }
        else {
            out.println("error");
        }
    }
}
