<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>

	<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />
	<link href="/buzkaza/_css/cadastro_imovel.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />

	<script type="text/javascript" src="/buzkaza/topup/jquery-1.4.2.min.js" ></script>	
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/script/thickbox.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/_css/estilo_iframe.css" />
	<script type="text/javascript" src="/buzkaza/thickbox/script/thickbox.js" ></script>
	<script type="text/javascript" src="/buzkaza/thickbox/script/global.js" ></script>
	
	<script language="javascript">
		$(function(){
			$('#imovelForm').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});
	</script>
	
	<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="cadastro">
<div id="top_cad">
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">

<!-- MENSAGEM DE ERRO -->
    <font color="red">
  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>						
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<div class="btn_erro"></div>
        		<div class="msg_erro">
        			<span class="MyriadErro">
        				<bean:write name="erro"/>
        			</span>
        		</div>	
			</logic:present>
				
		</logic:messagesNotPresent>
  	</font>
    <!-- ****************** -->

<!--CADASTRO-->

<html:form method="post" styleId="imovelForm" action="/usuario/imovel.do?act=incluirImovel" enctype="multipart/form-data">


<div id="cont_cadastro" style="height:auto;">
<!--
<div id="indice_cadastro"><img src="/buzkaza/_img/indice_cadastro_imovel_02.jpg" width="971" height="57" /></div>
   -->
 
  <div id="formulario_cadastro_imovel" style="margin-top:10px;">
  
  
    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="2">
      <tr>
        <td colspan="2"><img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul"> Endereço</span></span><br /></td>
        <td width="17%">&nbsp;</td>
        <td width="17%">&nbsp;</td>
        <td width="24%">&nbsp;</td>
      </tr>
      <tr>
        <td width="30%">&nbsp;</td>
        <td width="12%">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="MyriadProRegular">Endereço</td>
        <td class="MyriadProRegular">Número</td>
        <td class="MyriadProRegular">Complemento</td>
        <td class="MyriadProRegular">Bairro </td>
        <td class="MyriadProRegular">CEP</td>
      </tr>
      <tr>
        <td><html:text property="logradouro" size="260"/></td>
        <td><html:text property="numero" size="88"/></td>
        <td><html:text property="complemento" size="138"/></td>
        <td><html:text property="bairro" size="138"/></td>
        <td><html:text property="cep" size="138"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr class="MyriadProRegular">
            <td>Cidade</td>
            <td>Estado</td>
            <td>País</td>
          </tr>
          <tr>
            <td><html:text property="municipio" size="160"/></td>
            <td><html:select property="imovelEntity.estado.codigo">
            	<html:options collection="estados" property="codigo" labelProperty="nome"/>
							
        	</html:select></td>
            <td><html:select property="pais">  
        		<html:option value="">&nbsp;</html:option> 
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5"><table width="70%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td height="40" colspan="2"><img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul"> Características do Imóvel</span></span><br /></td>
            <td width="14%">&nbsp;</td>
            <td width="49%">&nbsp;</td>
          </tr>
          <tr class="MyriadProRegular">
            <td width="20%">Perfil do Imóvel</td>
            <td width="17%">Quartos</td>
            <td>Metragem</td>
            <td>Capacidade</td>
          </tr>
          <tr>
            <td>
            <div style="margin-right:12px;">
				  <html:select property="tipoImovel">  
        			<html:option value="">&nbsp;</html:option> 
					<html:options collection="tiposImovel" property="codigo" labelProperty="nome"/>
				</html:select>
			</div>
</td>
            <td>
            <div style="margin-right:12px;">
            <html:select property="quartos">
        		<html:option value="">&nbsp;</html:option> 
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
            <td>
            <div style="margin-right:12px;">
            	<html:select property="metragem">
				<html:option value="">&nbsp;</html:option> 
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
            <td><div style="margin-right:12px;"><html:select property="capacidade">
        		<html:option value="">&nbsp;</html:option> 
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
          </tr>
        </table></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="MyriadProRegular">Planta do Imóvel</td>
        <td>&nbsp;</td>
        <td class="MyriadProRegular">Link do vídeo no You Tube</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><div style="float:left"><html:file property="planta" size="23" style="width:300px; color:#666666;"/></div>
        			<div style="float:left; margin-left:15px"> <a class="thickbox" href="/buzkaza/thickbox/imagem_planta.html?height=400&width=600" ><img src="/buzkaza/thickbox/_img/interrogacao.png" widht="22" height="21" border="0" style="margin-top:2px;" /></a></div>
        </td>
        <td colspan="2"><html:text property="linkYouTube" size="245" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;<br /></td>
      </tr>
      <tr>
        <td  height="40" colspan="5">
        <img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul"> Imagens  do Imóvel</span></span>
        <br /><span class="MyriadProRegular"> Arquivo (Qtd máx 6/máx 200kb)</span></td>
      </tr>
      <tr>
        <td colspan="5">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><div style="margin-right:12px;"><html:file property="arquivoFoto[1]" styleId="file1" size="23" style="width:300px; color:#666666;"/></div></td>
                <td><div style="margin-right:12px;"><html:file property="arquivoFoto[3]" styleId="file3" size="23" style="width:300px; color:#666666;"/></div></td>
                <td><html:file property="arquivoFoto[5]" styleId="file5" size="23" style="width:300px; color:#666666;"/></td>
              </tr>
              <tr>
                <td><div style="margin-top:8px;"><html:file property="arquivoFoto[2]" styleId="file2" size="23" style="width:300px; color:#666666;"/></div></td>
                <td><div style="margin-top:8px;"><html:file property="arquivoFoto[4]" styleId="file4" size="23" style="width:300px; color:#666666;"/></div></td>
                <td><div style="margin-top:8px;"><html:file property="arquivoFoto[6]" styleId="file6" size="23" style="width:300px; color:#666666;"/></div></td>
              </tr>
            </table>
        
        
        </td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5"><div style="float:right;"><input name="submit" type="image" src="/buzkaza/_img/btn_enviar_anuncio.jpg"  /></div></td>
      </tr>
      </table>
  

  </div>

</div>
</html:form>
    
    <br />
  </div>
  
 <div id="bottom_cad"></div>
  
</div>
<!--FORM-->


</body>
</html>

