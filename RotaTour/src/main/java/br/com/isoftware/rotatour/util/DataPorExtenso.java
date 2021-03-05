package br.com.isoftware.rotatour.util;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class DataPorExtenso {
/*
  public static void main(String[] args) {
    Scanner ler = new Scanner(System.in);

    String s;

    System.out.printf("Informe o nome da Cidade:\n");
    s = ler.nextLine();

    System.out.printf("\nResultado:\n");
    System.out.printf("%s\n", DataPorExtenso(s, new java.util.Date()));
  }
*/
  public static String NomeDoMes(int i, int tipo) {
    String mes[] = {"janeiro", "fevereiro", "março", "abril",
      "maio", "junho", "julho", "agosto", "setembro", "outubro",
      "novembro", "dezembro"};
    if (tipo == 0)
       return(mes[i-1]); 
    else return(mes[i-1].substring(0, 3)); 
  }


  public static String DiaDaSemana(int i, int tipo) {
    String diasem[] = {"domingo", "segunda-feira", "terça-feira",
      "quarta-feira", "quinta-feira", "sexta-feira", "sábado"};
    if (tipo == 0)
       return(diasem[i-1]); 
    else return(diasem[i-1].substring(0, 3));
  }

  public static String DataPorExtenso(String cidade, java.util.Date dt) {
    int d = dt.getDate();
    int m = dt.getMonth()+1;
    int a = dt.getYear()+1900;

    Calendar data = new GregorianCalendar(a, m-1, d);
    int ds = data.get(Calendar.DAY_OF_WEEK);

    return(cidade + ", " + d + " de " + NomeDoMes(m, 0) + " de " +
      a + " (" + DiaDaSemana(ds, 1) + ").");
  }

}