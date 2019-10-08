<%@ page language="java" import="java.util.*,source.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Article.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="<%=basePath %>/js/jquery-3.3.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="<%=basePath %>/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='../js/img.js' charset='utf-8'></script>
    <title>恰瓜--一起来吃瓜！</title>
    <style>
    	.uploaded{
    		width: 700px;
    		height: 200px;
    		margin-top:-138px;
    		background-color: transparent;
    	}
    	.result-img{
    		width: 700px;
    		height: 200px;
    		background-color: transparent;
    	}
    	.tip-words{
			font-size: 14px;
			margin-top:-120px;
			font-family: "FangSong";
			color: #999999;
		}
    </style>
</head>
<body>
	<form action="../ArtSaveServlet" method="post">
		<div class="toolbar">
			<div class="back-to-manager" style="width:300px;">
				<a href="../ArticleManager1.jsp" class="back-button">文章管理中心</a>
			</div>
			<div class="buttons">
				<ul class="button2">
					<li><div class="save"><button id="btn1" class="article-submit" type="button"><i class="fa fa-save"></i>&nbsp;保存</button></div></li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
					<li><div class="post"><a href="../ArticleManager1.jsp"><input id="submit-all" class="article-submit" type="submit" name="submit-a" value="发布"></a></div></li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
				</ul>
			</div>
		</div>
    <%
    	if(request.getSession().getAttribute("ID")!=null){
    		int ID = (int)request.getSession().getAttribute("ID");
    		System.out.println("--文章编辑页面操作用户ID为"+ID+"--");
    		request.getSession().setAttribute("ID", ID);
    		int ART_ID = 0;
    		if(request.getParameter("art_id")!=null){
    			ART_ID = Integer.valueOf(request.getParameter("art_id"));
    			request.setAttribute("ART_ID", ART_ID);
    			System.out.println("--文章编辑页面文章ID为"+ART_ID+"--");
    			ArtBean article = new ArtBean();
    %>
    <center>
			<div class="article-img">
				<div class="getimg"><input type="file" id='id-face' name='article-img' class="img-input" accept="image/*" />
				<div class="icons" id='face-empty-result'>
                        </div>
                </div>
				<div class="tip-words">
				<i class="fa fa-camera"></i>
				<p>建议尺寸900*500，且图片大小小于3M</p>
				</div>
				<div class="uploaded">
                	<img class="result-img" id='face-result' />
                </div>
			</div>
			<div class="article-title"><input class="title-input" type="text" name="article-title" id="art_title" value=<%=article.getArtTitle(ART_ID) %> placeholder="请输入标题">
			</div>
	</center>
    <div id="div1" class="WEditor-content">
    		<%=article.getArtContent(ART_ID) %>	
    <% 
    		}else{
     %>
     <center>
			<div class="article-img">
				<div class="getimg"><input type="file" id='id-face' name='article-img' class="img-input" accept="image/*" />
				<div class="icons" id='face-empty-result'>
                        </div>
                </div>
				<div class="tip-words">
				<i class="fa fa-camera"></i>
				<p>建议尺寸900*500，且图片大小小于3M</p>
				</div>
				<div class="uploaded">
                	<img class="result-img" id='face-result' />
                </div>
			</div>
			<div class="article-title"><input class="title-input" type="text" name="article-title" id="art_title" placeholder="在此输入标题"></div>
	</center>
    <div id="div1" class="WEditor-content">
    <p>请输入正文(图片不超过2张)......</p><p><br></p>
    <%} %>
	</div>
	<textarea id="text1" style="width:100%; height:200px;" name="editorval" class="copythis"></textarea>
	<textarea id="art_id" style="width:100%; height:200px;" name="art_id" class="copythis"><%=ART_ID %></textarea>
	<%
	    
	   }%>
	</form>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="wangEditor.js"></script>
	<script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#div1');
        editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片

        var $text1 = $('#text1')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())
        
        //暂时只提交文章名字和内容,标题图片因为保护虚拟路径的原因暂时没存
	document.getElementById('btn1').addEventListener('click', function () {
        $.ajax({
        	type: "POST",
            url: "../ArtSaveServlet",
            //contentType: "application/json;charset=utf-8",
            data:{"content":editor.txt.html(),
            	  "title":$("#art_title").val(),
            	  "art_id":$("#art_id").val()},
            dataType: "json",
            traditional:true,
            success:function (message) {
                alert(message["datails"]);
                $("#art_id").val(message["art_id"]);
            },
            error:function (message) {
                alert("提交失败"+JSON.stringify(message));
            }
        });
    })
  /*
    document.getElementById('submit-all').addEventListener('click', function () {
        $.ajax({
        	type: "POST",
            url: "../ArtSaveServlet",
            //contentType: "application/json;charset=utf-8",
            data:{"content":editor.txt.html(),
            	  "title":$("#art_title").val(),
            	  "art_id":$("#art_id").val()},
            dataType: "json",
            traditional:true,
            success:function (message) {
                alert(message["datails"]);
                $("#art_id").val(message["art_id"]);
                window.location.href="../ArticleManager1.jsp";
            },
            error:function (message) {
                alert("提交失败"+JSON.stringify(message));
                window.location.href="../ArticleManager1.jsp";
            }
        });
    })
*/
    
    </script>
</body>
</html>