package br.com.db4.buskaza.controller.plugin;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;

import org.apache.commons.beanutils.Converter;

public class DoubleConverterBR implements Converter {

	private static DoubleConverterBR instance;
	private DecimalFormat decimalFormat;
	private char decimalSeparator = ',';
	private char thousandSeparator = '.';

	private DoubleConverterBR() {
		DecimalFormatSymbols symbols = new DecimalFormatSymbols();
		symbols.setDecimalSeparator(decimalSeparator);
		symbols.setGroupingSeparator(thousandSeparator);
		decimalFormat = new DecimalFormat("#,##0.00", symbols);
	}

	public static DoubleConverterBR getInstance() {
		if (null == instance) {
			instance = new DoubleConverterBR();
		}
		return instance;
	}

	public Object convert(Class clazz, Object value) {
		return toDouble((String) value);
	}

	public String cleanNumber(String input) {
		char[] data = input.toCharArray();
		StringBuffer buffer = new StringBuffer();

		for (int i = 0; i < data.length; i++) {
			if (Character.isDigit(data[i]) || data[i] == decimalSeparator) {
				buffer.append(data[i]);
			}
		}

		return buffer.toString();
	}

	public Double toDouble(String value) {
		try {
			value = cleanNumber(value);
			Number numberValue = decimalFormat.parse(value);
			return new Double(numberValue.doubleValue());
		} catch (ParseException e) {
			System.out.println("valor inválido : [" + value + "]" + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	public String format(Double value){
		try {
			return decimalFormat.format(value);
		} catch (Exception e) {
			System.out.println("valor inválido : [" + value + "]" + e.getMessage());
			e.printStackTrace();
		}
		return "0,0";		
	}

}
