package br.ufscar.dc.compiladores.alguma.lexico;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;



public class Principal {

    public static void main(String[] args) {
        try {
            // Pega o primeiro argumento da linha de comando
            String arquivoSaida = args[1];
            CharStream cs = CharStreams.fromFileName(args[0]);
            AlgumaLexer lex = new AlgumaLexer(cs);
            Token t = null;
            try(PrintWriter pw = new PrintWriter(arquivoSaida)) {
            while ((t = lex.nextToken()).getType() != Token.EOF) {
                String tipoToken = AlgumaLexer.VOCABULARY.getDisplayName(t.getType());

                if(tipoToken == "ERRO") {
                    pw.println("Linha "+t.getLine()+": "+ t.getText()+" - simbolo nao identificado");
                    break;
                }else if(tipoToken == "PALAVRA_CHAVE" || tipoToken == "PONTUACAO"){
                        pw.println("<" + "'" + t.getText() + "'" + "," + "'" + t.getText() + "'" + ">");  
                }else if(tipoToken == "COMENTARIO_ABERTO"){
                    pw.println("Linha "+t.getLine()+": comentario nao fechado");
                    break;
                }else if(tipoToken == "CADEIA_NAO_FECHADA"){
                    pw.println("Linha "+t.getLine()+": cadeia literal nao fechada");
                    break;
                }else if (tipoToken == "ERRO_COMENTARIO"){
                    pw.println("Linha "+t.getLine()+": "+"} - simbolo nao identificado");
                    break;
                }else{
                    pw.println("<" + "'" + t.getText() + "'" + "," + tipoToken + ">");

                }
                } 
            }catch(FileNotFoundException fnfe) {
                System.err.println("O arquivo/diretório não existe:"+args[1]);
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}