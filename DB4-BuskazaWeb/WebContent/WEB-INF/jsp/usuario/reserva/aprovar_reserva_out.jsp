<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="/buzkaza/thickbox/_css/estilo_iframe.css" rel="stylesheet" type="text/css" />
<style>

body{ margin:0px; padding:0px; background-color:#FFF  }

a{  font-family:Arial, Helvetica, sans-serif; color:#666666; text-decoration:underline }

</style>

<title>Solicita��o de Reserva</title>
</head>
<body>

<!-- MENSAGEM DE ERRO -->
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
    <!-- ****************** -->
<div class="efetuado_sucesso"></div>

<!-- 
<p align="center" valign="center" class="MyriadPro24">
Opera��o realizada com sucesso!
</p>
<br>
<br>
<p align="center" class="MyriadProRegular">
<a href="#" onclick="javascript:window.close();" >Fechar</a>
</p>
 -->

</body>
</html>