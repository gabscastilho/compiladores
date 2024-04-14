# Documentação externa para compilar e executar o analisador léxico

O analisador léxico foi feito na linguagem Java, utilizando Maven e a biblioteca Antlr. Por isso, para utilizá-lo será necessário instalar os 3. 

## Instalação Java
1. Siga o passo a passo do tutorial no link abaixo para instalar a versão 22 do Java. Nele há as opções para diferentes sistemas  operacionais.
2. https://docs.oracle.com/en/java/javase/22/install/overview-jdk-installation.html#GUID-79FBE4A9-4254-461E-8EA7-A02D7979A161

## Instalação Maven
1. Abaixo está um tutorial para diferentes sistemas para a instalação do Maven 3.8.4
2. https://www.baeldung.com/install-maven-on-windows-linux-mac

OBS: Para utilizar o Antlr, basta incluí-lo nas propriedades do projeto (já está incluso), não é preciso fazer instalação prévia.

## Execução do analisador
1. Clonar o repositório (https://github.com/gabscastilho/compiladores.git)
2. No terminal, navegar até a pasta do projeto (algum-lexico) e rodar o comando ```mvn package```
3. Rodar o comando abaixo. O programa aceita como primeiro argumento o arquivo de entrada, ou seja, o algoritmo que será analisado e como segundo o arquivo de saída, onde serão escritos os token e as suas classes. 
```
java -jar [seu_path_inicial]/alguma-lexico/target/alguma-lexico-1.0-SNAPSHOT-jar-with-dependencies.jar /[path_do_arquivo_de_entrada] /[path_arquivo_saida]

```
4. Caso haja um erro ao rodar ```mvn package```, tente rodar ```mvn clean``` e depois ```mvn package``` novamente e então o comando (acima) para executar.