package br.com.isoftware.rotatour.util;

import java.math.BigDecimal;
import java.text.NumberFormat;

public class ConverteValores {
  
	public String valorParaReal(BigDecimal valor) {
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String real = nf.format (valor); // deve mostrar "R$ 12,34"
		return real;
	}
   	public String valorParaReal(BigDecimal valor, int quantidade) {
   		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		String real = nf.format (valor);
		real = nf.format (new BigDecimal(String.valueOf((valor.doubleValue() * quantidade)))); // deve mostrar "R$ 12,34"
		return real;
	}
   	public BigDecimal valorParaBigDecimal(String str) {
   		
   	        str = str.replace(".","");
   	        str = str.replace(",", ".");
   	        str = str.replace("R$ ", "");
   	        str = str.trim();
   	        return new BigDecimal(str);
   	}
   	public BigDecimal valorParcelaBigDecimal(String str, String parcelas) {
   		
	        str = str.replace(".","");
	        str = str.replace(",", ".");
	        str = str.replace("R$ ", "");
	        str = str.trim();
	        BigDecimal bigDecimal = (new BigDecimal(String.valueOf(((valorParaBigDecimal(str).doubleValue() / 100)/ Integer.parseInt(parcelas)))));
	        return bigDecimal;
	}
   	public String[] RetornaValoresParcelas(String str) {
   		
   			String[] parcelas = new String[11];
   			NumberFormat nf = NumberFormat.getCurrencyInstance();
   			
	        str = str.replace(".","");
	        str = str.replace(",", ".");
	        str = str.replace("R$ ", "");
	        str = str.trim();
	        
	        for (int i = 0; i < parcelas.length; i++) {
	        	 parcelas[i] = nf.format (new BigDecimal(String.valueOf(((valorParaBigDecimal(str).doubleValue() / 100)/ (i+2))))) ;
			}
	        
	        return parcelas;
	}
}
