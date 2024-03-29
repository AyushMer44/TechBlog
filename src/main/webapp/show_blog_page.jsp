<%@ page import="com.techBlogEntites.User" %>
<%@ page import="com.techBlogDao.PostDao" %>
<%@ page import="com.techBlogHelper.ConnectionProvider" %>
<%@ page import="com.techBlogEntites.Post" %>
<%@ page import="com.techBlogEntites.Categories" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.techBlogDao.UserDao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.techBlogDao.LikeDao" %>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("Login_Page.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= p.getpTitle() %>|| TechBlog</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/myStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .post-title{
            font-weight: 100;
            font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;
        }
        .post-date{
            font-style: italic;
            font-weight: bold;
        }
        .post-user-info{
            font-size: 20px;
            font-weight: 300;
        }
        .row-user{
            border: 1px solid #e2e2e2;
        }

        body{
            background: url("IMAGES/back.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="ScEJYnyF"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="	fa fa-cubes"></span>  Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="profile.jsp"><span class="	fa fa-diamond"></span> Learning<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="	fa fa-navicon"></span> Projects
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Project Implementation</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="	fa fa-address-book-o"></span> Contact</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> POST</a>
            </li>
        </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"><span class="	fa fa-user-circle"></span> <%= user.getName()%></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"><span class="	fa fa-user-plus"></span> LOG OUT</a>
            </li>
        </ul>
    </div>
</nav>
<%--END OF NAVBAR--%>
    <div class="container">
        <div class="row my-4">
            <div class="col-md-6 offset-md-2">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%= p.getpTitle() %></h4>
                    </div>

                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">

                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                                <p class="post-user-info"><a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted...</p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                            </div>
                        </div>
                        <p class="post-content"><%= p.getpContent() %></p>
                        <br>
                        <br>
                        <div class="post-code">
                            <pre><%= p.getpCode() %></pre>
                        </div>

                    </div>
                    <div class="footer">

                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        %>
                        <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span> </a>
                        <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span> </a>

                    </div>

                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
<%--Main content of body--%>

<%--End of main content--%>
<%--Profile Modal--%>
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="exampleModalLabel1">Tech Blog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:140px;">
                    <h5 class="modal-title" id="exampleModal"><%= user.getName()%></h5>

                    <%-- Details--%>
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th scope="row">ID :</th>
                                <td> <%= user.getId() %></td>
                            </tr>
                            <tr>
                                <th scope="row">Email :</th>
                                <td><%= user.getEmail() %>
                            </tr>
                            <tr>
                                <th scope="row">Gender :</th>
                                <td><%= user.getGender() %></td>
                            </tr>
                            <tr>
                                <th scope="row">About :</th>
                                <td><%= user.getAbout() %></td>
                            </tr>
                            <tr>
                                <th scope="row">Registered On :</th>
                                <td><%= user.getDateTime().toString() %></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <%--Profile Edit--%>
                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2">Please Edit Carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId() %></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%= user.getGender() %></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td><textarea class="form-control" name="user_about" rows="4"><%= user.getAbout()%></textarea></td>
                                </tr>
                                <tr>
                                    <td>Select profile pic :</td>
                                    <td><input type="file" name="image" class="form-control"></td>
                                </tr>
                            </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-btn" type="button" class="btn btn-primary">EDIT</button>
            </div>
        </div>
    </div>
</div>
<%--End of Profile Modal--%>

<%--Add post modal--%>

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form id="add-post-form" action="AddPostServlet" method="post">
                    <div class="form-group">
                        <select class="form-control" name="cid">
                            <option selected disabled>---Select Category---</option>
                            <%
                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Categories> list = postd.getAllCategories();
                                for(Categories c:list){
                            %>
                            <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                            <%
                                }
                            %>

                        </select>
                    </div>

                    <div class="form-group">
                        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                    </div>

                    <div class="form-group">
                        <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px;"></textarea>
                    </div>

                    <div class="form-group">
                        <textarea name="pCode" class="form-control" placeholder="Enter your code(if any)" style="height: 200px;"></textarea>
                    </div>

                    <div class="form-group">
                        <label>Select your pic :</label>
                        <input type="file" name="pic">
                    </div>

                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary">Post</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--End of post modal--%>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<%--BOOT STRAP--%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src= "JS/myJS.js" type="text/javascript"></script>
<script>
    $(document).ready(function (){
        let editStatus = false;
        $('#edit-profile-btn').click(function (){
            // alert("button clicked")
            if(editStatus == false){

                $("#profile-details").hide()
                $("#profile-edit").show();
                editStatus = true;
                $(this).text("Back")
            }

            else{
                $("#profile-details").show()
                $("#profile-edit").hide();
                editStatus = false;
                $(this).text("Edit")
            }
        });
    });
</script>

<%-- Now add Post js--%>
<script>
    $(document).ready(function(e){
        $("#add-post-form").on("submit",function (event){
            //     This code gets called when form is submitted...
            event.preventDefault();
            console.log("Your have clicked on submit.")

            let form = new FormData(this);

            //     Now requesting to server...
            $.ajax({
                url: "AddPostServlet",
                type:'POST',
                data: form,
                success: function(data, textStatus, jqXHR){
                    console.log(data)
                    if(data.trim() == 'done'){
                        swal("Good job!", "Saved successfully", "success");
                    }
                    else{
                        swal("Error!", "Something went wrong.Try again...", "error");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    swal("Error!", "Something went wrong.Try again...", "error");
                },
                processData: false,
                contentType: false
            })
        })
    })
</script>

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

</body>
</html>
