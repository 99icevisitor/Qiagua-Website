<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../CSS/Article.css">
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
	<form action="../ArticleManager1.jsp" onsubmit="">
		<div class="toolbar">
			<div class="back-to-manager">
				<a href="../ArticleManager1.jsp" class="back-button">返回</a>
			</div>
			<div class="buttons">
				<ul class="button2">
					<li><div class="save"><button id="btn1" class="article-submit" type="button"><i class="fa fa-save"></i>&nbsp;保存</button></div></li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
					<li><div class="post"><input id="submit-all" class="article-submit" type="submit" name="submit-a" value="发布"></div></li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
					<li><div class="save"><button id="btn2" class="article-submit" type="button">仅文字</button></div></li>
				</ul>
			</div>
		</div>
		
		<center>
			<div class="article-img">
				<div class="getimg"><input type="file" id='id-face' name='article-img' class="img-input" accept="image/*" />
				<div class="icons" id='face-empty-result'>
                        </div>
                </div>
				<div class="tip-words">
				<i class="fa fa-camera"></i>
				<p>建议尺寸900*500，且图片大小小于1M</p>
				</div>
				<div class="uploaded">
                	<img class="result-img" id='face-result' />
                </div>
			</div>
			<div class="article-title"><input class="title-input" type="text" name="article-title" placeholder="在此输入标题"></div>
	</center>
    <div id="div1" class="WEditor-content">
	   <p>请输入正文......</p><p><br></p>
	</div>
	
	
	</form>
	<script type="text/javascript" src="wangEditor.min.js"></script>
	<script type="text/javascript">
	    var E = window.wangEditor
	    var editor = new E('#div1')
	    editor.create()
	
	    document.getElementById('btn1').addEventListener('click', function () {
	        // 读取 html
	        alert(editor.txt.html())
	    }, false)
	
		 document.getElementById('submit-all').addEventListener('click', function () {
	        // 读取 html
	        alert(editor.txt.html())
	    }, false)
	
	    document.getElementById('btn2').addEventListener('click', function () {
	        // 读取 text
	        alert(editor.txt.text())
	    }, false)
	
	</script>
</body>
</html>