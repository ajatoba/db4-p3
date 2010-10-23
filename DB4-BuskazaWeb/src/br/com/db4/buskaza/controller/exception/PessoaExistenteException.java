package br.com.db4.buskaza.controller.exception;

/**
 * Classe responsável por receber exceções globais.
 */
public class PessoaExistenteException extends Exception {

	public PessoaExistenteException() {
		super();
	}

	public PessoaExistenteException(String message) {

		super(message);
	}
}
