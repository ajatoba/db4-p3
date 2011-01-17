<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="/buzkaza/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
		});
	</script>
    <script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
$(function(){
$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
	});
</script>
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
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
<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Imóveis</span></div>
<div class="combo_anuncios"><span class="MyriadPro14" style="float:left; margin-top:10px; margin-right:3px;">Filtrar:</span>
	    <form id="form"><select name="select2" >
				<option value="opt1">Listar todas as reservas</option>
				<option value="opt2">Option 2</option>
				<option value="opt3">Option 3</option>
				<option value="opt4">Option 4</option>
				<option value="opt5">Option 5</option>
				<option value="opt6">Option 6</option>
				<option value="opt7">Option 7</option>
				<option value="opt8">Option 8</option>
			</select></form> &nbsp;&nbsp;<img src="/buzkaza/_img/btn_criar_anuncio.jpg" width="151" height="31" /></div>
</div>
</div>
<div id="sep_top_reserva"></div>

<div id="listagem_reservas">

<div id="separator_listagem"></div>
<logic:present name="imoveis">
	<logic:iterate id="ims"  name="imoveis">

		<!--BOX COM A RESERVA-->
		<div id="listagem_reservas">
		<!--BOX COM A RESERVA-->
		<div id="box_listagem">
		<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="primeirafoto"/>" width="140" height="104" /></div>
		<div class="detalhe_reserva">
			<div class="bairro_reserva">${ims.logradouro}</div>	
			<div class="bairro_reserva">${ims.bairro} -${ims.estado.codigo} </div>	
			<span class="MyriadPro14Verde">
				<logic:equal name="ims" property="status" value="0">Em análise</logic:equal>
				<logic:equal name="ims" property="status" value="1">Aprovado  <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovelComp&ci=${ims.codigo}">[[Anunciar]]</a></logic:equal>
				<logic:equal name="ims" property="status" value="2">Aprovado  <a href="/DB4-BuskazaWebusuario/anuncio.do?act=formIncluirAnuncio&ci=${ims.codigo}">[[Anunciar]] </a></logic:equal>
				<logic:equal name="ims" property="status" value="3">Pendente  <a href="/DB4-BuskazaWebusuario/imovel.do?act=formAlterarImovel&ci=${ims.codigo}"> [[Alterar]]</a></logic:equal>
			</span>	
		
		</div>
		<div id="separator_listagem"></div>
	</logic:iterate>
</logic:present>
</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="linha_cinza"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>



</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="linha_cinza"></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
