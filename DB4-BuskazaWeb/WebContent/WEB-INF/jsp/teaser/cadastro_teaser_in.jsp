<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="/buzkaza/teaser/_css/estilo.css" rel="stylesheet" type="text/css" />

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
<script type="text/javascript" src="requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script language="javascript">
		$(function(){
			$('#form').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
		});

		function gravarLocador(){
			var form = 	document.locadorForm;
			//if(checkForm(form)){
				document.forms[0].submit();
			//}			
		}
		
	</script>
<link href="/buzkaza/teaser/webfontkit-20101006-104039/stylesheet.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="cadastro">
<div id="top_cad">
<a href="index.html"><div id="link_back"></div></a>
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
<!--FORM-->
<div id="cont_cadastro">
  <div id="indice_cadastro"></div>
  <div id="formulario_cadastro">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/buzkaza/teaser/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt">Informações do proprietário</span><br />
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
            <td width="18%">
              <html:select property="locadorEntity.modalidade" styleClass="MyriadProRegular">
      			<html:option value="F"><bean:message key="label.cadastro.campo.pessoafisica"/></html:option>
       			<html:option value="J"><bean:message key="label.cadastro.campo.pessoajuridica"/></html:option>
      		  </html:select>            
            </td>
            <td height="50">
            	<html:text property="locadorEntity.nome" styleClass="MyriadProRegular"/>
            </td>
            <td>
            	<html:text property="locadorEntity.nomeContato" styleClass="MyriadProRegular" />
            </td>
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
                <td width="28%">
                	<html:text size="3" maxlength="3" property="dddFixo" styleClass="MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
                <td width="72%">
                   	<html:text property="numeroFixo" styleClass="MyriadProRegular" maxlength="8" size="8" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
              </tr>
            </table></td>
            <td height="50"><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td width="28%"><html:text property="dddCelular"  styleClass="MyriadProRegular" maxlength="3" size="6" value="" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
                <td width="72%"><html:text property="numeroCelular" styleClass="MyriadProRegular" maxlength="8" size="18" value="" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
              </tr>
            </table></td>
            <td><html:text property="locadorEntity.cpfCnpj" size="35" styleClass="MyriadProRegular" /></td>
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
                <td width="20%"><html:text property="locadorEntity.email" styleClass="MyriadProRegular" size="16" /></td>
                <td width="20%"><html:text property="emailConfirma" styleClass="MyriadProRegular" size="16" /></td>
                <td width="20%"><html:text property="locadorEntity.senha" styleClass="MyriadProRegular" size="16" /></td>
                <td width="20%"><html:text property="senhaConfirma" styleClass="MyriadProRegular" size="16" /></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="end_correspondencia"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/buzkaza/teaser/_img/bullet_cadastro.jpg" width="22" height="13" /><span class="MyriadProSemiboldIt">Endereço para correspondência</span> <br />
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
            <td height="50"><html:text property="locadorEntity.endereco.logradouro" size="35" styleClass="MyriadProRegular"/></td>
            <td>
            	<html:select property="locadorEntity.endereco.estado.codigo" styleClass="MyriadProRegular">  
					<html:options collection="estados" property="codigo" labelProperty="nome" />
          		</html:select>  
          	</td>
            <td><html:text property="locadorEntity.endereco.municipio" size="10" styleClass="MyriadProRegular"/></td>
            <td>            
            	<html:select property="pais" styleClass="MyriadProRegular">  
					<html:options collection="paises" property="codigo" labelProperty="nome"/>
				</html:select>
            </td>
            <td><html:text property="cep" size="10" styleClass="MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
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
      
		<html:hidden property="locadorEntity.banco.codigo" value="1"/>    

      <div class="btn_cadastrar">        
        <div class="btn"><a href="#" onclick="gravarLocador();" border="0"><img src="/buzkaza/teaser/_img/btn_cadastrar_user.jpg.jpg" width="211" height="30" border="0"/></a></div>
      </div>
    </html:form>
    
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
