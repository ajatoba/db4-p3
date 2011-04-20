<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reservas</title>

<link href="/buzkaza/thickbox/_css/estilo_iframe.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/_js/function_calcular_data.js"></script>

<script>
function submitForm(status){
	document.forms[0].status.value=status;
	document.forms[0].submit();
}

</script>

</head>

<body>

<%
	int index = 0;
%>

<div id="texto_termo_reserva">

<span id="cinza">

	<logic:present name="reservasImovel">
	
    	<span id="azul">&nbsp;Você tem <span id="totalpedido"></span> pedido(s) de reserva(s)</span>
    
    
      	<logic:iterate id="rim" name="reservasImovel">
      
      		<% index = index+1; %>

	      <html:form action="/usuario/reserva.do?act=aprovarReserva" method="POST">
	      <html:hidden property="status"/>
	      <html:hidden property="codigo" value="${rim.codigo}"/>
      
      
			    <div class="reserva_historico_box">
			        <div class="reserva_historico_box_usuario">
			            O usuário <span id="azul">${rim.locatario.nome}</span> deseja reservar o seu imóvel.
			        </div>
			        <ul class="reserva_historico_ul">  
			            <li class="res_1">
			                <span id="data_total_<% out.print( index ); %>_${rim.codigo}"></span> dia(s) - <bean:write name="rim" property="periodoInicial" format="dd/MM/yyyy"/> a 
			                <bean:write name="rim" property="periodoFinal" format="dd/MM/yyyy"/><br />   
			                Total: R$ <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${( rim.valor + ( rim.valor *10/100))}"/>
			            </li>        
			            <li class="res_2"><a href="#" onclick="javascript:submitForm(1);" border="0"><img src="/buzkaza/_img/botao_confirmar.jpg" width="91" height="30" border="0"/></a></li>
			            <li class="res_3"><a href="#" onclick="javascript:submitForm(2);" border="0"><img src="/buzkaza/_img/botao_negar.jpg" width="91" height="30" border="0"/></a></li>
			        </ul>
			        
			        <script language="javascript">
                    <!--
                    	calcularDataListaReserva( '<bean:write name="rim" property="periodoInicial" format="dd/MM/yyyy"/>', '<bean:write name="rim" property="periodoFinal" format="dd/MM/yyyy"/>', 'data_total_<% out.print( index ); %>_${rim.codigo}');
                   	-->
                   	</script>
			    </div>		   
		   
			</html:form>
    	</logic:iterate>
    	
    	<script language="javascript">
        <!--
          		document.getElementById("totalpedido").innerHTML = "<% out.print( index ); %>";
       	-->
       	</script>
    	    
    </logic:present>
</span>

</div>
</body>
</html>
