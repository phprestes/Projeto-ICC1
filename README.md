# Projeto ICC1 - Sistema de Companhia Aérea

Sistema simplificado de reserva de passagens para uma companhia aérea, em C, desenvolvido em grupo para a disciplina **SCC0221 - Introdução à Ciência da Computação I** (1/2024).

<p align="center">
  <img alt="Disciplina" src="https://img.shields.io/badge/SCC0221-Introdu%C3%A7%C3%A3o%20%C3%A0%20Ci%C3%AAncia%20da%20Computa%C3%A7%C3%A3o%20I-blue?style=for-the-badge">
  <img alt="Instituição" src="https://img.shields.io/badge/ICMC--USP-Universidade%20de%20S%C3%A3o%20Paulo-orange?style=for-the-badge">
</p>

> **Disciplina:** SCC0221 - Introdução à Ciência da Computação I (1/2024) <br>
> **Professor:** Dr. Rudinei Goularte <br>
> **Instituição:** ICMC/USP

<p align="center">
  <img src="https://img.shields.io/badge/C-A8B9CC?style=for-the-badge&logo=c&logoColor=black" alt="C" />
  <img src="https://img.shields.io/badge/Make-6D00CC?style=for-the-badge&logo=gnu&logoColor=white" alt="Make" />
</p>

> "Uma companhia aérea deseja informatizar seu sistema de reserva de passagens, e você e sua equipe serão os encarregados do projeto e desenvolvimento. Para esta versão inicial a companhia espera um sistema simplificado, considerando uma única aeronave, que reserve apenas trecho de voo simples (único trecho) e para um único passageiro por vez."

O exercício foca conceitos básicos de C: `typedef`/`struct`, alocação dinâmica, manipulação de strings, leitura e escrita binária e organização modular do código. O código do grupo recebeu nota final 9.3, uma das maiores da turma, e foi penalizado por não verificar duplicidade de assentos ou CPFs ao inserir reservas.

## Requisitos

- Compilador **C** (`gcc`)

## Como Executar

Compilar, na pasta do repositório:

```bash
gcc -Wall -Werror -lm -o main main.c
```

Executar:

```bash
./main
```

O programa aceita comandos pela entrada padrão (`stdin`), digitados ou redirecionados de um arquivo com casos de teste. Ao finalizar, os dados são salvos em `arquivo.bin` e recuperados na próxima execução.

## Estrutura do Projeto

- `main.c`: implementação do programa.
- `arquivo.bin`: gerado e atualizado pelo programa (persistência binária).
- `Testes/`: casos de teste usados para correção.
- `Makefile`: build.

## Funcionalidades Implementadas

O sistema abre um voo, registra, consulta, modifica e cancela reservas e gera os fechamentos do dia e do voo.

| Comando | Função | Formato |
| :--- | :--- | :--- |
| `AV` | Abertura de voo: define a quantidade de assentos e os preços das classes. | `AV <qtdAssentos> <valorEconomica> <valorExecutiva>` |
| `RR` | Realizar reserva: registra nome, sobrenome, CPF, data, número do voo, assento, classe, valor pago, origem e destino. Data, voo, origem e destino sobrescrevem os valores da struct do voo e valem para o voo atual. | `RR <nome> <sobrenome> <cpf> <data> <numero_voo> <assento> <classe> <valor> <origem> <destino>` |
| `CR` | Consultar reserva por CPF e imprimir os detalhes. | `CR <cpf>` |
| `MR` | Modificar nome, sobrenome, CPF e assento de uma reserva, se o voo ainda estiver aberto. | `MR <cpf_antigo> <novo_nome> <novo_sobrenome> <novo_cpf> <novo_assento>` |
| `CA` | Cancelar reserva por CPF, se o voo ainda estiver aberto. | `CA <cpf>` |
| `FD` | Fechamento do dia: número de reservas e receita total do dia. | `FD` |
| `FV` | Fechamento do voo: lista de passageiros (CPF, nome, sobrenome, assento) e valor total; marca o voo como fechado e encerra o programa. | `FV` |

Exemplos:

```
AV 25 2000.00 4000.00
RR Joao Silva 001.001.001-01 02/01/2006 V004 J10 economica 2000.00 CGH RAO
CR 001.001.001-01
MR 001.001.001-01 Leonardo Davinci 000.000.000-01 D30
CA 001.001.001-01
```

### Persistência de dados

O programa salva e carrega o estado (struct do voo e vetor de passageiros) em `arquivo.bin`, na mesma pasta do executável. O arquivo contém o número de passageiros, os dados da struct `voo` (campos de tamanho fixo) e, para cada passageiro, o tamanho e os bytes do nome e do sobrenome (leitura dinâmica), seguidos dos campos de tamanho fixo (CPF, assento, classe).

## Integrantes do grupo

- Pedro Henrique Prestes
- João Gabriel Pieroli
- Jhonathan Barboza

Este repositório tem caráter acadêmico e didático: serve apenas como registro das atividades da disciplina.
