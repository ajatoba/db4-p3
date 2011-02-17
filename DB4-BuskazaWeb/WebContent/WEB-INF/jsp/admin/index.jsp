<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Imóvel - Buzkaza</title>
<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>
<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="cadastro">
<div id="top_cad">
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">
<!--FORM-->
<div id="msg_finaliza_cadastro">
  
  		<span class="MyriadPro24">
	<ul>
		<li><A href="admin/usuario.do?act=listarTodosUsuarios"> USUARIOS CADASTRADOS</A></li>
		<li><A href="admin/imovel.do?act=listarImoveisPorStatus&statusImovel=-1"> LISTAR TODOS OS IMÓVEIS</A></li>
		<li><A href="admin/imovel.do?act=listarImoveisPorStatus&statusImovel=0"> APROVAR IMÓVEIS</A></li>
		<li><A href="admin/imovel.do?act=listarImoveisPorStatus&statusImovel=1"> IMÓVEIS APROVADOS</A></li>
		<li><A href="admin/imovel.do?act=listarImoveisPorStatus&statusImovel=2"> IMÓVEIS COMPLETOS</A></li>
	</ul>
	</span>
  </div>

<!--FORM-->
</div>
<div id="bottom_cad"></div>
</div>
</body>
</html>