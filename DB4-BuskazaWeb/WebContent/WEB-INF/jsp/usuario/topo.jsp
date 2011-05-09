
<!--  lightbox do rodapé -->

<%@page import="br.com.db4.buskaza.model.entity.Usuario"%><link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/script/thickbox.css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/_css/estilo_iframe.css" />
<script type="text/javascript" src="/buzkaza/thickbox/script/thickbox.js" ></script>
<script type="text/javascript" src="/buzkaza/thickbox/script/global.js" ></script>


<div id="conteudo"> 
  <!--TOPO-->
  <div id="top">
    <div class="topo_menu">
      <div class="txt_01"><iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2F%23%21%2Fpages%2FBuzkaza-em-casa-onde-estiver%2F170687929624966&amp;layout=button_count&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:21px;" allowTransparency="true"></iframe></div>
      <!--<div class="txt_02">Quem Somos</div>
      <div class="txt_03">Mapa do Site</div>
      <div class="txt_04">Contato</div>
      <div class="txt_05">Ajuda</div>
      <div class="txt_06">Redes Sociais</div>-->
      
      <a href="/faq.html"><div class="txt_02">Faq</div></a>
      
      <a href="http://twitter.com/buzkaza" target="_blank"><div class="twitter"></div></a>
	  <a href="http://www.facebook.com/pages/Buzkaza-em-casa-onde-estiver/170687929624966" target="_blank"><div class="facebook"></div></a>
    </div>
    <div class="tracejado_top"></div>
    <div class="linha_logo">
      <a href="/index.html" style="cursor:pointer;"><div class="logo"></div></a>
      <div class="options"></div>
    </div>
    <div class="bottom_menu">
      <a href="/DB4-BuskazaWeb/imovel.do?act=formBuscarImovel"><div class="btn_alugar">alugar imóvel</div></a>
      <a href="/passo_1_imovel.html"><div class="btn_anunciar">anunciar imóvel</div></a>
      <a href="http://www.buzkaza.com.br/blog/" target="_black"><div class="btn_blog">blog</div></a>
      
      <%if (session.getAttribute("usuario") != null) {%>
      
      <div class="btn_logado">
      
      Olá,       
      <%=((Usuario)session.getAttribute("usuario")).getNome() %>
      
      </div>
      
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
    
    
</div>
    </div>
  </div>
</div>