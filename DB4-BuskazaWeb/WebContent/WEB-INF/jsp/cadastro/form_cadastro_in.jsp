<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="http://www.buzkaza.com.br/html/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />



	<link rel="stylesheet" href="http://www.buzkaza.com.br/html/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="http://www.buzkaza.com.br/html/teaser/requiered/jquery.js" ></script>
	<script type="text/javascript" src="http://www.buzkaza.com.br/html/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="http://www.buzkaza.com.br/html/teaser/includes/scripts/funcoes_js_mascara.js" ></script>
	<script type="text/javascript" src="http://www.buzkaza.com.br/html/teaser/includes/scripts/funcoes_js_validacoes.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'http://www.buzkaza.com.br/html/teaser/jqtransformplugin/img/'});
		});


		function gravarLocador(){
			var form = 	document.locadorForm;
			if(checkForm(form)){
				form.submit();
			}			
		}
	</script>
<link href="http://www.buzkaza.com.br/html/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="cadastro">
<div id="top_cad">
<a href="index.html"><div id="link_back"></div></a>
</div>
<div id="meio_cad">
<!--FORM-->
<div id="cont_cadastro">
  <div id="indice_cadastro"></div>
  <div id="formulario_cadastro">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt">Informações do proprietário</span><br />
      <br />
    </p>
     <html:form method="post" styleId="locadorForm" action="/locador?act=incluirLocador">
      <div>
        <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td width="18%" class="MyriadProRegular">Modalidade</td>
            <td width="58%" class="MyriadProRegular">Nome Completo / Razão Social</td>
            <td width="24%" class="MyriadProRegular">Nome para contato</td>
          </tr>
          <tr>
            <td width="18%"><html:select property="locadorEntity.modalidade" class="MyriadProRegular">
      <html:option value="F"><bean:message key="label.cadastro.campo.pessoafisica"/></html:option>
       <html:option value="J"><bean:message key="label.cadastro.campo.pessoajuridica"/></html:option>
      </html:select></td>
            <td height="50"><html:text property="locadorEntity.nome" titleKey="label.cadastro.campo.nome" styleClass="MyriadProRegular" size="50"/></td>
            <td><html:text property="locadorEntity.nomeContato" titleKey="label.cadastro.campo.nomecontato" styleClass="MyriadProRegular" /></td>
          </tr>
        </table>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="32%" class="MyriadProRegular">Telefone fixo</td>
            <td width="36%" class="MyriadProRegular">Telefone Celular</td>
            <td width="32%" class="MyriadProRegular">CPF/ CNPJ</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td width="28%"><html:text size="6" maxlength="3" styleClass="MyriadProRegular"  property="dddFixo" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /></td>
                <td width="72%"><html:text maxlength="8" size="18" styleClass="MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" property="numeroFixo" /></td>
              </tr>
            </table></td>
            <td height="50"><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td width="28%"><html:text maxlength="3"  size="6" styleClass="MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" property="dddCelular" /></td>
                <td width="72%"><html:text maxlength="8" size="18" styleClass="MyriadProRegular" property="numeroCelular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /></td>
              </tr>
            </table></td>
            <td><html:text maxlength="18" size="35" property="locadorEntity.cpfCnpj" titleKey="label.cadastro.campo.cpfcnpj" styleClass="MyriadProRegular" /></td>
          </tr>
        </table>
      </div>
      <div>
        <div id="bg_criar_user">
          <div class="alinha_table">
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="16%" rowspan="2" class="MyriadProSemiboldIt">Criar usuário &gt;</td>
                <td width="20%" class="MyriadProRegular">Email (login)</td>
                <td width="20%" class="MyriadProRegular">Confirmar Email (login)</td>
                <td width="20%" class="MyriadProRegular">Senha</td>
                <td width="20%" class="MyriadProRegular">Confirmar Senha</td>
              </tr>
              <tr>
                <td width="20%"><html:text size="16" property="locadorEntity.email" titleKey="label.cadastro.campo.email" styleClass="MyriadProRegular" /></td>
                <td width="20%"><html:text size="16" property="emailConfirma" titleKey="label.cadastro.campo.confirmaremail" styleClass="MyriadProRegular" /></td>
                <td width="20%"><html:password size="16" styleClass="MyriadProRegular" titleKey="label.cadastro.campo.senha" property="locadorEntity.senha" /></td>
                <td width="20%"><html:password size="16" styleClass="MyriadProRegular" titleKey="label.cadastro.campo.confirmarsenha" property="senhaConfirma" /></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="end_correspondencia"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt">Endereço para correspondência</span> <br />
        <br />
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr class="MyriadProRegular">
            <td>Endereço</td>
            <td>Estado</td>
            <td>Cidade</td>
            <td>País</td>
            <td>CEP</td>
          </tr>
          
          <tr>
            <td height="50"><html:text size="15" property="locadorEntity.endereco.logradouro" styleClass="MyriadProRegular" size="35"/></td>
            <td><html:select property="locadorEntity.endereco.estado.codigo">  
				<html:options collection="estados" property="codigo" labelProperty="nome" />
          </html:select>  </td>
            <td><html:text size="10" styleClass="MyriadProRegular" property="locadorEntity.endereco.municipio" /></td>
            <td><html:select property="pais">  
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select></td>
            <td><html:text size="10" property="cep" styleClass="MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /></td>
          </tr>
        </table>
    </div>
      <div class="planos_adesao">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div><input type="checkbox" name="chbox" checked="checked" id=""></div><div style=" float:left; width:500px; margin-top:7px; margin-left:3px;"><span class="MyriadPro14">Desejo receber informações  deste site no meu email</span></div></td>
          </tr>
          <tr>
            <td><div><input type="checkbox" name="chbox" checked="checked" id=""></div><div style=" float:left; width:500px; margin-top:7px; margin-left:3px;"><span class="MyriadPro14">Li e aceito os termos e condições deste site</span></div></td>
          </tr>
        </table>
      </div>
      <div class="btn_cadastrar">
        <div class="btn_erro"></div>
        <div class="msg_erro"><span class="MyriadErro">Erro vc precisa preencher os campos em vermelho.</span></div>
        <div class="btn"><img src="_img/btn_cadastrar_user.jpg.jpg" width="211" height="30" /></div>
      </div>
    </form>
    <p>&nbsp; </p>
    <p>&nbsp;</p>
  </div>
</div>
<!--FORM-->
</div>
<div id="bottom_cad"></div>
</div>
</body>
</html>
