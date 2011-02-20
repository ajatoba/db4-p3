<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Minhas Reservas</title>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/buzkaza/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/buzkaza/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/buzkaza/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->

<jsp:include page="../menu.jsp"/>

<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
<div class="txt_minha_reserva">

<span class="MyriadPro24">Minhas Reservas</span></div>

</div>
</div>
<div id="sep_top_reserva"></div>

<logic:present name="reservas">

	<!--BOX COM A RESERVA-->
	<table align="center" border="0" width="70%" class="MyriadProRegular" cellspacing="10">
	<logic:iterate id="res" name="reservas">
	
	<tr>
		<td align="center" valign="center" width="20%">		
			<img src="/buzkaza/imagens_usuarios/<bean:write name="res" property="imovel.primeirafoto"/>" width="140" height="104" />
		</td>
		<td>
			<b><bean:write name="res" property="imovel.logradouro"/></b>
			<br><br>
			de  <bean:write name="res" property="periodoInicial" format="dd/MM/yyyy"/>
			ate <bean:write name="res" property="periodoFinal" format="dd/MM/yyyy"/><br>		
			R$ <bean:write name="res" property="valor" format="00.00"/><br><br>		
			
			<logic:equal name="res" property="status" value="0">Em análise</logic:equal>
			<logic:equal name="res" property="status" value="1">
				Aprovada<br>
				<a href="/DB4-BuskazaWeb/usuario/reserva.do?act=formPagarReserva&cr=${res.codigo}">Efetuar pagamento</a>
			</logic:equal>
			<logic:equal name="res" property="status" value="2">Negada</logic:equal>
			<logic:equal name="res" property="status" value="3">Paga</logic:equal>
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<hr/>
		</td>
	</tr>		
	</logic:iterate>
	</table>
</logic:present>

<logic:notPresent name="reservas">
	Não há reservas
</logic:notPresent>

<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="linha_cinza"></div>
<div id="bottom"></div>

</div>
</body>
</html>
