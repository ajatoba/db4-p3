package br.com.db4.buskaza.controller.exception;

/**
 * Classe respons�vel por receber exce��es globais.
 */
public class PessoaExistenteException extends Exception {

	public PessoaExistenteException() {
		super();
	}

	public PessoaExistenteException(String message) {

		super(message);
	}
}
