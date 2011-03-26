package br.com.db4.buskaza.model.tipoPagamento.ejb;

import java.util.Collection;
import javax.ejb.Local;
import br.com.db4.buskaza.model.entity.TipoPagamento;

@Local
public interface TipoPagamentoBeanLocal {

public static String LOCAL = "ejb/TipoPagamentoBean/local";
	
	public Collection<TipoPagamento> listarTiposPagamento();
}
