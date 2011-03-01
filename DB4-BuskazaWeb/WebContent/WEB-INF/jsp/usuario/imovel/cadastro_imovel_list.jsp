<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>
<!-- 
<link href="/buzkaza/_css/cadastro.css" rel="stylesheet" type="text/css" />
 -->
<link href="/buzkaza/_css/reserva.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/jqtransformplugin/jqtransform.css" rel="stylesheet" type="text/css" media="all" />
<link href="/buzkaza/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="/buzkaza/webfontkit-20110225-090425/stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/buzkaza/_js/jquery.corner.js" ></script>
<script>
$(function(){
	/*
	$('#sep_top_reserva').corner('rounded 7px');

	$("#busca_home").corner("bottom 7px");
	$("#mapa_").corner("bottom 7px");
	*/
	});

	function openWindow(url){
		window.open(url,"mywindow","menubar=0,resizable=0,width=600,height=600,scrollbars=1,location=0");
	}

	function excluirAnuncio()
	{
		if (confirm("Deseja excluir o anúncio?"))
		{
			
		}	
	}
		
</script>

</head>

<body>


<div id="conteudo"> 
  <!--TOPO-->
  <div id="top">
    <div class="topo_menu">
      <div class="txt_01">Você está: Pág. Inicial</div>
      <div class="txt_02">Quem Somos</div>
      <div class="txt_03">Mapa do Site</div>
      <div class="txt_04">Contato</div>
      <div class="txt_05">Ajuda</div>
      <div class="txt_06">Redes Sociais</div>
      <div class="twitter"></div>
      <div class="facebook"></div>
    </div>
    <div class="tracejado_top"></div>
    <div class="linha_logo">
      <div class="logo"></div>
      <div class="options"></div>
    </div>
    <div class="bottom_menu">
      <div class="btn_alugar">alugar imóvel</div>
      <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovel"><div class="btn_anunciar">anunciar imóvel</div></a>
      <a href="http://www.buzkaza.com.br/blog/" target="_black"><div class="btn_blog">blogs</div></a>
      <div class="btn_login">Efetuar login</div>
      <a href="/DB4-BuskazaWeb/usuario.do?act=formIncluirUsuario"><div class="btn_cadastre_se"></div></a>
    </div>
  </div>
</div>

<div id="site">
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
<html:hidden property="imovelEntity.codigo" value="${ims.codigo}"/>

<div id="box_listagem">
<div class="foto_reserva"><img src="/buzkaza/imagens_usuarios/<bean:write name="ims" property="primeirafoto"/>" width="132" height="99" /></div>
<div class="detalhe_reserva">
  <div class="bairro_reserva">${ims.bairro} -${ims.estado.codigo}<br>
    <span class="nome_rua">${ims.logradouro}</span></div>
  <div class="nota_reserva">Nota 8&nbsp;&nbsp; 102 Comentários</div>
  <div class="total_reserva">  id: <bean:write name="ims" property="codigo"/> </div>
  <div class="visualizar_reserva">
    <logic:equal name="ims" property="status" value="0">Em análise &nbsp;&nbsp;</logic:equal>    
    <logic:equal name="ims" property="status" value="2"><a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=formCadastroAnuncio&ci=${ims.codigo}" class="link_azul">Disponibilidade/Preços</a> &nbsp;&nbsp; </logic:equal>    
    <logic:notEmpty name="ims" property="anuncios"> <a href="/DB4-BuskazaWeb/usuario/anuncio.do?act=listarAnunciosImovel&ci=${ims.codigo}" class="link_azul">Ver Disponibilidade</a> &nbsp;&nbsp; </logic:notEmpty>
    <logic:equal name="ims" property="status" value="1"><a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovelComp&ci=${ims.codigo}" class="link_azul">Editar Anúncio</a> &nbsp;&nbsp; </logic:equal>
  	<a href="javascript:excluirAnuncio()" class="link_azul">Excluir Anúncio</a>
  
  </div>
  
</div>
<div class="status_anuncio">
	<logic:notEmpty name="ims" property="reservas">
        <div class="verde_anuncio"><a href="#" onclick="javascript:openWindow('/DB4-BuskazaWeb/usuario/reserva.do?act=listarReservasImovel&ci=${ims.codigo}&status=0');" style="color:#90b821;">Você tem 2 pedidos de reserva</a></div>
      </logic:notEmpty>
      
      </div>
      
<div id="separator_listagem"></div>

<br>
  
  <!-- 
  <html:submit> Excluir Imóvel </html:submit>
  -->
  
</html:form>

<!-- 
<table border="0" class="MyriadPro18Verde" align="center" width="100%">
  <tr>
    <td align="center" valign="center">
    <logic:notEmpty name="ims" property="reservas">
        <fieldset>
          <a href="#" onclick="javascript:openWindow('/DB4-BuskazaWeb/usuario/reserva.do?act=listarReservasImovel&ci=${ims.codigo}&status=0');"> Você tem solicitações de Reserva </a>
        </fieldset>
      </logic:notEmpty></td>
  </tr>
 
</table>
-->

	 </logic:iterate>  
</logic:present>
</div>

</div></div>

</div>
<!--fimconteudo-->

</div>
<div class="sep_laranja"></div>

<!--BOX BOTTOM-->
<div id="boxes_bottom">
  <div class="box_facil_alugar">
    <div class="conteudo_facil_alugar">
      <div class="tit_facil_alugar">Veja como é fácil alugar no Buzkaza!</div>
      <div class="linha1_facil_alugar">
        <div class="boxes_facil_alugar_01">
          <div class="tit_box_facil_alugar">Máxima variedade</div>
          <div class="txt_box_facil_alugar">50.000 apartamentos em 300 destinos</div>
        </div>
        <div class="boxes_facil_alugar_01">
          <div class="tit_box_facil_alugar">Os melhores preços</div>
          <div class="txt_box_facil_alugar">Garantimos os melhores preços da rede</div>
        </div>
        <div class="boxes_facil_alugar_02">
          <div class="tit_box_facil_alugar">Clientes satisfeitos</div>
          <div class="txt_box_facil_alugar">Já são mais de 3 milhões de apartamentos reservados</div>
        </div>
      </div>
      <div class="linha2_facil_alugar">
        <div class="boxes_facil_alugar_01">
          <div class="tit_box_facil_alugar">Um sistema de pagamento seguro</div>
          <div class="txt_box_facil_alugar">Garantido pelo certificado SSL de Verisign</div>
        </div>
        <div class="boxes_facil_alugar_01">
          <div class="tit_box_facil_alugar">Apoio na sua língua</div>
          <div class="txt_box_facil_alugar">Apoio os 7 dias de semana, incluso feriado</div>
        </div>
        <div class="boxes_facil_alugar_02">
          <div class="tit_box_facil_alugar">Disponível em 13 línguas</div>
          <div class="txt_box_facil_alugar">Damos informações na sua própria língua</div>
        </div>
      </div>
    </div>
  </div>
  <div class="box_bnn">
    <div class="bnn_01"><img src="/buzkaza/_img/bnn_01.jpg" width="433" height="136" /></div>
    <div class="bnn_02"><img src="/buzkaza/_img/bnn_02.jpg" width="433" height="136" /></div>
  </div>
</div>
<!--BOX BOTTOM-->
</div>
<div id="linha_bg_cinza"></div>
<div id="bottom">
  <div class="meio_bottom">
    <div class="linha1_bottom">
      <div class="logo_bottom"></div>
      <div class="txt_bottom"> <span class="buzkaza_onde"> Buzkaza - em casa, onde estiver. </span><br />
        <br />
        <span class="buzkaza_onde2"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </span><br />
        <span class="buzkaza_duvidas">Dúvidas, Sugestões ou Reclamações <a href="mailto:contato@buzkaza.com.br" style="color:#B9B8B8;">contato@buzkaza.com.br</a></span> </div>
      <div class="contato_atendimento">
        <div class="tel"></div>
        <div class="atendimento"> <span class="tit_atendimento">Atendimento</span><br />
          <span class="buzkaza_onde2">Seg. a Sex. das 09:00 as 18:00</span> </div>
      </div>
      <div class="buzzchat"> <a href="http://www.easychat.com.br/easy/iframe_w33.php?chat_id=1944&clie_id=1885&check_sum=5714" target="_blank"><img src="http://www.easychat.com.br/easy/status/1944/1885" border=0> </a> </div>
    </div>
    <div class="tracejado_down"></div>
    <div class="direitos">- Todos os direitos reservados</div>
    <div class="afiliado">&#8226; Seja um afiliado</div>
    <div class="publicidade">&#8226; Publicidade</div>
    <div class="imprensa">&#8226; Imprensa</div>
    <div class="privacidade">&#8226; Privacidade</div>
    <div class="termos">&#8226; Termos e Condições</div>
  </div>
</div>
</body>
</html>
