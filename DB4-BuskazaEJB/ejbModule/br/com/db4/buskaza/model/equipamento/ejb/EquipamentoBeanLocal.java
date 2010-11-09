package br.com.db4.buskaza.model.equipamento.ejb;

import java.util.Collection;

import javax.ejb.Local;

import br.com.db4.buskaza.model.entity.Equipamento;

@Local
public interface EquipamentoBeanLocal {

	public static String LOCAL = "ejb/EquipamentoBean/local";
	
	public Collection<Equipamento> listarEquipamentos();
}
