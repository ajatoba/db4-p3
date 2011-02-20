<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<script>
function submitForm(status){
	document.forms[0].status.value=status;
	document.forms[0].submit();
}

</script>
<title>Reservas</title>
</head>

<body>
<table width="100%" border="0" class="MyriadProRegular">
  <tr>
    <td class="MyriadPro24" align="center"><br>Solicitações de Reserva<br></td>
  </tr>

  <tr>
    <td>
    <logic:present name="reservasImovel">
      <logic:iterate id="rim" name="reservasImovel">
      <fieldset>
      <legend>Código da Reserva:${rim.codigo }</legend>
      <html:form action="/usuario/reserva.do?act=aprovarReserva" method="POST">
      <html:hidden property="status"/>
      <html:hidden property="codigo" value="${rim.codigo}"/>
      <table width="100%" border="0">
	      <tr>
	        <td>O usuário ${rim.locatario.nome} deseja reservar seu imóvel</td>
	        <td>&nbsp;</td>
	
	        <td>&nbsp;</td>
	      </tr>
	      <tr>
	        <td>
	        	<bean:write name="rim" property="periodoInicial" format="dd/MM/yyyy"/> - 
	        	<bean:write name="rim" property="periodoFinal" format="dd/MM/yyyy"/>
	        	
				<br/>
	        	Total R$ ${rim.valor }
	        </td>
	        <td>
	        	<a href="#" onclick="javascript:submitForm(1);" border="0">CONFIRMAR</a>	        
	        </td>	        
	        <td>
	        	<a href="#" onclick="javascript:submitForm(2);" border="0">NEGAR</a>
	        </td>	
	      </tr>
      </table>
      </html:form>
      </fieldset>
      <br>
      </logic:iterate>

    
    </logic:present>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

</table>
</body>
</html>
