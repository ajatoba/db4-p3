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
<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
$(function(){
$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
	});

	function openWindow(url){
		window.open(url,"mywindow","menubar=0,resizable=0,width=600,height=600,scrollbars=1,location=0");
	}
	
</script>

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
<div class="txt_meus_anuncios"><span class="MyriadPro24">Meus Anúncios</span></div>

</div>
<div id="sep_top_reserva"></div>

<div id="listagem_reservas">


<logic:present name="imoveis">
<logic:iterate id="ims"  name="imoveis">
<!--BOX COM A RESERVA-->

<html:form method="post" styleId="imovelForm" action="/usuario/imovel.do?act=excluirImovel" enctype="multipart/form-data">
<html:hidden property="imovelEntity.codigo" value="${ims.codigo}" />

<div id="box_listagem">
<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="primeirafoto"/>" width="140" height="104" /></div>
<div class="detalhe_reserva">
  <div class="bairro_reserva"><span class="cor_bairro">${ims.bairro} -${ims.estado.codigo}</span><br>
    ${ims.logradouro}</div>
  <div class="nota_reserva">Nota 8&nbsp;&nbsp; 102 Comentários</div>
  <div class="total_reserva">  id: <bean:write name="ims" property="codigo"/> </div>
  <div class="visualizar_reserva">
    <logic:equal name="ims" property="status" value="0">Em análise &nbsp;&nbsp;</logic:equal>    
    <logic:equal name="ims" property="status" value="2"><a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=formCadastroAnuncio&ci=${ims.codigo}" class="link_azul">Disponibilidade/Preços</a> &nbsp;&nbsp; </logic:equal>    
    <logic:notEmpty name="ims" property="anuncios"> <a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=listarAnunciosImovel&ci=${ims.codigo}" class="link_azul">Ver Disponibilidade</a> &nbsp;&nbsp; </logic:notEmpty>
    <logic:equal name="ims" property="status" value="1"><a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovelComp&ci=${ims.codigo}" class="link_azul">Editar Anúncio</a> &nbsp;&nbsp; </logic:equal>
  </div>
</div>
<div id="separator_listagem"></div>


<br>

  
  <html:submit>Excluir Imóvel </html:submit>
  
</html:form>
<table border="0" class="MyriadPro18Verde" align="center" width="100%">
  <tr>
    <td align="center" valign="center"><logic:notEmpty name="ims" property="reservas">
        <fieldset>
          <a href="#" onclick="javascript:openWindow('/DB4-BuskazaWeb/usuario/reserva.do?act=listarReservasImovel&ci=${ims.codigo}&status=0');"> Você tem solicitações de Reserva </a>
        </fieldset>
      </logic:notEmpty></td>
  </tr>
    </logic:iterate>
  
</table>
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
