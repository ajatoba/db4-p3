
<!--  lightbox do rodap� -->

<%@page import="br.com.db4.buskaza.model.entity.Usuario"%><link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/script/thickbox.css" />

<link rel="stylesheet" type="text/css" href="/buzkaza/thickbox/_css/estilo_iframe.css" />
<script type="text/javascript" src="/buzkaza/thickbox/script/thickbox.js" ></script>
<script type="text/javascript" src="/buzkaza/thickbox/script/global.js" ></script>


<div id="conteudo"> 
  <!--TOPO-->
  <div id="top">
    <div class="topo_menu">
      <div class="txt_01"><iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FBuzkaza-em-casa-onde-estiver%2F170687929624966&amp;layout=standard&amp;show_faces=false&amp;width=380&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=30" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:380px; height:30px;" allowTransparency="true"></iframe></div>
      <!--<div class="txt_02">Quem Somos</div>
      <div class="txt_03">Mapa do Site</div>
      <div class="txt_04">Contato</div>
      <div class="txt_05">Ajuda</div>
      <div class="txt_06">Redes Sociais</div>-->
      <a href="http://twitter.com/buzkaza" target="_blank"><div class="twitter"></div></a>
	  <a href="http://www.facebook.com/pages/Buzkaza-em-casa-onde-estiver/170687929624966" target="_blank"><div class="facebook"></div></a>
    </div>
    <div class="tracejado_top"></div>
    <div class="linha_logo">
      <a href="/index.html" style="cursor:pointer;"><div class="logo"></div></a>
      <div class="options"></div>
    </div>
    <div class="bottom_menu">
      <a href="/DB4-BuskazaWeb/imovel.do?act=formBuscarImovel"><div class="btn_alugar">alugar im�vel</div></a>
      <a href="/DB4-BuskazaWeb/usuario/imovel.do?act=formIncluirImovel"><div class="btn_anunciar">anunciar im�vel</div></a>
      <a href="http://www.buzkaza.com.br/blog/" target="_black"><div class="btn_blog">blogs</div></a>
      
      <div class="btn_logado">
      <%if (session.getAttribute("usuario") != null) {%>
      Ol�,       
      <%=((Usuario)session.getAttribute("usuario")).getNome() %>
      <%} %>
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
		                    <li id="menu3"><a href="/DB4-BuskazaWeb/usuario/imovel.do?act=listarImoveis">Meus An�ncios</a></li>
		                    <li id="menu_sepb">&nbsp;</li>
		                    <li id="menu3"><a href="/DB4-BuskazaWeb/usuario.do?act=logofUsuario" id="ativo">Logout</a></li>
		                </ul>
		              <div id="menu_sepb_baixo">&nbsp;</div>
		              <script type="text/javascript">  horizontal(); </script> 
		             <!--[if IE]> <style> #ativo{ background:url(/buzkaza/_img/menu_down/logout_ie.jpg) no-repeat; } </style> <![endif]--> 
		           </li>
		       </ul>
		   </div>   
    
</div>
    </div>
  </div>
</div>