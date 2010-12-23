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
	
	<script type="text/javascript" src="/buzkaza/topup/jquery-1.4.2.min.js" ></script>
	
	<script type="text/javascript" src="/buzkaza/teaser/jqtransformplugin/jquery.jqtransform.js" ></script>
	
	<script type="text/javascript" src="/buzkaza/includes/scripts/funcoes_js_mascara.js" ></script>
	<script type="text/javascript" src="/buzkaza/includes/scripts/jquery.maskedinput-1.2.2.min.js" ></script>
	<script type="text/javascript" src="/buzkaza/includes/scripts/funcoes_js_validacoes.js" ></script>
	
	
	<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/script/thickbox.css" />
	<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/_css/estilo_iframe.css" />
	<script type="text/javascript" src="/buzkaza/thickbox/script/thickbox.js" ></script>
	<script type="text/javascript" src="/buzkaza/thickbox/script/global.js" ></script>
	
	
	
	<link href="/buzkaza/_css/jquery.alerts.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/buzkaza/_js/jquery.ui.draggable.js" ></script>
	<script type="text/javascript" src="/buzkaza/_js/jquery.alerts.js" ></script>



<script type="text/javascript">
                    
        $(document).ready( function() {
        
			
			$("#cadastrar_user").click( function() {
				var form = 	document.usuarioForm;
				
				if(checkForm(form)){					
					form.submit();
				}
				
				if( mensagemAlert != "" ){
					janelaAlert( mensagemAlert );
					mensagemAlert = "";
				}
				
			});
			
            function janelaAlert(mensagem)
            {
                $.alerts.dialogClass = "style_1";
                jAlert( mensagem , 'Erro', function() {
                    $.alerts.dialogClass = null; // reset to default
                });
            }
        });

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
					$("#pessoa").html('<input type="text" id="cpf" title="CPF"  name="usuarioEntity.cpfCnpj" class="cpf,MyriadProRegular" onkeydown="Mascara(this,Cpf);" onkeyup="Mascara(this,Cpf)" onkeypress="Mascara(this,Cpf);" maxlength="14" size="135"/>');
					
					$("#cpf").jqTransInputText();
					$("#cpf").mask("999.999.999-99");
				}
				else if( tipo== "J")
				{
					$("#pessoa").html('<input type="text" id="cnpj" name="usuarioEntity.cpfCnpj" title="CNPJ" value="" class="cnpj,MyriadProRegular" onkeydown="Mascara(this,Cnpj);" onkeyup="Mascara(this,Cnpj)" onkeypress="Mascara(this,Cnpj);" maxlength="19" size="135"/>');
					
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
<a href="http://www.buzkaza.com.br/teaser/"><div id="link_back"></div></a>
</div>
<div id="meio_cad">

<!-- MENSAGEM DE ERRO -->
    <font color="red">
  
		<logic:messagesPresent property="erro">
			<html:messages property="erro" id="erro">
				
        			
			<script type="text/javascript">            
				$(document).ready( function() {            
				
					janelaAlert2( "<bean:write name="erro"/>" );
					
					function janelaAlert2(mensagem)
					{
						$.alerts.dialogClass = "style_1";
						jAlert( mensagem , 'Erro', function() {
							$.alerts.dialogClass = null; // reset to default
						});
					}
				});
            </script>
                
                			
			</html:messages>
		</logic:messagesPresent>
				
		<logic:messagesNotPresent property="erro">
			<logic:present name="erro">
				<script type="text/javascript">            
				$(document).ready( function() {            
				
					janelaAlert2( "<bean:write name="erro"/>" );
					
					function janelaAlert2(mensagem)
					{
						$.alerts.dialogClass = "style_1";
						jAlert( mensagem , 'Erro', function() {
							$.alerts.dialogClass = null; // reset to default
						});
					}
				});
            </script>	
			</logic:present>
				
		</logic:messagesNotPresent>
  	</font>
    <!-- ****************** -->
<!--FORM-->
<div id="cont_cadastro">
  <div id="indice_cadastro"></div>
  <div id="formulario_cadastro">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul">Informações do proprietário</span></span><br />
      <br />
    </p>

    
	<html:form method="post" styleId="usuarioForm" action="/usuario?act=incluirUsuario">
      <div>
        <table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
          <tr>
            <td width="18%" class="MyriadProRegular">&nbsp; Modalidade</td>
            <td width="28%" class="MyriadProRegular">&nbsp; Nome Completo / Razão Social</td>
            <td width="24%" class="MyriadProRegular">&nbsp; Nacionalidade</td>
             <td width="30%" class="MyriadProRegular"></td>
          </tr>
          <tr>
            <td width="18%">
            <table width="100%" border="0" cellspacing="5" cellpadding="0">
              		<tr>
                		<td>
              			<html:select property="usuarioEntity.modalidade" title="Modalidade" styleId="tipo_usuario" styleClass="MyriadProRegular,string" onchange="seleciona_tipo_usuario()">
      						<html:option value="F"><bean:message key="label.cadastro.campo.pessoafisica"/></html:option>
       						<html:option value="J"><bean:message key="label.cadastro.campo.pessoajuridica"/></html:option>
      		  			</html:select>
      		  		</td>
        		</tr>
        		</table>
            </td>
            <td height="50">
            	<table width="100%" border="0" cellspacing="5" cellpadding="0">
              		<tr>
                		<td><html:text property="usuarioEntity.nome" title="Nome" size="290" styleClass="string,MyriadProRegular"/></td>
        			</tr>
        		</table>
            </td>
            <td>
            	<table width="100%" border="0" cellspacing="5" cellpadding="0">
              		<tr>
                		<td><html:text property="usuarioEntity.nacionalidade" title="Nacionalidade" size="230" styleClass="string,MyriadProRegular" /></td>
        			</tr>
        		</table>
            </td>
            <td>
            	
        	</td>
          </tr>
        </table>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="MyriadProRegular">&nbsp; Telefone fixo</td>
            <td class="MyriadProRegular">&nbsp; Telefone Celular</td>
            <td class="MyriadProRegular">&nbsp; CPF/ CNPJ</td>
            <td class="MyriadProRegular">&nbsp; Data de nascimento</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td>
                	<html:text size="60" title="DDD Fixo" maxlength="3" property="dddFixo" styleClass="number,MyriadProRegular" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
                <td>
                   	<html:text title="Numero fixo" property="numeroFixo" styleClass="number,MyriadProRegular" maxlength="8" size="150" onkeydown="Mascara(this,Integer);" onkeypress="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" />
                </td>
              </tr>
            </table></td>
            <td height="50"><table width="100%" border="0" cellspacing="5" cellpadding="0">
              <tr>
                <td><html:text title="DDD Celular" property="dddCelular"  styleClass="number,MyriadProRegular" maxlength="3" size="60" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
                <td><html:text title="Numero celular" property="numeroCelular" styleClass="number,MyriadProRegular" maxlength="8" size="150" onkeydown="Mascara(this,Integer);" onkeyup="Mascara(this,Integer)" onkeypress="Mascara(this,Integer);"/></td>
              </tr>
            </table></td>
            <td>
            		<div id="pessoa"><html:text property="usuarioEntity.cpfCnpj" title="CPF" styleId="cpf" maxlength="14" styleClass="cpf,MyriadProRegular" onkeydown="Mascara(this,Cpf);" onkeyup="Mascara(this,Cpf)" onkeypress="Mascara(this,Cpf);" size="135" /></div>
            	
            </td>
            <td>
            

            
            
            <table width="90%" border="0" cellspacing="5" cellpadding="0">
              		<tr>
                	<td>                  
                        <html:select property="diaNascimento" title="dia" styleId="diaNascimento" styleClass="MyriadProRegular,string">
                        
                            <html:option value="01">01</html:option>
                            <html:option value="02">02</html:option>
                            <html:option value="03">03</html:option>
                            <html:option value="04">04</html:option>
                            <html:option value="05">05</html:option>
                            <html:option value="06">06</html:option>
                            <html:option value="07">07</html:option>
                            <html:option value="08">08</html:option>
                            <html:option value="09">09</html:option>
                            
                            <html:option value="10">10</html:option>
                            <html:option value="11">11</html:option>
                            <html:option value="12">12</html:option>
                            <html:option value="13">13</html:option>
                            <html:option value="14">14</html:option>
                            <html:option value="15">15</html:option>
                            <html:option value="16">16</html:option>
                            <html:option value="17">17</html:option>
                            <html:option value="18">18</html:option>
                            <html:option value="19">19</html:option>
                            
                            <html:option value="20">20</html:option>
                            <html:option value="21">21</html:option>
                            <html:option value="22">22</html:option>
                            <html:option value="23">23</html:option>
                            <html:option value="24">24</html:option>
                            <html:option value="25">25</html:option>
                            <html:option value="26">26</html:option>
                            <html:option value="27">27</html:option>
                            <html:option value="28">28</html:option>
                            <html:option value="29">29</html:option>
                            
                            <html:option value="30">30</html:option>
                            <html:option value="31">31</html:option>
                            
                        </html:select>
            		</td>
            		<td>           
                         <html:select property="mesNascimento" title="mês" styleId="mesNascimento" styleClass="MyriadProRegular,string">                        
                            <html:option value="01">Janeiro</html:option>
                            <html:option value="02">Fevereiro</html:option>
                            <html:option value="03">Março</html:option>
                            <html:option value="04">Abril</html:option>
                            <html:option value="05">Maio</html:option>
                            <html:option value="06">Junho</html:option>
                            <html:option value="07">Julho</html:option>
                            <html:option value="08">Agosto</html:option>
                            <html:option value="09">Setembro</html:option>
                            
                            <html:option value="10">Outubro</html:option>
                            <html:option value="11">Novembro</html:option>
                            <html:option value="12">Dezembro</html:option>                  
                        </html:select>
  					</td>
            		<td>
                       <html:select property="anoNascimento" title="Ano" styleId="anoNascimento" styleClass="MyriadProRegular,string">
                        
                       <html:option value="2010">2010</html:option><html:option value="2009">2009</html:option><html:option value="2008">2008</html:option><html:option value="2007">2007</html:option><html:option value="2006">2006</html:option><html:option value="2005">2005</html:option><html:option value="2004">2004</html:option><html:option value="2003">2003</html:option><html:option value="2002">2002</html:option><html:option value="2001">2001</html:option><html:option value="2000">2000</html:option><html:option value="1999">1999</html:option><html:option value="1998">1998</html:option><html:option value="1997">1997</html:option><html:option value="1996">1996</html:option><html:option value="1995">1995</html:option><html:option value="1994">1994</html:option><html:option value="1993">1993</html:option><html:option value="1992">1992</html:option><html:option value="1991">1991</html:option><html:option value="1990">1990</html:option><html:option value="1989">1989</html:option><html:option value="1988">1988</html:option><html:option value="1987">1987</html:option><html:option value="1986">1986</html:option><html:option value="1985">1985</html:option><html:option value="1984">1984</html:option><html:option value="1983">1983</html:option><html:option value="1982">1982</html:option><html:option value="1981">1981</html:option><html:option value="1980">1980</html:option><html:option value="1979">1979</html:option><html:option value="1978">1978</html:option><html:option value="1977">1977</html:option><html:option value="1976">1976</html:option><html:option value="1975">1975</html:option><html:option value="1974">1974</html:option><html:option value="1973">1973</html:option><html:option value="1972">1972</html:option><html:option value="1971">1971</html:option><html:option value="1970">1970</html:option><html:option value="1969">1969</html:option><html:option value="1968">1968</html:option><html:option value="1967">1967</html:option><html:option value="1966">1966</html:option><html:option value="1965">1965</html:option><html:option value="1964">1964</html:option><html:option value="1963">1963</html:option><html:option value="1962">1962</html:option><html:option value="1961">1961</html:option><html:option value="1960">1960</html:option><html:option value="1959">1959</html:option><html:option value="1958">1958</html:option><html:option value="1957">1957</html:option><html:option value="1956">1956</html:option><html:option value="1955">1955</html:option><html:option value="1954">1954</html:option><html:option value="1953">1953</html:option><html:option value="1952">1952</html:option><html:option value="1951">1951</html:option><html:option value="1950">1950</html:option><html:option value="1949">1949</html:option><html:option value="1948">1948</html:option><html:option value="1947">1947</html:option><html:option value="1946">1946</html:option><html:option value="1945">1945</html:option><html:option value="1944">1944</html:option><html:option value="1943">1943</html:option><html:option value="1942">1942</html:option><html:option value="1941">1941</html:option><html:option value="1940">1940</html:option><html:option value="1939">1939</html:option><html:option value="1938">1938</html:option><html:option value="1937">1937</html:option><html:option value="1936">1936</html:option><html:option value="1935">1935</html:option><html:option value="1934">1934</html:option><html:option value="1933">1933</html:option><html:option value="1932">1932</html:option><html:option value="1931">1931</html:option><html:option value="1930">1930</html:option><html:option value="1929">1929</html:option><html:option value="1928">1928</html:option><html:option value="1927">1927</html:option><html:option value="1926">1926</html:option><html:option value="1925">1925</html:option><html:option value="1924">1924</html:option><html:option value="1923">1923</html:option><html:option value="1922">1922</html:option><html:option value="1921">1921</html:option><html:option value="1920">1920</html:option><html:option value="1919">1919</html:option><html:option value="1918">1918</html:option><html:option value="1917">1917</html:option><html:option value="1916">1916</html:option><html:option value="1915">1915</html:option><html:option value="1914">1914</html:option><html:option value="1913">1913</html:option><html:option value="1912">1912</html:option><html:option value="1911">1911</html:option><html:option value="1910">1910</html:option><html:option value="1909">1909</html:option><html:option value="1908">1908</html:option><html:option value="1907">1907</html:option><html:option value="1906">1906</html:option><html:option value="1905">1905</html:option><html:option value="1904">1904</html:option><html:option value="1903">1903</html:option><html:option value="1902">1902</html:option><html:option value="1901">1901</html:option><html:option value="1900">1900</html:option> 
                       
                       </html:select>
        			</td>
        			</tr>
        			</table>
            
            
            </td>
          </tr>
        </table>
      </div>
      
      <div class="end_correspondencia"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/buzkaza/teaser/_img/bullet_cadastro.png" width="22" height="13" /><span class="MyriadProSemiboldIt"><span id="titulo_azul">Endereço para correspondência</span></span> <br />
        <br />
        
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr class="MyriadProRegular">
            <td>&nbsp; Endereço</td>
            <td>CEP</td>
            <td>Cidade</td>
            <td>Estado</td>            
            <td>País</td>            
          </tr>
          
          <tr>
            <td height="50">
             	<table width="100%" border="0" cellspacing="5" cellpadding="0">
              		<tr>
                		<td>
                        <html:text title="Endereco" property="usuarioEntity.endereco.logradouro" size="270" styleClass="string,MyriadProRegular"/>
                        </td>
                   </tr>
                  </table>
                        
                        
            </td>
            <td><html:text property="cep" styleId="cep" title="Cep" styleClass="cep,MyriadProRegular" maxlength="9" size="120"/></td>            
            <td><html:text property="usuarioEntity.endereco.municipio" title="Municipio" size="160" styleClass="string,MyriadProRegular"/></td>
            <td>
            	<html:select property="usuarioEntity.endereco.estado.codigo" title="Estado" styleClass="string,MyriadProRegular">
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
          		</html:select>  
          	</td>
            <td>            
            	<html:select property="pais" styleClass="number,MyriadProRegular" title="Pais">  
					<html:options collection="paises" property="codigo" labelProperty="nome"/>
				</html:select>
            </td>
            
          </tr>
        </table>
    </div>
    
    
      <div>
        <div id="bg_criar_user">
          <div class="alinha_table">
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td rowspan="2" class="MyriadProSemiboldIt"><span id="titulo_azul">Crie aqui seu login senha</span></td>
                <td width="25%" class="MyriadProRegular">Email (login)</td>
                <td width="25%" class="MyriadProRegular">Confirmar Email (login)</td>
                <td width="19%" class="MyriadProRegular">Senha</td>
                <td width="19%" class="MyriadProRegular">Confirmar Senha</td>
              </tr>
              <tr>
                <td width="25%"><html:text title="Email" property="usuarioEntity.email" styleClass="email,MyriadProRegular" size="200"/></td>
                <td width="25%"><html:text title="Confirmação de Email" property="emailConfirma" styleClass="email,MyriadProRegular" size="200"/></td>
                <td width="19%"><html:password title="Senha" property="usuarioEntity.senha" styleClass="string,MyriadProRegular" size="150"/></td>
                <td width="19%"><html:password title="Confirmação de Senha" property="senhaConfirma" styleClass="string,MyriadProRegular" size="150"/></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      
      <div class="planos_adesao">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><div><html:checkbox title="Confirmação por email" property="usuarioEntity.recebeInfo" styleClass="MyriadProRegular"/></div><div style=" float:left; width:500px; margin-top:7px; margin-left:3px;"><span class="MyriadPro14">Desejo receber informações  deste site no meu email</span></div></td>
          </tr>
          <tr>
            <td><div><html:checkbox title="Termos e Condições" property="usuarioEntity.leuCondicoes" styleClass="number,MyriadProRegular"/></div>
            <div style=" float:left; width:500px; margin-top:7px; margin-left:3px; font-family: 'MyriadPro', sans-serif; color:#666666; font-size:14px; "><span class="MyriadPro14"><a class="thickbox" href="/buzkaza/thickbox/iframe_termo.html?height=400&width=600" style="font-family: 'MyriadPro', sans-serif; color:#666666; font-size:14px; " >Li e aceito os termos e condições deste site</a></span></div></td>
          </tr>          
          <tr>
            <td><div id="texto_cinza"><a class="thickbox" href="/buzkaza/thickbox/janelas.html?height=400&width=600" >Veja aqui</a> o que você precisa para cadastrar seu imóvel</div></td>
          </tr>          
        </table>
      </div>		

      <div class="btn_cadastrar">        
        <div class="btn"><a href="#" border="0"><img src="/buzkaza/teaser/_img/btn_cadastrar_user.jpg.jpg" id="cadastrar_user" width="211" height="30" border="0"/></a></div>
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
