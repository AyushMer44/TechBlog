<%@ page import="com.techBlogDao.PostDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.techBlogHelper.ConnectionProvider" %>
<%@ page import="com.techBlogEntites.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.techBlogDao.LikeDao" %>
<%@ page import="com.techBlogEntites.User" %>

<div class="row">
<%

    User uuu = (User) session.getAttribute("currentUser");
    Thread.sleep(200);
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;

    if(cid == 0) {
        posts = d.getAllPosts();
    }
    else{
        posts = d.getPostByCatId(cid);
    }

    if(posts.size() == 0){
        out.println("<h3 class='display-3 text-center'>No posts in this category...</h3>");
        return;
    }
    for(Post p:posts){
%>

<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
            <pre><%= p.getpCode()  %></pre>
        </div>

        <div class="card-footer ">
            <%
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
            %>
            <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More...</a>
            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span> </a>
            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span> </a>
        </div>
    </div>

</div>

<%
    }
%>

</div>

<script>
    function doLike(pid, uid) {
        console.log(pid+ "," +uid);
        const d = {
            uid:uid,
            pid:pid,
            operation:'like'
        }

        $.ajax({
            url: "LikeServlet",
            data: d,
            success: function(data,textStatus,jqXHR){
                console.log(data);
                if(data.trim() == 'true'){
                    let c=$(".like-counter").html();
                    c++;
                    $('.like-counter').html(c);
                }
            },
            error: function(jqXHR,textStatus,errorThrown){
                console.log(data)
            }
        })
    }
</script>