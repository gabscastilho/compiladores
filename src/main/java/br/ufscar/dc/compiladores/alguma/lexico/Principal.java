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
            String arquivoSaida = args[1];  // segundo argumento -> arquivo de saída
            CharStream cs = CharStreams.fromFileName(args[0]);  //primeiro argumento -> arquivo de entrada

            AlgumaLexer lex = new AlgumaLexer(cs);
            Token t = null;

            try(PrintWriter pw = new PrintWriter(arquivoSaida)) {
                while ((t = lex.nextToken()).getType() != Token.EOF) {
                    String tipoToken = AlgumaLexer.VOCABULARY.getDisplayName(t.getType());

                    //Abaixo, para cada classe que precisasse de uma saída específica há um if para tratá-la
                    if(tipoToken == "ERRO_CARACTER") { 
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
                        /* Para o erro do comentário com uma chave a mais, não foi possível pegar somente o toke "}" errado,
                         * pois todo o comentário + } era retornado como token. Por ser um erro específico, optei por 
                         * não utilizar t.getText() e sim escrevê-lo na mensagem.
                         */
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