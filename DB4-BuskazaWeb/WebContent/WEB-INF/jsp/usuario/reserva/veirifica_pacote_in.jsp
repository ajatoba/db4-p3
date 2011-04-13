<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza - Incluir Reserva</title>

<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/_css/reserva.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/estilo.css" />
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/size_campos.css"/>
<link rel="stylesheet" type="text/css" href="/buzkaza/_css/detalhe_imovel.css"/>

<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<link rel="stylesheet" type="text/css" href="/buzkaza/jqtransformplugin/jqtransform.css" media="all" />

<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/tabs.js"></script>



<link rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down.css" />
<script type="text/javascript" src="/buzkaza/_js/function.js"></script>
<script type="text/javascript" src="/buzkaza/_js/function_calcular_data.js"></script>

<script language="javascript">

$(document).ready(function()
{
	$('form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
}
);
</script>
</head>
<body>
<!-- topo com linha azul -->
<jsp:include page="../topo.jsp"/>

<div id="meio_reserva">
<div class="top_reserva">
	<div class="txt_meus_anuncios">Solicitação de Reserva</div>
</div>

</div>
<div id="sep_top_reserva_fina"></div>

<div id="listagem_reservas">

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


</div>



</div>

</div>
<br /><br />

<jsp:include page="../rodape.jsp"/>

</body>
</html>