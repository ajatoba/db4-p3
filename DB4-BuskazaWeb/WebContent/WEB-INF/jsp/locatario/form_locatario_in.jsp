<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Buzkaza</title>
<link href="/html/_css/cadastro.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="/html/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="/html/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/html/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/includes/scripts/funcoes_js_mascara.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/includes/scripts/funcoes_js_validacoes.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/html/jqtransformplugin/img/'});
		});
	
		function gravarLocatario(){
			var form = 	document.locatarioForm;
			if(checkForm(form)){
				form.submit();
			}			
		}
	</script>
<link href="/html/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="linha_topo"></div>
<div id="site">
<div id="top_header"><img src="/html/images/top_01.jpg" width="991" height="31" /></div>
<div id="meio_header"><img src="/html/images/top_02.jpg" width="991" height="86" /></div>
<div id="bottom_header"><img src="/html/images/top_03.jpg" width="991" height="77" /></div>
<!--CADASTRO-->
<div id="cont_cadastro">
<div id="indice_cadastro"><img src="/html/_img/indice_cad_user_02.jpg" width="971" height="55" /></div>
<div id="formulario_cadastro">
  <p><img src="/html/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt">Informações do locador</span><br />
    <br />
  </p>
  
   <font color="red">
  
		<logic:messagesPresent property="erro">
					<html:messages property="erro" id="erro">
						<bean:write name="erro"/>
					</html:messages>
				</logic:messagesPresent>
				
				<logic:messagesNotPresent property="erro">
					<logic:present name="erro">
							<bean:write name="erro"/>
					</logic:present>
				
				</logic:messagesNotPresent>
  </font>
   <html:form method="post" styleId="locatarioForm" action="/locatario?act=incluirLocatario"><div>
  <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
       <td width="30%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.modalidade"/></td>
      <td width="70%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.nome"/></td>
      <td width="30%" class="MyriadProRegular">Nacionalidade</td>
    </tr>
    <tr>
     <td width="30%"><html:select property="locatarioEntity.modalidade">
      <html:option value="F"><bean:message key="label.cadastro.campo.pessoafisica"/></html:option>
       <html:option value="J"><bean:message key="label.cadastro.campo.pessoajuridica"/></html:option>
      </html:select>
		</td>
      <td height="50">
      	<html:text property="locatarioEntity.nome" titleKey="label.cadastro.campo.nome" styleClass="string" size="40"/>
      </td>
      <td> 	<html:text property="locatarioEntity.nacionalidade" title="Nacionalidade" styleClass="string" /></td>
    </tr>
  </table>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td class="MyriadProRegular"><bean:message key="label.cadastro.campo.telefonefixo"/></td>
      <td class="MyriadProRegular"><bean:message key="label.cadastro.campo.telefonecelular"/></td>
      <td class="MyriadProRegular">Data nascimento</td>
    </tr>
    <tr>
      <td><html:text size="3" maxlength="3" property="dddFixo" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />&nbsp;&nbsp;&nbsp;<html:text maxlength="8" size="8" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" property="numeroFixo"  /></td>
      <td height="50"><html:text maxlength="3"  size="3" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" property="dddCelular" />&nbsp;&nbsp;&nbsp;<html:text maxlength="8" property="numeroCelular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /></td>
      
      <td><html:text size="3" maxlength="2" property="diaNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        <html:text size="3" maxlength="2" property="mesNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
       <html:text size="5" maxlength="4" property="anoNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />&nbsp;&nbsp;&nbsp;\
        </td>
    </tr>
  </table></div>
  <div>
  <div id="bg_criar_user"><div class="alinha_table">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="16%" rowspan="2" class="MyriadProSemiboldIt"><bean:message key="label.cadastro.titulo.criarusuario"/></td>
        <td width="20%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.email"/></td>
        <td width="20%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.confirmaremail"/></td>
        <td width="20%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.senha"/></td>
        <td width="20%" class="MyriadProRegular"><bean:message key="label.cadastro.campo.confirmarsenha"/></td>
      </tr>
      <tr>
        <td width="20%"><html:text size="15" property="locatarioEntity.email" titleKey="label.cadastro.campo.email" styleClass="email" /></td>
        <td width="20%"><html:text size="15" property="emailConfirma" titleKey="label.cadastro.campo.confirmaremail" styleClass="email" /></td>
        <td width="20%"><html:password size="15" styleClass="string" titleKey="label.cadastro.campo.senha" property="locatarioEntity.senha" /></td>
        <td width="20%"><html:password size="15" styleClass="string" titleKey="label.cadastro.campo.confirmarsenha" property="senhaConfirma" /></td>
      </tr>
    </table></div>
  </div>
  </div>
  <div class="end_correspondencia">
    <img src="/html/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt"><bean:message key="label.cadastro.titulo.endereco"/></span>
    <br /><br />
    <table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr class="MyriadProRegular">
    <td><bean:message key="label.cadastro.campo.endereco"/></td>
    <td><bean:message key="label.cadastro.campo.estado"/></td>
    <td><bean:message key="label.cadastro.campo.cidade"/></td>
    <td><bean:message key="label.cadastro.campo.pais"/></td>
    <td><bean:message key="label.cadastro.campo.cep"/></td>
  </tr>
  <tr>
    <td height="50"><html:text size="15" property="locatarioEntity.endereco.logradouro" size="40"/></td>
    <td> <html:select property="locatarioEntity.endereco.estado.codigo">  
				<html:options collection="estados" property="codigo" labelProperty="nome" />
          </html:select>  
			</td>
    <td><html:text size="10" property="locatarioEntity.endereco.municipio" /></td>
    <td>     <html:select property="pais">  
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select></td>
    <td><html:text size="10" property="cep" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /></td>
  </tr>
</table>

  </div>
    <div class="planos_adesao">
      <img src="/html/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt" >Planos de adesão</span></div>
  <div class="btn_cadastrar">
  <!-- div class="btn_erro"></div>
  <div class="msg_erro"><span class="MyriadErro">Erro vc precisa preencher os campos em vermelho.</span></div-->
  
  <div class="btn"><a href="#" onclick="gravarLocatario();" ><img src="/html/_img/btn_cadastrar_user.jpg.jpg" width="211" height="30" /></a></div>
  </div>
  </html:form>
  <p>&nbsp; </p>
  <p>&nbsp;</p>
</div>

</div>
<!--FIM CADASTRO-->
<div id="linha_meio"></div>
<div id="boxes"><img src="/html/images/formulario_proprietario(zig.jpg" width="991" height="283" /></div>
<div id="bottom"><img src="/html/images/formulario_proprietario(zig.gif" width="991" height="253" /></div>

</div>
</body>
</html>
