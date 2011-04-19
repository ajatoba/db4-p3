<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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


<div id="texto_termo_reserva">

<span id="cinza">

	<logic:present name="reservasImovel">
	
    	<span id="azul">&nbsp;Você tem 3 pedido(s) de reserva(s)</span>
    
    
      	<logic:iterate id="rim" name="reservasImovel">
      
      
	      <html:form action="/usuario/reserva.do?act=aprovarReserva" method="POST">
	      <html:hidden property="status"/>
	      <html:hidden property="codigo" value="${rim.codigo}"/>
      
      
			    <div class="reserva_historico_box">
			        <div class="reserva_historico_box_usuario">
			            O usuário <span id="azul">${rim.locatario.nome}</span> deseja reservar o seu imóvel.
			        </div>
			        <ul class="reserva_historico_ul">  
			            <li class="res_1">  
			                10 dia(s) - <bean:write name="rim" property="periodoInicial" format="dd/MM/yyyy"/> a 
			                <bean:write name="rim" property="periodoFinal" format="dd/MM/yyyy"/><br />   
			                Total: R$ ${( rim.valor + ( rim.valor *10/100))}
			            </li>        
			            <li class="res_2"><a href="#" onclick="javascript:submitForm(1);" border="0"><img src="../_img/botao_confirmar.jpg" width="91" height="30" /></a></li>
			            <li class="res_3"><a href="#" onclick="javascript:submitForm(2);" border="0"><img src="../_img/botao_negar.jpg" width="91" height="30" /></a></li>
			        </ul>
			    </div>		   
		   
			</html:form>
    	</logic:iterate>
    	    
    </logic:present>
</span>

</div>
</body>
</html>
