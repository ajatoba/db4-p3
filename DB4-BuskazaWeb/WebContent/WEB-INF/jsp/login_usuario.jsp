<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>
<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>

	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#usuarioForm').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>
<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>


<div id="cadastro">

<div id="meio_login">
<!--FORM-->
<div id="msg_finaliza_cadastro">

  
<!-- MENSAGEM DE ERRO -->
<div>
    <font color="red">
  
		
				
		
			
				
		
  	</font>
</div>
  	<br />
    <!-- ****************** -->
    
<form name="usuarioForm" id="usuarioForm" method="post" action="/DB4-BuskazaWeb/usuario.do;jsessionid=A7C5468551D95401143FA9B14284AA23?act=autenticarUsuario">

<table width="478" border="0" cellspacing="2" cellpadding="2" align="center">
	
  <tr>

  	<td rowspan="5" valign="top">
    <div class="logo_login"></div>
    <a href="http://www.buzkaza.com.br/" border="0"><div class="cad_login"></div></a>
    </td>
    <td class="MyriadProRegular">Login (E-Mail)</td>
  </tr>
  <tr>  
    <td width="90%">
    <input type="text" name="usuarioEntity.email" size="200" value="" title="Email"></td>

  </tr>
  <tr>
    <td class="MyriadProRegular">Senha</td>
  </tr>
  <tr>  
    <td>
    <input type="password" name="usuarioEntity.senha" size="200" value="" title="Senha"></td>
  </tr>
  <tr>

    <td><input type="image" src="/buzkaza/teaser/_img/btn_entrar.png" name="button" id="button" value="Submit" /></td>
  </tr>
</table>
</form>
 

</div>
<!--FORM-->
</div>
</div>
</body>
</html>


