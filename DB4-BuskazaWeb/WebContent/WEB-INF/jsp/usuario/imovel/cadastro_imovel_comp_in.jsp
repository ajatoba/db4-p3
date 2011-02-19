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
<div id="cont_reserva">
<div id="meio_reserva">
<div class="top_reserva">
<div class="txt_meus_anuncios"><span class="MyriadPro24">Anunciar Imóvel</span></div>
</div>
</div>
<div id="sep_top_reserva"></div>
<div id="listagem_reservas">
<div class="topo_edicao">
<div class="mapa_planta"></div>
<div class="endereco_bairro">
<table border="0">
  <tr>
  	<td width="30%">
  		<img src="/buzkaza/imagens_usuarios/<bean:write name="imovel" property="primeirafoto"/>" width="140" height="104" />
  	</td>
    <td width="30%">
    	<bean:write name="imovel" property="bairro"/><br>
    	<bean:write name="imovel" property="logradouro"/>
    </td>
    <td>
      Distância do centro 10Km<br/>
      Mapa Google Maps:<bean:write name="imovel" property="linkGoogleMaps"/><br/>
      Vídeo You Tube:<bean:write name="imovel" property="linkYouTube"/>
    </td>
  </tr>
</table>

</div>

<div class="menu_edicao">
<div class="menu_01"></div>
<div class="menu_02"></div>
<div class="menu_03"></div>
</div>
<div id="formulario_edicao">
<div class="left_formulario">
<html:form method="post" styleId="imovelForm" action="/usuario/imovel.do?act=alterarImovel" enctype="multipart/form-data">
<html:hidden property="imovelEntity.codigo" />
<table width="100%" border="0">
  <tr>
    <td><img src="/buskaza/_img/bullet_laranja.jpg" width="19" height="15" /> Características do Imóvel</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>Perfil do Imóvel</td>
        <td>Quartos</td>
      </tr>
      <tr>
          <td>
            <div style="margin-right:12px;">
				  <html:select property="tipoImovel" styleId="tipoImovel">
					<html:options collection="tiposImovel" property="codigo" labelProperty="nome"/>
				</html:select>
			</div>
</td>
            <td>
            <div style="margin-right:12px;">
            <html:select property="quartos" styleId="quartos">
      			<html:option value="1">1 Quarto</html:option>
				<html:option value="2">2 Quartos</html:option>
				<html:option value="3">3 Quartos</html:option>
				<html:option value="4">4 Quartos</html:option>
				<html:option value="5">5 Quartos</html:option>
				<html:option value="6">6 Quartos</html:option>
				<html:option value="7">7 Quartos</html:option>
				<html:option value="8">8 Quartos</html:option>				
				<html:option value="9">9 Quartos</html:option>
				
				<html:option value="10">10 Quartos</html:option>
				<html:option value="11">11 Quartos</html:option>
				<html:option value="12">12 Quartos</html:option>
				<html:option value="13">13 Quartos</html:option>
				<html:option value="14">14 Quartos</html:option>
				<html:option value="15">15 Quartos</html:option>
				<html:option value="16">16 Quartos</html:option>
				<html:option value="17">17 Quartos</html:option>				
				<html:option value="18">18 Quartos</html:option>
				<html:option value="19">19 Quartos</html:option>
				
				<html:option value="20">20 Quartos</html:option>
				<html:option value="21">21 Quartos</html:option>
				<html:option value="22">22 Quartos</html:option>
      	</html:select></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>MEtragem</td>
        <td>Capacidade</td>
        <td>Distância do Centro</td>
      </tr>
      <tr>
        <td>
            <div style="margin-right:12px;">
            	<html:select property="metragem" styleId="metragem">
      			<html:option value="20.0">20m</html:option>
                <html:option value="25.0">25m</html:option>
                <html:option value="30.0">30m</html:option>
                <html:option value="35.0">35m</html:option>
                <html:option value="40.0">40m</html:option>
                <html:option value="45.0">45m</html:option>
                <html:option value="50.0">50m</html:option>
                <html:option value="55.0">55m</html:option>
                
                <html:option value="60.0">60m</html:option>
                <html:option value="65.0">65m</html:option>
                <html:option value="70.0">70m</html:option>
                <html:option value="75.0">75m</html:option>
                <html:option value="80.0">80m</html:option>
                <html:option value="85.0">85m</html:option>
                <html:option value="90.0">90m</html:option>
                <html:option value="95.0">95m</html:option>
                <html:option value="100.0">100m</html:option>
                
                <html:option value="105.0">105m</html:option>
                <html:option value="110.0">110m</html:option>
                <html:option value="115.0">115m</html:option>
                <html:option value="120.0">120m</html:option>
                <html:option value="125.0">125m</html:option>
                <html:option value="130.0">130m</html:option>
                <html:option value="135.0">135m</html:option>
                <html:option value="140.0">140m</html:option>
                <html:option value="145.0">145m</html:option>
                
                <html:option value="150.0">150m</html:option>
                <html:option value="155.0">155m</html:option>
                <html:option value="160.0">160m</html:option>
                <html:option value="165.0">165m</html:option>
                <html:option value="170.0">170m</html:option>
                <html:option value="175.0">175m</html:option>
                <html:option value="180.0">180m</html:option>
                <html:option value="185.0">185m</html:option>
                <html:option value="190.0">190m</html:option>
                
                <html:option value="195.0">195m</html:option>
                <html:option value="200.0">200m</html:option>
                <html:option value="205.0">205m</html:option>
                <html:option value="210.0">210m</html:option>
                <html:option value="215.0">215m</html:option>
                <html:option value="220.0">220m</html:option>
                <html:option value="225.0">225m</html:option>
                <html:option value="230.0">230m</html:option>
                <html:option value="235.0">235m</html:option>
                
                <html:option value="240.0">240m</html:option>
                <html:option value="245.0">245m</html:option>
                <html:option value="250.0">250m</html:option>
                <html:option value="255.0">255m</html:option>
                <html:option value="260.0">260m</html:option>
                <html:option value="265.0">265m</html:option>
                <html:option value="270.0">270m</html:option>
                <html:option value="275.0">275m</html:option>
                <html:option value="280.0">280m</html:option>
                
                <html:option value="285.0">285m</html:option>
                <html:option value="290.0">290m</html:option>
                <html:option value="295.0">295m</html:option>
                <html:option value="300.0">300m</html:option>
                <html:option value="305.0">305m</html:option>
                <html:option value="310.0">310m</html:option>
                <html:option value="315.0">315m</html:option>
                <html:option value="320.0">320m</html:option>
                <html:option value="325.0">325m</html:option>
                
                <html:option value="330.0">330m</html:option>
                <html:option value="335.0">335m</html:option>
                <html:option value="340.0">340m</html:option>
                <html:option value="345.0">345m</html:option>
                <html:option value="350.0">350m</html:option>
                <html:option value="355.0">355m</html:option>
                <html:option value="360.0">360m</html:option>
                <html:option value="365.0">365m</html:option>
                <html:option value="370.0">370m</html:option>
                
                <html:option value="375.0">375m</html:option>
                <html:option value="380.0">380m</html:option>
                <html:option value="385.0">385m</html:option>
                <html:option value="390.0">390m</html:option>
                <html:option value="395.0">395m</html:option>
                <html:option value="400.0">400m</html:option>
                <html:option value="405.0">405m</html:option>
                <html:option value="410.0">410m</html:option>
                <html:option value="415.0">415m</html:option>
                
                <html:option value="420.0">420m</html:option>
                <html:option value="425.0">425m</html:option>
                <html:option value="430.0">430m</html:option>
                <html:option value="435.0">435m</html:option>
                <html:option value="440.0">440m</html:option>
                <html:option value="445.0">445m</html:option>
                <html:option value="450.0">450m</html:option>
                <html:option value="455.0">455m</html:option>
                <html:option value="460.0">460m</html:option>
                
                <html:option value="465.0">465m</html:option>
                <html:option value="470.0">470m</html:option>
                <html:option value="475.0">475m</html:option>
                <html:option value="480.0">480m</html:option>
                <html:option value="485.0">485m</html:option>
                <html:option value="490.0">490m</html:option>
                <html:option value="495.0">495m</html:option>
                <html:option value="500.0">500m</html:option>
                <html:option value="505.0">505m</html:option>
                
                <html:option value="510.0">510m</html:option>
                <html:option value="515.0">515m</html:option>
                <html:option value="520.0">520m</html:option>
                <html:option value="525.0">525m</html:option>
                <html:option value="530.0">530m</html:option>
                <html:option value="535.0">535m</html:option>
                <html:option value="540.0">540m</html:option>
                <html:option value="545.0">545m</html:option>
                <html:option value="550.0">550m</html:option>
                
                <html:option value="555.0">555m</html:option>
                <html:option value="560.0">560m</html:option>
                <html:option value="565.0">565m</html:option>
                <html:option value="570.0">570m</html:option>
                <html:option value="575.0">575m</html:option>
                <html:option value="580.0">580m</html:option>
                <html:option value="585.0">585m</html:option>
                <html:option value="590.0">590m</html:option>
                <html:option value="595.0">595m</html:option>
                
                <html:option value="600.0">600m</html:option>

      	</html:select>
      	</div></td>
            <td><div style="margin-right:12px;"><html:select property="capacidade" styleId="capacidade">
      			<html:option value="1">1 Pessoa</html:option>
				<html:option value="2">2 Pessoas</html:option>
				<html:option value="3">3 Pessoas</html:option>
				<html:option value="4">4 Pessoas</html:option>
				<html:option value="5">5 Pessoas</html:option>
				<html:option value="6">6 Pessoas</html:option>
				<html:option value="7">7 Pessoas</html:option>
				<html:option value="8">8 Pessoas</html:option>	
				<html:option value="9">9 Pessoas</html:option>					
				<html:option value="10">10 Pessoas</html:option>
				<html:option value="11">11 Pessoas</html:option>
				<html:option value="12">12 Pessoas</html:option>
				<html:option value="13">13 Pessoas</html:option>
				<html:option value="14">14 Pessoas</html:option>
				<html:option value="15">15 Pessoas</html:option>
				<html:option value="16">16 Pessoas</html:option>
				<html:option value="17">17 Pessoas</html:option>
				<html:option value="18">18 Pessoas</html:option>
				<html:option value="19">19 Pessoas</html:option>								
				<html:option value="20">20 Pessoas</html:option>
				<html:option value="21">21 Pessoas</html:option>
				<html:option value="22">22 Pessoas</html:option>
      	</html:select>
      	</div></td>
        <td><label for="textfield"></label>         
          <html:text property="distanciaCentro" />
          
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr>
        <td>Camas</td>        
      </tr>
      <tr>
        <td><html:select property="camas">
        <html:option value="1">1</html:option>
        <html:option value="2">2</html:option>
        <html:option value="3">3</html:option>
        <html:option value="4">4</html:option>
        <html:option value="5">5</html:option>
        <html:option value="6">6</html:option>
        <html:option value="7">7</html:option>
        <html:option value="8">8</html:option>
        <html:option value="9">9</html:option>
        <html:option value="10">10</html:option>
            
        </html:select>
        </td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>Idiomas Falados</td>
  </tr>
  <tr>
    <td>
     <html:select property="idiomas" multiple="true">
     	<html:options collection="idiomas" property="codigo" labelProperty="nome"/>     
     </html:select>
     </td>
  </tr>
</table>

</div>
<div class="right_formulario">

</div>

<div class="bottom_formulario">
<table width="100%" border="0">
  <tr>
    <td>Dados de Check-In Check-Out</td>
  </tr>
  
  <tr>
    <td>
	    <table width="100%" border="0">
	      <tr>
	        <td>Nome de quem fará o Check in</td>
	        <td>Telefone</td>
	        <td>Telefone Aleternativo</td>
	        <td>Email</td>
	        <td>Email Alternativo</td>
	      </tr>
	      <tr>    
	        <td><html:text property="nomeCheckIn" /></td>
	        <td><html:text property="ddd" size="5" maxlength="3"/><html:text property="telefone"  size="8" maxlength="8"/></td>
	        <td><html:text property="ddd2"  size="5" maxlength="3"/><html:text property="telefone2" size="8" maxlength="8"/></td>
	        <td><html:text property="email" /></td>
	        <td><html:text property="email2" /></td>
	      </tr>
	    </table>
    </td>
  </tr>
  <tr>
  
    <td>
    <table width="100%" border="0">
      <tr>
        <td width="50%">Horário Check in</td>
        <td width="50%">Horário Check out</td>
        </tr>
      <tr>
        <td>De 
          <html:text property="checkInEntradaHora" size="2" maxlength="2" />
          :
         <html:text property="checkInEntradaMinuto" size="2" maxlength="2" />
          Até 
         <html:text property="checkInSaidaHora" size="2" maxlength="2" />
          :
          <html:text property="checkInSaidaMinuto" size="2" maxlength="2" />
        </td>
        <td>De
          <html:text property="checkOutEntradaHora" size="2" maxlength="2" />
		  :
		  <html:text property="checkOutEntradaMinuto" size="2" maxlength="2" />
		  Até
		  <html:text property="checkOutSaidaHora" size="2" maxlength="2" />
		  :
		  <html:text property="checkOutSaidaMinuto" size="2" maxlength="2" />
		 </td>
        </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td><input type="submit" name="gravar" id="button5" value="Gravar" /></td>
  </tr>
  
</table>
</html:form>
</div>
</div>
</div>

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
