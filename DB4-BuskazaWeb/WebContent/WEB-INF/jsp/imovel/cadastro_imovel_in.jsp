<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="/buzkaza/_css/cadastro_imovel.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/buzkaza/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#usuarioForm').jqTransform({imgPath:'/buzkaza/jqtransformplugin/img/'});
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

<html:form method="post" styleId="imovelForm" action="/imovel.do?act=incluirImovel" enctype="multipart/form-data">


<div id="cont_cadastro">
<div id="indice_cadastro"><img src="_img/indice_cadastro_imovel_02.jpg" width="971" height="57" /></div>
  <div id="formulario_cadastro_imovel"><form id="form">
    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2"><img src="_img/bullet_laranja.jpg" width="19" height="15" /><span class="MyriadPro18Azul_italic">Endereço</span></td>
        <td width="24%">&nbsp;</td>
        <td width="26%">&nbsp;</td>
        <td width="10%">&nbsp;</td>
      </tr>
      <tr>
        <td width="29%">&nbsp;</td>
        <td width="11%">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="MyriadPro14">Endereço</td>
        <td class="MyriadPro14">Número</td>
        <td class="MyriadPro14">Complemento</td>
        <td class="MyriadPro14">Bairro </td>
        <td class="MyriadPro14">CEP</td>
      </tr>
      <tr>
        <td><html:text property="logradouro"/></td>
        <td><html:text property="numero"/></td>
        <td><html:text property="complemento"/></td>
        <td><html:text property="bairro"/></td>
        <td><html:text property="cep"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="MyriadPro14">
            <td>Cidade</td>
            <td>Estado</td>
            <td>País</td>
          </tr>
          <tr>
            <td><html:text property="municipio"/></td>
            <td><html:select property="imovelEntity.estado.codigo"> 
        		<html:option value=""></html:option> 
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select></td>
            <td><html:select property="pais">  
        		<html:option value=""></html:option> 
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
        <td colspan="5"><table width="70%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="40" colspan="2"><img src="_img/bullet_laranja.jpg" width="19" height="15" /><span class="MyriadPro18Azul_italic">Características do Imóvel</span></td>
            <td width="14%">&nbsp;</td>
            <td width="49%">&nbsp;</td>
          </tr>
          <tr class="MyriadPro14">
            <td width="20%">Perfil do Imóvel</td>
            <td width="17%">Quartos</td>
            <td>Metragem</td>
            <td>Capacidade</td>
          </tr>
          <tr>
            <td><html:select property="perfil_imovel">
				<html:option value=""></html:option> 
      			<html:option value="casa">Casa</html:option>
       			<html:option value="apartamento">Apartamento</html:option>
                <html:option value="flat">Flat</html:option>
      	</html:select></td>
            <td><html:select property="quartos">
        		<html:option value=""></html:option> 
      			<html:option value="1">1 Quarto</html:option>
       			<html:option value="2">2 Quartos</html:option>
      	</html:select></td>
            <td><html:select property="metragem">
				<html:option value=""></html:option> 
      			<html:option value="20.0">20m</html:option>
       			<html:option value="30.0">30m</html:option>
                <html:option value="30.0">40m</html:option>
                <html:option value="30.0">50m</html:option>
                <html:option value="30.0">60m</html:option>
                <html:option value="30.0">70m</html:option>
      	</html:select></td>
            <td><html:select property="capacidade">
        		<html:option value=""></html:option> 
      			<html:option value="1">1 Pessoa</html:option>
       			<html:option value="2">2 Pessoas</html:option>
      	</html:select></td>
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
        <td class="MyriadPro14">Planta do Imóvel</td>
        <td>&nbsp;</td>
        <td class="MyriadPro14">Link do vídeo no You Tube</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><html:file property="planta" /></td>
        <td colspan="2"><label for="textfield31"></label>
          <html:text property="link_youtube"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5"><span class="MyriadPro18Azul">Imagens  do Imóvel</span><span class="MyriadPro18"> Arquivo (Qtd minima 6, máx 15/máx 200kb)</span></td>
      </tr>
      <tr>
        <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label for="fileField"></label>
        <html:file property="arquivoFoto[1]" /><br/>
        <html:file property="arquivoFoto[2]" /><br/>
        <html:file property="arquivoFoto[3]" /><br/>
        <html:file property="arquivoFoto[4]" /><br/>
        <html:file property="arquivoFoto[5]" /><br/></td>
            <td width="25%">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5"><div style="float:right;"><img src="_img/btn_enviar_anuncio.jpg" width="211" height="40" /></div></td>
      </tr>
      </table></form>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p><br />
</p>
  <p>&nbsp; </p>
  <p>&nbsp;</p>
  </div>

</div><!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/buzkaza/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="bottom"><img src="/buzkaza/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
