<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Buzkaza - Minhas Reservas</title>
	<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />
	
	<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
	<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
	
	
</head>

<body>

<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>


<!--CADASTRO-->


<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_minha_reserva"><span class="MyriadPro24">Minhas Reservas</span></div></div>
</div>
<div id="sep_top_reserva"></div>

<logic:present name="reservas">


<logic:iterate id="res" name="reservas">
<!--BOX COM A RESERVA-->
<div id="box_listagem">
<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="res" property="imovel.primeirafoto"/>" width="140" height="104" /></div>
<div class="detalhe_reserva">
<div class="bairro_reserva">Copacabana</div>
<div class="data_reserva_de">de<br /><bean:write name="res" property="periodoInicial" format="dd/MM/yyyy"/></div>
<div class="data_reserva_ate">ate<br /><bean:write name="res" property="periodoFinal" format="dd/MM/yyyy"/></div>
<div class="nota_reserva">
Valor de 10 dia(s)&nbsp;
R$ ${( res.valor + ( res.valor *10/100))} 
</div>
<div class="total_reserva">

</div>
<div class="visualizar_reserva">dasdas</div>
</div>
<div class="status_reserva">


			<logic:equal name="res" property="status" value="0">Em análise</logic:equal>
			<logic:equal name="res" property="status" value="1">Aprovada<br /><a href="/DB4-BuskazaWeb/usuario/reserva.do?act=formPagarReserva&cr=${res.codigo}">Efetuar pagamento</a>
			</logic:equal>
			<logic:equal name="res" property="status" value="2">Negada</logic:equal>
			<logic:equal name="res" property="status" value="3">Paga</logic:equal>


</div>

</div>
<div id="separator_listagem"></div>


<!--BOX COM A RESERVA-->
</logic:iterate>
</logic:present>


	

<logic:notPresent name="reservas">
	Não há reservas
</logic:notPresent>

<!--FIM CADASTRO-->

<jsp:include page="../rodape.jsp"/>

</div>
</body>
</html>
