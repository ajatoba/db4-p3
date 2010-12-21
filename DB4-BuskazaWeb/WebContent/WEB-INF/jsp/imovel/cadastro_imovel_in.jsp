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

<html:form method="post" styleId="imovelForm" action="/imovel.do?act=incluirImovel" enctype="multipart/form-data">


<div id="cont_cadastro">
<!--
<div id="indice_cadastro"><img src="/buzkaza/_img/indice_cadastro_imovel_02.jpg" width="971" height="57" /></div>
   -->
 
  <div id="formulario_cadastro_imovel">
  
  
    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
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
        <td class="MyriadPro14">Endereço</td>
        <td class="MyriadPro14">Número</td>
        <td class="MyriadPro14">Complemento</td>
        <td class="MyriadPro14">Bairro </td>
        <td class="MyriadPro14">CEP</td>
      </tr>
      <tr>
        <td><html:text property="logradouro" size="260"/></td>
        <td><html:text property="numero" size="88"/></td>
        <td><html:text property="complemento" size="138"/></td>
        <td><html:text property="bairro" size="138"/></td>
        <td><input name="cep" type="text" size="138" /></td>
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
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr class="MyriadPro14">
            <td>Cidade</td>
            <td>Estado</td>
            <td>País</td>
          </tr>
          <tr>
            <td><html:text property="municipio" size="160"/></td>
            <td><html:select property="imovelEntity.estado.codigo">
							<html:option value="AC">Acre</html:option> 
                            <html:option value="AL">Alagoas</html:option> 
                            <html:option value="AP">Amap&aacute;</html:option> 
                            <html:option value="AM">Amazonas</html:option> 
                            <html:option value="BA">Bahia</html:option> 
                            <html:option value="CE">Cear&aacute;</html:option> 
                            <html:option value="DF">Distrito Federal</html:option> 
                            <html:option value="ES">Espir&iacute;to Santo</html:option> 
                            <html:option value="GO">Goi&aacute;s</html:option> 
                            <html:option value="MA">Maranh&atilde;o</html:option> 
                            <html:option value="MT">Mato Grosso</html:option> 
                            <html:option value="MS">Mato Grosso do Sul</html:option> 
                            <html:option value="MG">Minas Gerais</html:option> 
                            <html:option value="PA">Par&aacute;</html:option> 
                            <html:option value="PB">Par&aacute;ba</html:option> 
                            <html:option value="PR">Paran&aacute;</html:option> 
                            <html:option value="PE">Pernambuco</html:option> 
                            <html:option value="PI">Piau&iacute;</html:option> 
                            <html:option value="RJ">Rio de Janeiro</html:option> 
                            <html:option value="RN">Rio Grande do Norte</html:option> 
                            <html:option value="RS">Rio Grande do Sul</html:option> 
                            <html:option value="RO">Rond&ocirc;nia</html:option> 
                            <html:option value="RR">Roraima</html:option> 
                            <html:option value="SC">Santa Catarina</html:option> 
                            <html:option value="SP">S&atilde;o Paulo</html:option> 
                            <html:option value="SE">Sergipe</html:option> 
                            <html:option value="TO">Tocantins</html:option>
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
            <td height="40" colspan="2"><img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul"> Características do Imóvel</span></span><br /></td>
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
            <td>
            <div style="margin-right:13px;">
				  <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
				    <option>apartamento</option>
				    <option>casa</option>
				    <option>flat</option>
				  </select>
  </div>
</td>
            <td>
            <div style="margin-right:13px;"><html:select property="quartos">
        		<html:option value="">&nbsp;</html:option> 
      			<html:option value="1">1 Quarto</html:option>
       			<html:option value="2">2 Quartos</html:option>
      	</html:select>
      	</div>
      	
      	</td>
            <td>
            <div style="margin-right:13px;">
            	<html:select property="metragem">
				<html:option value="">&nbsp;</html:option> 
      			<html:option value="20.0">20m</html:option>
       			<html:option value="30.0">30m</html:option>
                <html:option value="30.0">40m</html:option>
                <html:option value="30.0">50m</html:option>
                <html:option value="30.0">60m</html:option>
                <html:option value="30.0">70m</html:option>
      	</html:select>
      	</div></td>
            <td><html:select property="capacidade">
        		<html:option value="">&nbsp;</html:option> 
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
        <td colspan="2"><input name="youtube" type="text" size="245" /></td>
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
        <td height="40" colspan="5"><img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul"> Imagens  do Imóvel</span></span><br />
        <span class="MyriadPro14"> Arquivo (Qtd minima 6, máx 15/máx 200kb)</span></td>
        
        
      </tr>
      <tr>
        <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%">
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[1]" styleId="file1"/></div>
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[2]" styleId="file2"/></div>
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[3]" styleId="file3"/></div>
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[4]" styleId="file4"/></div>
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[5]" styleId="file5"/></div>
		        <div style="margin-top:8px;"><html:file property="arquivoFoto[6]" styleId="file6"/></div>
        	</td>
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
        <td colspan="5"><div style="float:right;"><input name="submit" type="image" src="/buzkaza/_img/btn_enviar_anuncio.jpg"  /></div></td>
      </tr>
      </table>
  

  </div>

</div>
</html:form>
    
    <p>&nbsp; </p>
    <p>&nbsp;</p>
  </div>
  
 <div id="bottom_cad"></div>
  
</div>
<!--FORM-->


</body>
</html>

