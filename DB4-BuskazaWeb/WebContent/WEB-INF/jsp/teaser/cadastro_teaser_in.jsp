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

<link href="/buzkaza/teaser/_css/fontes.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/buzkaza/teaser/jqtransformplugin/jqtransform.css" type="text/css" media="all" />
	<script type="text/javascript" src="/buzkaza/teaser/requiered/jquery.js" ></script>
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/includes/scripts/funcoes_js_mascara.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/includes/scripts/jquery.maskedinput.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/includes/scripts/funcoes_js_validacoes.js" ></script>
	
	<script language="javascript">
		$(function(){
			$('#usuarioForm').jqTransform({imgPath:'/buzkaza/teaser/jqtransformplugin/img/'});
			
			//$("#cep").mask("99999-999");
			$("#cpf").mask("999.999.999-99");			
		});

		function gravarUsuario(){
			var form = 	document.usuarioForm;
			if(checkForm(form)){
				form.submit();
			}			
		}

		function seleciona_tipo_usuario()
		{
				tipo=   $("#tipo_usuario").val();
								
				if( tipo== "F")
				{
					$("#pessoa").html('<input type="text" id="cpf" title="CPF"  name="usuarioEntity.cpfCnpj"  size="35" class="cpf,MyriadProRegular" onkeydown="Mascara(this,Cpf);" onkeyup="Mascara(this,Cpf)" onkeypress="Mascara(this,Cpf);" maxlength="14"/>');
					
					$("#cpf").jqTransInputText();
					$("#cpf").mask("999.999.999-99");
				}
				else if( tipo== "J")
				{
					$("#pessoa").html('<input type="text" id="cnpj" name="usuarioEntity.cpfCnpj" title="CNPJ"  size="35" value="" class="cnpj,MyriadProRegular" onkeydown="Mascara(this,Cnpj);" onkeyup="Mascara(this,Cnpj)" onkeypress="Mascara(this,Cnpj);" maxlength="19"/>');
					
					$("#cnpj").jqTransInputText();
					$("#cnpj").mask("99.999.999/9999-99");
				}
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

    
	<html:form method="post" styleId="usuarioForm" action="/usuario?act=incluirUsuario">
      <div>
        <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td width="18%" class="MyriadProRegular">Modalidade</td>
            <td width="28%" class="MyriadProRegular">Nome Completo / Razão Social</td>
            <td width="24%" class="MyriadProRegular">Nome para contato</td>
             <td width="30%" class="MyriadProRegular">Data de nascimento</td>
          </tr>
          <tr>
            <td width="18%">
              <html:select property="usuarioEntity.modalidade" title="Modalidade" styleId="tipo_usuario" styleClass="MyriadProRegular,string" onchange="seleciona_tipo_usuario()">
      			<html:option value="F"><bean:message key="label.cadastro.campo.pessoafisica"/></html:option>
       			<html:option value="J"><bean:message key="label.cadastro.campo.pessoajuridica"/></html:option>
      		  </html:select>            
            </td>
            <td height="50">
            	<html:text property="usuarioEntity.nome" title="Nome" size="40" styleClass="string,MyriadProRegular"/>
            </td>
            <td>
            	<html:text property="usuarioEntity.nomeContato" title="Nome do contato" styleClass="string,MyriadProRegular" />
            </td>
            <td>
            	<html:text size="3" maxlength="2" property="diaNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /> &nbsp;
            	<html:text size="3" maxlength="2" property="mesNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" /> &nbsp;
  				<html:text size="5" maxlength="4" property="anoNascimento" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
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
                	<html:text size="6" title="DDD Fixo" maxlength="3" property="dddFixo" styleClass="number,MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
                <td width="72%">
                   	<html:text title="Numero fixo" property="numeroFixo" styleClass="number,MyriadProRegular" maxlength="8" size="18" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
              </tr>
            </table></td>
            <td height="50"><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td width="28%"><html:text title="DDD Celular" property="dddCelular"  styleClass="number,MyriadProRegular" maxlength="3" size="6" value="" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
                <td width="72%"><html:text title="Numero celular" property="numeroCelular" styleClass="number,MyriadProRegular" maxlength="8" size="18" value="" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
              </tr>
            </table></td>
            <td>
            		<div id="pessoa"><html:text property="usuarioEntity.cpfCnpj" title="CPF" size="35" styleId="cpf" maxlength="14" styleClass="cpf,MyriadProRegular" onkeydown="Mascara(this,Cpf);" onkeyup="Mascara(this,Cpf)" onkeypress="Mascara(this,Cpf);" /></div>
            	
            </td>
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
                <td width="20%"><html:text title="Email" property="usuarioEntity.email" styleClass="email,MyriadProRegular" size="16" /></td>
                <td width="20%"><html:text title="Confirmação de Email" property="emailConfirma" styleClass="email,MyriadProRegular" size="16" /></td>
                <td width="20%"><html:password title="Senha" property="usuarioEntity.senha" styleClass="string,MyriadProRegular" size="16" /></td>
                <td width="20%"><html:password title="Confirmação de Senha" property="senhaConfirma" styleClass="string,MyriadProRegular" size="16" /></td>
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
            <td height="50"><html:text title="Endereco" property="usuarioEntity.endereco.logradouro" size="35" styleClass="string,MyriadProRegular"/></td>
            <td>
            	<html:select property="usuarioEntity.endereco.estado.codigo" title="Estado" styleClass="string,MyriadProRegular">  
					<html:options collection="estados" property="codigo" labelProperty="nome" />
          		</html:select>  
          	</td>
            <td><html:text property="usuarioEntity.endereco.municipio" title="Municipio" size="10" styleClass="string,MyriadProRegular"/></td>
            <td>            
            	<html:select property="pais" styleClass="number,MyriadProRegular" title="Pais">  
					<html:options collection="paises" property="codigo" labelProperty="nome"/>
				</html:select>
            </td>
            <td><html:text property="cep" styleId="cep" size="10" title="Cep" styleClass="cep,MyriadProRegular" maxlength="9"/></td>
          </tr>
        </table>
    </div>
      <div class="planos_adesao">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div><html:checkbox property="usuarioEntity.recebeInfo" styleClass="MyriadProRegular"/></div><div style=" float:left; width:500px; margin-top:7px; margin-left:3px;"><span class="MyriadPro14">Desejo receber informações  deste site no meu email</span></div></td>
          </tr>
          <tr>
            <td><div><html:checkbox title="Condicoes" property="usuarioEntity.leuCondicoes" styleClass="number,MyriadProRegular"/></div><div style=" float:left; width:500px; margin-top:7px; margin-left:3px;"><span class="MyriadPro14">Li e aceito os termos e condições deste site</span></div></td>
          </tr>
        </table>
      </div>
      
		

      <div class="btn_cadastrar">        
        <div class="btn"><a href="#" onclick="gravarUsuario();" border="0"><img src="/buzkaza/teaser/_img/btn_cadastrar_user.jpg.jpg" width="211" height="30" border="0"/></a></div>
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
