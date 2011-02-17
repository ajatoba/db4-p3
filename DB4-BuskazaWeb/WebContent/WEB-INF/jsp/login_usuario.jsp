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
  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>						
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>	
			</logic:present>
				
		</logic:messagesNotPresent>
  	</font>
</div>
  	<br />
    <!-- ****************** -->
    
<html:form method="post" styleId="usuarioForm" action="/usuario?act=autenticarUsuario">

<table width="478" border="0" cellspacing="2" cellpadding="2" align="center">
	
  <tr>
  	<td rowspan="5" valign="top">
    <div class="logo_login"></div>
    <a href="http://www.buzkaza.com.br/teaser/cadastro.html" border="0"><div class="cad_login"></div></a>
    </td>
    <td class="MyriadProRegular">Login (E-Mail)</td>
  </tr>
  <tr>  
    <td width="90%">
    <html:text title="Email" size="200"  property="usuarioEntity.email" /></td>
  </tr>
  <tr>
    <td class="MyriadProRegular">Senha</td>
  </tr>
  <tr>  
    <td>
    <html:password title="Senha" size="200" property="usuarioEntity.senha" /></td>
  </tr>
  <tr>
    <td><input type="image" src="/buzkaza/teaser/_img/btn_entrar.png" name="button" id="button" value="Submit" /></td>
  </tr>
</table>
</html:form>
 

</div>
<!--FORM-->
</div>
</div>
</body>
</html>
