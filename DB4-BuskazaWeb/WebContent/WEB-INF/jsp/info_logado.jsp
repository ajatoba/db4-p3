

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld"  prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld"  prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld"  prefix="logic"%>


<%@page import="br.com.db4.buskaza.model.entity.Usuario"%>

      
      <%if (session.getAttribute("usuario") != null) {%>
      
      <div class="btn_logado"> Olá, <%=((Usuario)session.getAttribute("usuario")).getNome() %> </div>
      
		<div class="btn_funcoes_login">
		
			<div style="width:169px; height:38px; display:table; margin-left:-27px; ">    
		        <ul id="menu_dropdown3" class="menubar" style="position:absolute;">
		            <li id="submenu" class="submenu3">
		                <ol class="curso_seleci">
		                	<li id="drop_down_curso" class="seleci">&nbsp;</li>
		                </ol>
		                <ul class="menu">
		                    <li id="menu_sepa"></li>
		                    <li ><a href="/DB4-BuskazaWeb/usuario/reserva.do?act=listarReservas">Minhas Reservas</a></li>
		                    <li id="menu_sepb">&nbsp;</li>
		                    <li id="menu3"><a href="/DB4-BuskazaWeb/usuario/imovel.do?act=listarImoveis">Meus Anúncios</a></li>
		                    <li id="menu_sepb">&nbsp;</li>
		                    <li id="menu3"><a href="/DB4-BuskazaWeb/usuario.do?act=logofUsuario" id="ativo">Logout</a></li>
		                </ul>
		              <div id="menu_sepb_baixo">&nbsp;</div>
		              <script type="text/javascript">  horizontal(); </script> 
		             <!--[if IE]> <style> #ativo{ background:url(/buzkaza/_img/menu_down/logout_ie.jpg) no-repeat; } </style> <![endif]--> 
		           </li>
		       </ul>
		   </div>   
    
    <%}else{ %>
    
    <link  rel="stylesheet" type="text/css" href="/buzkaza/_css/menu_down_novo.css"/>
    
    <div class="btn_login">

			<div id="topnav" class="topnav" >
	            <div href="menu_down/login" class="signin"><span></span></div>
	        </div>
	      <fieldset id="signin_menu">
	        <form method="post" id="signin" name="usuarioForm" action="/DB4-BuskazaWeb/usuario.do?act=autenticarUsuario">
	          <div class="linha_menu_login_topo"></div>
	          <div class="linha_menu_login_meio">
	                    <div class="menu_sep_form_novo">Login(Email)</div>
	                    <div class="menu_sep_form_novo">
	                      <input type="text" name="usuarioEntity.email" size="211" value="" title="Email" style="width:221px;"/>
	                    </div>
	                    <div class="menu_sep_form_novo">
	                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td width="30%">Senha</td>
	                          <td width="70%" align="right"><a class="thickbox link_esqueceu" href="/buzkaza/thickbox/esqueceu_senha.html?height=400&width=600"> Esqueceu sua senha?</a></td>
	                        </tr>
	                      </table>
	                    </div>
	                    <div class="menu_sep_form_novo">
	                      <input type="password" name="usuarioEntity.senha" size="211" value="" title="Senha" style="width:221px;"/>
	                    </div>
	                    <div class="menu_sep_form_novo_fim">
	                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td width="70%"><div style="float:left">
	                              <input type="checkbox" name="lembrar"/>
	                            </div>
	                            <div id="menu_sep_form_lembrar">Lembrar login/senha</div></td>
	                          <td width="30%" align="right"><input type="image" src="/buzkaza/_img/menu_down/btn_login_entrar.png" name="button" id="button" value="Submit" /></td>
	                        </tr>
	                      </table>
	                    </div>
	          </div>
	          <div class="linha_menu_login_baixo"></div>
	        </form>
	      </fieldset>
	      
	      
	      <script type="text/javascript">

	      	$(function(){
	  			$('form').jqTransform({imgPath:'jqtransformplugin/img/'});
	  		});
	  		
	        $(document).ready(function() {
	
	            $(".signin").click(function(e) {          
					e.preventDefault();
	                $("fieldset#signin_menu").toggle();
					$(".signin").toggleClass("menu-open");
					
					$(".topnav").css('background' , 'url(/buzkaza/_img/menu_down/efetuar_login.png) repeat-y');
	            });
				
				$("fieldset#signin_menu").mouseup(function() {
					return false
				});
				$(document).mouseup(function(e) {
					if($(e.target).parent(".signin").length==0) {
						$(".signin").removeClass("menu-open");
						$("fieldset#signin_menu").hide();
						$(".topnav").css('background' , 'url(/buzkaza/_img/menu_down/efetuar_login0.png) repeat-y');
					}
				});			
				
	        });
		</script>
	</div>
	<div class="btn_cadastre_se"><a href="/passo_1_usuario.html"><img src="/buzkaza/_img/btn_cadastre_se.jpg" height="35" width="139" border="0"/></a></div>
    
    <% } %>


