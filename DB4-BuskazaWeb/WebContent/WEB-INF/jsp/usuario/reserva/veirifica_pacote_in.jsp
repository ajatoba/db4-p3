<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

O período que você selecionou faz parte de um pacote fechado.  Selecione abaixo:
<br>
<br>
<logic:present name="reserva">

<logic:present name="reserva" property="imovel">

	<logic:iterate name="reserva" property="imovel.anuncios" id="an">
		<logic:equal name="an" property="tipoAnuncio.codigo" value="6">
			<bean:write name="an" property="dataInicial" format="dd/MM/yyyy"/> a <bean:write name="an" property="dataFinal" format="dd/MM/yyyy"/><br>
			
			<html:form action="/usuario/reserva.do?act=formReservas" method="POST" >
				<html:hidden property="ORIGEM_REQUEST" value="_RESERVA"/>
				<html:hidden property="codigoImovel" value="${reserva.imovel.codigo}"/> 
				<html:hidden property="valor" value="${reserva.valor}"/>
				<html:hidden property="diaPeriodoInicial" value="${an.dataInicial.date}"/>	
				<html:hidden property="mesPeriodoInicial" value="${(an.dataInicial.month)+1}"/>
				<html:hidden property="anoPeriodoInicial" value="${(an.dataInicial.year)+1900}"/>
				<html:hidden property="diaPeriodoFinal" value="${an.dataFinal.date}"/>	
				<html:hidden property="mesPeriodoFinal" value="${(an.dataFinal.month)+1}"/>
				<html:hidden property="anoPeriodoFinal" value="${(an.dataFinal.year)+1900}"/>
					
				<div class="botao_reserva2">
					<input type="image" src="/buzkaza/_img/btn_reservar.jpg" width="65" height="24" /><br/>
				</div>
			</html:form>						
			
		</logic:equal>
	</logic:iterate>

</logic:present>

</logic:present>

</body>
</html>