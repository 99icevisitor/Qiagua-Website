<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>恰瓜，一起来恰瓜！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is main page">
	<link rel="stylesheet" href="CSS/style.css" media="screen" type="text/css" />
	<link rel="stylesheet" type="text/css" href="CSS/main.css">
  	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<style type="text/css">
    a{
      text-decoration : none;
    }
    div{
      white-space:nowrap;
    }
  </style>
  
  </head>
  <%
  	if(request.getSession().getAttribute("ID")!=null){
  		int ID = (Integer)request.getSession().getAttribute("ID");
  		System.out.println("--主页面绑定的用户ID是:"+ID+"--");
  	}
  	else{
  		System.out.println("--主页面未绑定用户ID！--");
  	}
   %>
  <body>
  
  
  <!DOCTYPE html>
    <html lang="en" class="no-js">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <title>弹窗演示</title>
      <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
      <link rel="shortcut icon" href="../favicon.ico"> 
      <link rel="stylesheet" type="text/css" href="css/default.css" />
      <link rel="stylesheet" type="text/css" href="css/component.css" />
      <script src="js/modernizr.custom.js"></script>
      <title>弹窗</title>
    </head>
    <body>
 
 	<!--弹窗MODEL-->
  	<div class="md-modal md-effect-1" id="modal-1">
      <div class="md-content">
        <h3>图片上传</h3>
        <div>
          <form id="mainForm">
               <div class="content">
                   <div class="img-area">
                       <div class="container">
                           <input type="file" id='id-face' name='face'  accept="image/*" />
                           <div class="icons" id='face-empty-result'>
                               <i class="fa fa-camera"></i>
                               <p>点击上传图片</p>
                           </div>
                       </div>
                       <div class="uploaded">
                           <img class="result-img" id='face-result' />
                       </div>
                   </div>
                   <div class="details">
                       <div class="alb">
                           <label>请选择保存专辑</label>
                           <select>
                               <option>默认专辑</option>
                               <option>专辑1</option>
                               <option>专辑2</option>
                               <option>专辑3</option>
                           </select>
                       </div>
                   </div>
               </div>
               <div class="btn">提交</div>
          </form>
          <button class="md-close">关闭</button>
        </div>
      </div>
    </div>

  	<!-- 主导航栏 -->
    <div class="container clearfix">
	 <div class="title"><!--100%;60px-->
	    <ul>
	      <li>
	        <div class="title-empty"><!--120px;60px-->
	          &nbsp;
	        </div>
	      </li>
	      <li>
	        <div class="name"><!--120px-->
	          <img src="images/main/name.png" class="name-img"/>
	        </div>
	      </li>
	      <li><!--分类-->
	        <div class="classfication-bar"><!--80px-->
	          <div class="cls-bar"><!--显示下拉菜单时会变长80px-->
	            <a href="">
	              <div class="cls-bar-icon"><!--10px;10px  margin-top:6px;margin-left:8px-->
	                <i class="fa fa-angle-down"></i>
	              </div>
	              <div class="cls-bar-word">分类</div>
	            </a>
	            <div class="cls-bar-content">
	              <div class="cls-option-img" >
	                <a class="hot" href="Search/categroy.jsp">
	                  <img src="images/main/hot-fire.png"/><!--热门推荐-->
	                </a>
	              </div> 
	              <div class="cls-option cls-first" >
	                <div class="cls-style"><a href="Search/categroy.jsp">家居生活</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">美食菜谱</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">手工DIY</a></div>
	                <div class="cls-style"><a class="cls-words4" href="Search/categroy.jsp">时尚搭配</a></div>
	              </div>
	              <div class="cls-option" >
	                <div class="cls-style"><a href="Search/categroy.jsp">美妆造型</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">婚纱婚礼</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">文字句子</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">插画绘画</a></div>
	              </div>
	              <div class="cls-option" >
	                <div class="cls-style"><a href="Search/categroy.jsp">影音书籍</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">人物明星</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">植物多肉</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">生活百科</a></div>
	              </div>
	              <div class="cls-option" >
	                <div class="cls-style"><a href="Search/categroy.jsp">搞笑萌宠</a></div>
	                <div class="cls-style"><a href="Search/categroy.jsp">人文艺术</a></div>
	                <div class="cls-style"><a class="cls-words2" href="Search/categroy.jsp">设计</a></div>
	                <div class="cls-style"><a class="cls-words3" href="Search/categroy.jsp">古风</a></div></div>
	              <div class="cls-option" >
	                <div class="cls-style"><a class="cls-words2" href="Search/categroy.jsp">壁纸</a></div>
	                <div class="cls-style"><a class="cls-words3" href="Search/categroy.jsp">旅行</a></div>
	                <div class="cls-style"><a class="cls-words3" href="Search/categroy.jsp">头像</a></div>
	                <div class="cls-style"><a class="cls-words3" href="Search/categroy.jsp">摄影</a></div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </li>
	      <li><!--搜索框-->
	        <form action="Search/search1.jsp">
	          <div class="search" >
	            <input class="search-kw" type="text" name="kw" placeholder="搜索感兴趣的内容" >
	            <button class="search-button">
	              <img class="search-icon" src="images/main/search.png" type="submit">
	            </button>
	          </div>
	        </form>
	      </li>
	      <li><!--发表按钮-->
	          <div class="post">
	            <div class="post-button">
	              <div class="post-img-bg">
	              <img class="post-icon" src="images/main/post.png">
	              </div>
	                <ul class="drop-down-content">
	                  <li>
		                  <div class="Upload-button">
		                      <button data-modal="modal-1" class="Upload-pic-button md-trigger" ><i class="fa fa-image"></i><p>
		                    &nbsp;上传图片</p></button>
	                      </div>
                      </li>
	                  <li ><a href="ArticleManager1.jsp">
	                    <div class="notice-tip"><i class="fa fa-file-text-o"></i>
	                    </div>
	                    <div class="notice-words">&nbsp;发布文章</div>
	                  </a></li>
	                </ul>
	            </div>
	          </div>
	      </li>
	      <li class="drop-down1"><!--消息-->
	        <div class="notice"><a class="notice-btn1" href="Reminder/reminder.jsp">消 息</a></div>
	        <ul class="drop-down-content">
	          <li ><a href="Reminder/reminder.jsp">
	            <div class="notice-tip"><i class="fa fa-bell-o"></i>
	              <div class="notice2"></div>
	            </div>
	            <div class="notice-words">&nbsp;动态提醒</div>
	          </a></li>
	          <li ><a href="Reminder/message.jsp">
	            <div class="notice-tip"><i class="fa fa-envelope-o"></i>
	              <div class="notice2"></div>
	            </div>
	            <div class="notice-words">&nbsp;聊天信息</div>
	          </a></li>
	        </ul>
	      </li>
	      <li class="keeper"><!--瓜园长-->
	        <div class="notice">
	          <a class="notice-btn2" href="poser.html">瓜园长</a>
	        </div>
	      </li>
	      <li class="drop-down2"><!--个人中心-->
	        <div class="user-head"><img class="user-head-img" src="images/main/head.jpg"></div>
	        <div class="user-name"><a class="notice-btn2" href="User.jsp">用户名<%-- 此处写用户名 --%></a></div>
	        <ul class="drop-down-content2">
	          <li><a href="User.jsp">
	          <% if(request.getSession().getAttribute("ID")!=null){
	          		int ID = (Integer)request.getSession().getAttribute("ID");
	          		request.getSession().setAttribute("ID", ID);
	          } %>
	            <div class="notice-tip"><i class="fa fa-user-o"></i>
	              <div class="notice2"></div>
	            </div>
	          个人主页</a></li>
	          <li><a href="UserInfo.jsp">
	            <div class="notice-tip"><i class="fa fa-gear"></i>
	            </div>
	          账号设置</a></li>
	          <li><a href="Sign-in.jsp">
	            <div class="notice-tip"><i class="fa fa-power-off"></i>
	            </div>
	          退出登录</a></li>
	        </ul>
	      </li>
	      <li>
	      </li>
	    </ul>
	  </div>
  
  	</div>

    <!--overlay-->
    <div class="md-overlay"></div>
    <!--js-->
    <script src="js/classie.js"></script>
    <script src="js/modalEffects.js"></script>
    <script>// this is important for IEs
      var polyfilter_scriptpath = '/js/';
    </script>
    <script src="js/cssParser.js"></script>
    <script src="js/css-filters-polyfill.js"></script>

   </body>
  </html>
  
    <script src="js/index.js"></script>
  
  </body>
</html>
