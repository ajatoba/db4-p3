<!-- _form_busca_avancada_resultado -->
<html:form method="post" styleId="imovelBuscaForm" action="/imovel.do?act=buscarImovel">

<html:hidden property="mesDataInicialAnuncio" styleId="mesDataInicialAnuncio" /> 
<html:hidden property="mesDataFinalAnuncio" styleId="mesDataFinalAnuncio" /> 

<html:hidden property="anoDataInicialAnuncio" styleId="anoDataInicialAnuncio" />
<html:hidden property="anoDataFinalAnuncio" styleId="anoDataFinalAnuncio" />



<div class="buscaOculta">

	<html:radio property="tiposAnuncio" styleId="tiposAnuncioDispo" value="1"/></td>
	<html:radio property="tiposAnuncio" styleId="tiposAnuncioPacote" value="6"/>
	
	<script>selecionarTiposAnuncio('<%= request.getParameter("tiposAnuncio") %>')</script>
</div>

<div class="form_busca_geral">

	<div class="form_busca_1">

	<table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>

           <table border="0" cellspacing="0" cellpadding="0">
              <tr>

                <td class="tb_1"><span class="txt_form">&nbsp; Cidade</span></td>
                <td class="tb_2"><span class="txt_form">&nbsp; Estado</span></td>
                <td class="tb_3"><span class="txt_form">&nbsp; Pa&iacute;s</span></td>
                
              </tr>
              <tr>
                <td><span class="txt_form"><html:text property="municipio" styleId="municipio" styleClass="MyriadProRegular" size="195" style="width:205px;" /></span></td>
                <td><span class="txt_form">   			 
                            <html:select property="imovelEntity.estado.codigo" styleId="sigla" styleClass="MyriadProRegular" style="width: 132px;">
								<html:option value="">Todos</html:option> 
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
            
                          </span></td>
                <td><span class="txt_form">
                
                	<html:select property="pais" styleClass="MyriadProRegular" style="width:85px;">
							<html:option value="1">Brasil</html:option>
					</html:select>            
                          </span></td>
              </tr>
            </table>
    
    
    
    
    </td>
  </tr>
  <tr>
    <td>
    
   <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tb_4"><span class="txt_form">&nbsp; Quartos</span></td>
        <td class="tb_5"><span class="txt_form">&nbsp; Área (m2)</span></td>
        <td class="tb_6"><span class="txt_form">&nbsp; Capacidade</span></td>        
      </tr>
      <tr>
        <td>
      		<html:select property="quartos" styleClass="MyriadProRegular" style="width:85px;">
                <html:option value="">Todos</html:option> 
                <html:option value="1">1 Quarto</html:option>
				<html:option value="2">2 Quartos</html:option>
				<html:option value="3">3 Quartos</html:option>
				<html:option value="4">4 Quartos</html:option>
				<html:option value="5">5 Quartos</html:option>
				<html:option value="6">6 Quartos</html:option>
				<html:option value="7">7 Quartos</html:option>
				<html:option value="8">8 Quartos</html:option>		
				<html:option value="9">9 Quartos</html:option>						
				<html:option value="10">10 Quartos</html:option>				
           </html:select>        
        </td>
        <td>
        		<html:select property="metragem" styleClass="MyriadProRegular" style="width:85px;">    	
                        <html:option value="">Todos</html:option> 
                        <html:option value="20">20m</html:option>
		                <html:option value="25">25m</html:option>
		                <html:option value="30">30m</html:option>
		                <html:option value="35">35m</html:option>
		                <html:option value="40">40m</html:option>
		                <html:option value="45">45m</html:option>
		                <html:option value="50">50m</html:option>
		                <html:option value="55">55m</html:option>
		                
		                <html:option value="60">60m</html:option>
		                <html:option value="65">65m</html:option>
		                <html:option value="70">70m</html:option>
		                <html:option value="75">75m</html:option>
		                <html:option value="80">80m</html:option>
		                <html:option value="85">85m</html:option>
		                <html:option value="90">90m</html:option>
		                <html:option value="95">95m</html:option>
		                <html:option value="100">100m</html:option>
		                
		                <html:option value="105">105m</html:option>
		                <html:option value="110">110m</html:option>
		                <html:option value="115">115m</html:option>
		                <html:option value="120">120m</html:option>
		                <html:option value="125">125m</html:option>
		                <html:option value="130">130m</html:option>
		                <html:option value="135">135m</html:option>
		                <html:option value="140">140m</html:option>
		                <html:option value="145">145m</html:option>
		                
		                <html:option value="150">150m</html:option>
		                <html:option value="155">155m</html:option>
		                <html:option value="160">160m</html:option>
		                <html:option value="165">165m</html:option>
		                <html:option value="170">170m</html:option>
		                <html:option value="175">175m</html:option>
		                <html:option value="180">180m</html:option>
		                <html:option value="185">185m</html:option>
		                <html:option value="190">190m</html:option>
		                
		                <html:option value="195">195m</html:option>
		                <html:option value="200">200m</html:option>
		                <html:option value="205">205m</html:option>
		                <html:option value="210">210m</html:option>
		                <html:option value="215">215m</html:option>
		                <html:option value="220">220m</html:option>
		                <html:option value="225">225m</html:option>
		                <html:option value="230">230m</html:option>
		                <html:option value="235">235m</html:option>
		                
		                <html:option value="240">240m</html:option>
		                <html:option value="245">245m</html:option>
		                <html:option value="250">250m</html:option>
		                <html:option value="255">255m</html:option>
		                <html:option value="260">260m</html:option>
		                <html:option value="265">265m</html:option>
		                <html:option value="270">270m</html:option>
		                <html:option value="275">275m</html:option>
		                <html:option value="280">280m</html:option>
		                
		                <html:option value="285">285m</html:option>
		                <html:option value="290">290m</html:option>
		                <html:option value="295">295m</html:option>
		                <html:option value="300">300m</html:option>
		                <html:option value="305">305m</html:option>
		                <html:option value="310">310m</html:option>
		                <html:option value="315">315m</html:option>
		                <html:option value="320">320m</html:option>
		                <html:option value="325">325m</html:option>
		                
		                <html:option value="330">330m</html:option>
		                <html:option value="335">335m</html:option>
		                <html:option value="340">340m</html:option>
		                <html:option value="345">345m</html:option>
		                <html:option value="350">350m</html:option>
		                <html:option value="355">355m</html:option>
		                <html:option value="360">360m</html:option>
		                <html:option value="365">365m</html:option>
		                <html:option value="370">370m</html:option>
		                
		                <html:option value="375">375m</html:option>
		                <html:option value="380">380m</html:option>
		                <html:option value="385">385m</html:option>
		                <html:option value="390">390m</html:option>
		                <html:option value="395">395m</html:option>
		                <html:option value="400">400m</html:option>
		                <html:option value="405">405m</html:option>
		                <html:option value="410">410m</html:option>
		                <html:option value="415">415m</html:option>
		                
		                <html:option value="420">420m</html:option>
		                <html:option value="425">425m</html:option>
		                <html:option value="430">430m</html:option>
		                <html:option value="435">435m</html:option>
		                <html:option value="440">440m</html:option>
		                <html:option value="445">445m</html:option>
		                <html:option value="450">450m</html:option>
		                <html:option value="455">455m</html:option>
		                <html:option value="460">460m</html:option>
		                
		                <html:option value="465">465m</html:option>
		                <html:option value="470">470m</html:option>
		                <html:option value="475">475m</html:option>
		                <html:option value="480">480m</html:option>
		                <html:option value="485">485m</html:option>
		                <html:option value="490">490m</html:option>
		                <html:option value="495">495m</html:option>
		                <html:option value="500">500m</html:option>
		                <html:option value="505">505m</html:option>
		                
		                <html:option value="510">510m</html:option>
		                <html:option value="515">515m</html:option>
		                <html:option value="520">520m</html:option>
		                <html:option value="525">525m</html:option>
		                <html:option value="530">530m</html:option>
		                <html:option value="535">535m</html:option>
		                <html:option value="540">540m</html:option>
		                <html:option value="545">545m</html:option>
		                <html:option value="550">550m</html:option>
		                
		                <html:option value="555">555m</html:option>
		                <html:option value="560">560m</html:option>
		                <html:option value="565">565m</html:option>
		                <html:option value="570">570m</html:option>
		                <html:option value="575">575m</html:option>
		                <html:option value="580">580m</html:option>
		                <html:option value="585">585m</html:option>
		                <html:option value="590">590m</html:option>
		                <html:option value="595">595m</html:option>
		                
		                <html:option value="600">600m</html:option>
                    </html:select>
        
        </td>
        <td>        
        	<html:select property="capacidade" styleClass="MyriadProRegular" style="width:105px;">
                <html:option value="">Todos</html:option> 
                <html:option value="1">1 Pessoa</html:option>
				<html:option value="2">2 Pessoas</html:option>
				<html:option value="3">3 Pessoas</html:option>
				<html:option value="4">4 Pessoas</html:option>
				<html:option value="5">5 Pessoas</html:option>
				<html:option value="6">6 Pessoas</html:option>
				<html:option value="7">7 Pessoas</html:option>
				<html:option value="8">8 Pessoas</html:option>	
				<html:option value="9">9 Pessoas</html:option>					
				<html:option value="10">10 Pessoas</html:option>
				<html:option value="11">11 Pessoas</html:option>
				<html:option value="12">12 Pessoas</html:option>
				<html:option value="13">13 Pessoas</html:option>
				<html:option value="14">14 Pessoas</html:option>
				<html:option value="15">15 Pessoas</html:option>
				<html:option value="16">16 Pessoas</html:option>
				<html:option value="17">17 Pessoas</html:option>
				<html:option value="18">18 Pessoas</html:option>
				<html:option value="19">19 Pessoas</html:option>								
				<html:option value="20">20 Pessoas</html:option>
				<html:option value="21">21 Pessoas</html:option>
				<html:option value="22">22 Pessoas</html:option>
            </html:select>
        
        </td>
        
      </tr>
    </table>
    
    </td>
  </tr>
</table>



</div>



<div class="form_busca_2">



		<table border="0" align="center" cellpadding="0" cellspacing="0">
          
          <tr>
            <td height="26" colspan="2"><span class="txt_form">&nbsp; Chegada</span></td>
          </tr>
          <tr>
            <td height="26" colspan="2">
            <div style=" float:left; display:table;">
	            <span class="txt_form">
	            <html:select property="diaDataInicialAnuncio" title="dia" styleId="diaDataInicialAnuncio" styleClass="MyriadProRegular" style="width:45px;">                        
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
        </div>
        <div style="margin-left:5px; float:left; display:table;">
				<div id="mesAnoInicio"></div>          
				<script>montarMesAnoInicioResultadoBusca()</script>
		</div>
			
				
              </span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">&nbsp; Partida</span></td>
          </tr>
          <tr>
            <td height="26" colspan="2">
            <div style=" float:left; display:table;">
	            <span class="txt_form">
	            <html:select property="diaDataFinalAnuncio" title="dia" styleId="diaDataFinalAnuncio" styleClass="MyriadProRegular" style="width:45px;">                        
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
		</div>
		<div style="margin-left:5px; float:left; display:table;">
				<div id="mesAnoFinal"></div>
				<script>montarMesAnoFinalResultadoBusca()</script>
		</div>
				</span></td>
          </tr>
           
          
          </table>
          
 </div>         
 <div class="form_busca_3"><input type="image" src="/buzkaza/_img/btn_buscar_imovel.jpg" width="170" height="30" border="0"/></div>       

</div>

</html:form>
