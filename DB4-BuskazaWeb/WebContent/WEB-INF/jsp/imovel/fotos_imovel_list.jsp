<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/foto_estilo.css" />

<script type="text/javascript" src="/buzkaza/_js/compressed.js"></script>

</head>
<body style="overflow-x: hidden">


<ul id="slideshow">

<logic:present name="fotos">
	<logic:iterate name="fotos" id="foto">	
	<li>
		<h3></h3>
		<span>/buzkaza/imagens_usuarios/<bean:write name="foto" property="caminho"/></span>
		<p></p>
		<img src="/buzkaza/imagens_usuarios/<bean:write name="foto" property="caminhoThumbnail" />" width="140" height="94" />
	</li>
		
		
		<br><br>
	</logic:iterate>
</logic:present>

</ul>
	<div id="wrapper">
		<div id="fullsize">
			<div id="imgprev" class="imgnav" title="Previous Image"></div>
			<div id="imglink"></div>

			<div id="imgnext" class="imgnav" title="Next Image"></div>
			<div id="image"></div>
			<div id="information" >
				<h3></h3>
				<p></p>
			</div>
		</div>
		<div id="thumbnails">
			<div id="slideleft" title="Slide Left"></div>

			<div id="slidearea">
				<div id="slider"></div>
			</div>
			<div id="slideright" title="Slide Right"></div>
		</div>
	</div>
	
<script type="text/javascript">
	$('slideshow').style.display='none';
	$('wrapper').style.display='block';
	var slideshow=new TINY.slideshow("slideshow");
	window.onload=function(){
		slideshow.auto=true;
		slideshow.speed=5;
		slideshow.link="linkhover";
		slideshow.info="information";
		slideshow.thumbs="slider";
		slideshow.left="slideleft";
		slideshow.right="slideright";
		slideshow.scrollSpeed=4;
		slideshow.spacing=5;
		slideshow.active="#fff";
		slideshow.init("slideshow","image","imgprev","imgnext","imglink");
	}
</script>
</body>
</html>