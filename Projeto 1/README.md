# **Sistema de Loja de conveniência**
Implementação ..... para a matéria
[Análise de algoritmo](https://danielsaad.com/analise-de-algoritmos/) ministrada pelos Profesorres: _Daniel Saad_ e _Leandro Vaguetti_ - 2024/1.\
por [Tales Lima de Oliveira.](https://github.com/TalesLimaOliveira)

<br/>

# Compilação Genérica de Arquivos
Este projeto consiste em um Makefile genérico que pode ser utilizado em qualquer sistema operacional para compilar programas em C/C++. Ele oferece uma estrutura de pastas organizada e automatiza o processo de compilação e limpeza dos arquivos binários temporários.

Por [Tales L. Oliveira.](https://github.com/TalesLimaOliveira)

## Requisitos
> GCC/G++ (MinGW.org GCC Build-2) - Versão 9.2.0

> GNU Make - Versão 3.82.90

<br>

## Compilação e Limpeza de Arquivos

Para compilar e executar o projeto, utilize o seguinte comando:

```go
make APP=<nome_do_app>
```

Substitua **<nome_do_app>** pelo nome do arquivo localizado na pasta app que deseja compilar.

Por padrao o **<nome_do_app>** vem **app**.

O projeto irá criar as pastas **bin** e **obj** para armazenar os arquivos binários temporários gerados durante a compilação.

O projeto irá remover os arquivos temporários automaticamente.

Mas caso queira forçar a limpeza, utilize este comando:

```go
make clean
```
