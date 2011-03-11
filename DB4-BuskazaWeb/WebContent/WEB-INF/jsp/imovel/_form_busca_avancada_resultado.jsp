<!-- _form_busca_avancada_resultado -->
<html:form method="post" styleId="imovelBuscaForm" action="/imovel.do?act=buscarImovel">
<html:hidden property="anoDataFinalAnuncio" styleId="anoDataInicialAnuncio" />
<html:hidden property="anoDataInicialAnuncio" styleId="anoDataInicialAnuncio"/>
		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="40" colspan="2" valign="bottom" class="tit_azul2">Redefinir Busca</td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" height="26"><span class="txt_form">Estado</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:select property="imovelEntity.estado.codigo" styleClass="MyriadProRegular">    			 
				<html:options collection="estados" property="codigo" labelProperty="nome" />
        	</html:select>
              </span></td>
          </tr>
          <tr>
            <td colspan="2" height="26"><span class="txt_form">Pa�s</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form">
              <html:select property="pais" styleClass="MyriadProRegular">    		
				<html:options collection="paises" property="codigo" labelProperty="nome"/>
			</html:select>
              </span></td>
          </tr>
          <tr>
            <td colspan="2" height="26"><span class="txt_form">Munic�pio</span></td>
          </tr>
          <tr>
            <td colspan="2"><span class="txt_form"><html:text property="municipio" styleClass="MyriadProRegular" size="160" />
              </span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">Chegada</span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">
            <html:select property="diaDataInicialAnuncio" title="dia" styleId="diaDataInicialAnuncio" styleClass="MyriadProRegular">                        
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
        
        <div class="sepd">
			<html:select property="mesDataInicialAnuncio" title="mesDataInicialAnuncio" styleId="mesDataInicial" styleClass="MyriadProRegular">                        
	            <html:option value="1">Janeiro</html:option>
	            <html:option value="2">Fevereiro</html:option>
	            <html:option value="3">Mar�o</html:option>
	            <html:option value="4">Abril</html:option>
	            <html:option value="5">Maio</html:option>
	            <html:option value="6">Junho</html:option>
	            <html:option value="7">Julho</html:option>
	            <html:option value="8">Agosto</html:option>
	            <html:option value="9">Setembro</html:option>
	            <html:option value="10">Outubro</html:option>
				<html:option value="11">Novembro</html:option>
				<html:option value="12">Dezembro</html:option>                  
			</html:select>
		</div>		
              </span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">Partida</span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">
            <html:select property="diaDataFinalAnuncio" title="dia" styleId="diaDataFinalAnuncio" styleClass="MyriadProRegular">                        
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
		<div class="sepd">
			<html:select property="mesDataFinalAnuncio" title="mesDataInicialAnuncio" styleId="mesDataInicial" styleClass="MyriadProRegular">                        
	            <html:option value="1">Janeiro</html:option>
	            <html:option value="2">Fevereiro</html:option>
	            <html:option value="3">Mar�o</html:option>
	            <html:option value="4">Abril</html:option>
	            <html:option value="5">Maio</html:option>
	            <html:option value="6">Junho</html:option>
	            <html:option value="7">Julho</html:option>
	            <html:option value="8">Agosto</html:option>
	            <html:option value="9">Setembro</html:option>
	            <html:option value="10">Outubro</html:option>
				<html:option value="11">Novembro</html:option>
				<html:option value="12">Dezembro</html:option>                  
			</html:select>
      	</div></span></td>
          </tr>
          <tr>
            <td width="50%" height="26"><span class="txt_form">Capacidade</span></td>
            <td width="50%" height="26"><div class="sepd"><span class="txt_form">Quartos</span></div></td>
          </tr>
          <tr>
            <td height="26"><span class="txt_form">
              <html:select property="capacidade" styleClass="MyriadProRegular">
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
            </html:select></span></td>
            <td height="26">
            <div class="sepd"><span class="txt_form">
					<html:select property="quartos" styleClass="MyriadProRegular">
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
						<html:option value="11">11 Quartos</html:option>
						<html:option value="12">12 Quartos</html:option>
						<html:option value="13">13 Quartos</html:option>
						<html:option value="14">14 Quartos</html:option>
						<html:option value="15">15 Quartos</html:option>
						<html:option value="16">16 Quartos</html:option>
						<html:option value="17">17 Quartos</html:option>				
						<html:option value="18">18 Quartos</html:option>
						<html:option value="19">19 Quartos</html:option>						
						<html:option value="20">20 Quartos</html:option>
						<html:option value="21">21 Quartos</html:option>
						<html:option value="22">22 Quartos</html:option>
                    </html:select>
              </span></div></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">�rea (m2)</span></td>
          </tr>
          <tr>
            <td height="26" colspan="2"><span class="txt_form">
					<html:select property="metragem" styleClass="MyriadProRegular">    	
                        <html:option value="">Todos</html:option> 
                        <html:option value="20.0">20m</html:option>
		                <html:option value="25.0">25m</html:option>
		                <html:option value="30.0">30m</html:option>
		                <html:option value="35.0">35m</html:option>
		                <html:option value="40.0">40m</html:option>
		                <html:option value="45.0">45m</html:option>
		                <html:option value="50.0">50m</html:option>
		                <html:option value="55.0">55m</html:option>
		                
		                <html:option value="60.0">60m</html:option>
		                <html:option value="65.0">65m</html:option>
		                <html:option value="70.0">70m</html:option>
		                <html:option value="75.0">75m</html:option>
		                <html:option value="80.0">80m</html:option>
		                <html:option value="85.0">85m</html:option>
		                <html:option value="90.0">90m</html:option>
		                <html:option value="95.0">95m</html:option>
		                <html:option value="100.0">100m</html:option>
		                
		                <html:option value="105.0">105m</html:option>
		                <html:option value="110.0">110m</html:option>
		                <html:option value="115.0">115m</html:option>
		                <html:option value="120.0">120m</html:option>
		                <html:option value="125.0">125m</html:option>
		                <html:option value="130.0">130m</html:option>
		                <html:option value="135.0">135m</html:option>
		                <html:option value="140.0">140m</html:option>
		                <html:option value="145.0">145m</html:option>
		                
		                <html:option value="150.0">150m</html:option>
		                <html:option value="155.0">155m</html:option>
		                <html:option value="160.0">160m</html:option>
		                <html:option value="165.0">165m</html:option>
		                <html:option value="170.0">170m</html:option>
		                <html:option value="175.0">175m</html:option>
		                <html:option value="180.0">180m</html:option>
		                <html:option value="185.0">185m</html:option>
		                <html:option value="190.0">190m</html:option>
		                
		                <html:option value="195.0">195m</html:option>
		                <html:option value="200.0">200m</html:option>
		                <html:option value="205.0">205m</html:option>
		                <html:option value="210.0">210m</html:option>
		                <html:option value="215.0">215m</html:option>
		                <html:option value="220.0">220m</html:option>
		                <html:option value="225.0">225m</html:option>
		                <html:option value="230.0">230m</html:option>
		                <html:option value="235.0">235m</html:option>
		                
		                <html:option value="240.0">240m</html:option>
		                <html:option value="245.0">245m</html:option>
		                <html:option value="250.0">250m</html:option>
		                <html:option value="255.0">255m</html:option>
		                <html:option value="260.0">260m</html:option>
		                <html:option value="265.0">265m</html:option>
		                <html:option value="270.0">270m</html:option>
		                <html:option value="275.0">275m</html:option>
		                <html:option value="280.0">280m</html:option>
		                
		                <html:option value="285.0">285m</html:option>
		                <html:option value="290.0">290m</html:option>
		                <html:option value="295.0">295m</html:option>
		                <html:option value="300.0">300m</html:option>
		                <html:option value="305.0">305m</html:option>
		                <html:option value="310.0">310m</html:option>
		                <html:option value="315.0">315m</html:option>
		                <html:option value="320.0">320m</html:option>
		                <html:option value="325.0">325m</html:option>
		                
		                <html:option value="330.0">330m</html:option>
		                <html:option value="335.0">335m</html:option>
		                <html:option value="340.0">340m</html:option>
		                <html:option value="345.0">345m</html:option>
		                <html:option value="350.0">350m</html:option>
		                <html:option value="355.0">355m</html:option>
		                <html:option value="360.0">360m</html:option>
		                <html:option value="365.0">365m</html:option>
		                <html:option value="370.0">370m</html:option>
		                
		                <html:option value="375.0">375m</html:option>
		                <html:option value="380.0">380m</html:option>
		                <html:option value="385.0">385m</html:option>
		                <html:option value="390.0">390m</html:option>
		                <html:option value="395.0">395m</html:option>
		                <html:option value="400.0">400m</html:option>
		                <html:option value="405.0">405m</html:option>
		                <html:option value="410.0">410m</html:option>
		                <html:option value="415.0">415m</html:option>
		                
		                <html:option value="420.0">420m</html:option>
		                <html:option value="425.0">425m</html:option>
		                <html:option value="430.0">430m</html:option>
		                <html:option value="435.0">435m</html:option>
		                <html:option value="440.0">440m</html:option>
		                <html:option value="445.0">445m</html:option>
		                <html:option value="450.0">450m</html:option>
		                <html:option value="455.0">455m</html:option>
		                <html:option value="460.0">460m</html:option>
		                
		                <html:option value="465.0">465m</html:option>
		                <html:option value="470.0">470m</html:option>
		                <html:option value="475.0">475m</html:option>
		                <html:option value="480.0">480m</html:option>
		                <html:option value="485.0">485m</html:option>
		                <html:option value="490.0">490m</html:option>
		                <html:option value="495.0">495m</html:option>
		                <html:option value="500.0">500m</html:option>
		                <html:option value="505.0">505m</html:option>
		                
		                <html:option value="510.0">510m</html:option>
		                <html:option value="515.0">515m</html:option>
		                <html:option value="520.0">520m</html:option>
		                <html:option value="525.0">525m</html:option>
		                <html:option value="530.0">530m</html:option>
		                <html:option value="535.0">535m</html:option>
		                <html:option value="540.0">540m</html:option>
		                <html:option value="545.0">545m</html:option>
		                <html:option value="550.0">550m</html:option>
		                
		                <html:option value="555.0">555m</html:option>
		                <html:option value="560.0">560m</html:option>
		                <html:option value="565.0">565m</html:option>
		                <html:option value="570.0">570m</html:option>
		                <html:option value="575.0">575m</html:option>
		                <html:option value="580.0">580m</html:option>
		                <html:option value="585.0">585m</html:option>
		                <html:option value="590.0">590m</html:option>
		                <html:option value="595.0">595m</html:option>
		                
		                <html:option value="600.0">600m</html:option>
                    </html:select>
              </span></td>
          </tr>          
          
    	<logic:notEmpty name="equipamentos">	
	          <tr>
	            <td height="26" colspan="2"><span class="txt_form">Equipamentos no im�vel</span></td>
	          </tr>          
		        <logic:iterate name="equipamentos" id="equipamento">
				<tr>
					<td colspan="2" class="MyriadProRegular">
							<span class="txt_form">
									<div class="equip_top1">										
									    <html:multibox property="equipamentos" styleClass="MyriadProRegular"> 
										<bean:write name="equipamento" property="codigo"/>  
										</html:multibox>
									</div>
									<div class="equip_top3">
										<bean:write name="equipamento" property="nome"/>
									</div>
							</span>
					</td>
				</tr>       
			    </logic:iterate>
    	</logic:notEmpty>    
          <tr>
            <td colspan="2" class="busca_avancada"></td>
          </tr>
          <tr>
            <td colspan="2"><a href="#" onclick="submitForm();" border="0"><img src="/buzkaza/_img/btn_buscar.jpg" width="211" height="30" border="0"/></a></td>
          </tr>
        </table>
</div>
</html:form>
