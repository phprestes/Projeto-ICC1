# Projeto ICC1 - Sistema de Companhia Aérea

Projeto desenvolvido para a disciplina SCC0221 - Introdução à Ciência da Computação I (1/2024) do ICMC/USP, ministrada pelo professor Dr. Rudinei Goularte. 

_"Uma companhia área deseja informatizar seu sistema de reserva de passagens, e você e sua equipe serão os encarregados do projeto e desenvolvimento. Para esta versão inicial a companhia espera um sistema simplificado, considerando uma única aeronave, que reserve apenas trecho de voo simples (único trecho) e para um único passageiro por vez."_

- O exercício foca conceitos básicos de C: typedef/structs, alocação dinâmica, manipulação de strings, leitura/escrita binária e organização modular de código.

- O código feito pelo grupo recebeu nota final de 9.3, uma das maiores da turma. Ele foi penalizado uma vez que não havia verificação de duplicidade de assentos ou CPFs ao inserir reservas.

## Integrantes do grupo
- Pedro Henrique Prestes
- João Gabriel Pieroli
- Jhonathan Barboza

## Funcionalidade

O sistema permite abrir um voo, registrar reservas, consultar, modificar, cancelar reservas, e gerar fechamentos do dia e do voo. Todas as interações com o programa são feitas por comandos lidos da entrada padrão (stdin). Ao finalizar, os dados são salvos em `arquivo.bin` para que possam ser recuperados na próxima execução.

### Como compilar

Abra um terminal na pasta do repositório e rode:

```bash
gcc -Wall -Werror -lm -o main main.c
```

### Como executar

Após compilar, execute:

```bash
./companhia
```

O programa passa a aceitar comandos via stdin - digitado interativamente ou redirecionado a partir de um arquivo de entrada com casos de teste.

### Comandos suportados 

#### AV (Abertura de Voo)

- Descrição: define a quantidade de assentos e os preços das classes.
- Formato: AV <qtdAssentos> <valorEconomica> <valorExecutiva>
- Exemplo: AV 25 2000.00 4000.00

#### RR (Realizar Reserva)

- Descrição: registra uma nova reserva (nome, sobrenome, CPF, data, número do voo, assento, classe, valor pago, origem e destino). A data, número do voo, origem e destino sobrescrevem os valores armazenados na struct do voo e são considerados globais para o voo atual.
- Formato esperado: RR <nome> <sobrenome> <cpf> <data> <numero_voo> <assento> <classe> <valor> <origem> <destino>
- Exemplo: RR Joao Silva 001.001.001-01 02/01/2006 V004 J10 economica 2000.00 CGH RAO

#### CR (Consultar Reserva)

- Descrição: procura uma reserva por CPF e imprime os detalhes.
- Formato: CR <cpf>
- Exemplo: CR 001.001.001-01

#### MR (Modificar Reserva)

- Descrição: altera nome, sobrenome, CPF e assento de uma reserva existente, caso o voo ainda esteja aberto.
- Formato: MR <cpf_antigo> <novo_nome> <novo_sobrenome> <novo_cpf> <novo_assento>
- Exemplo: MR 001.001.001-01 Leonardo Davinci 000.000.000-01 D30

#### CA (Cancelar Reserva)
- Descrição: remove uma reserva por CPF, caso o voo ainda esteja aberto.
- Formato: CA <cpf>
- Exemplo: CA 001.001.001-01

#### FD (Fechamento do Dia)
- Descrição: imprime o número de reservas e a receita total do dia.
- Formato: FD

#### FV (Fechamento do Voo)
- Descrição: imprime a lista de passageiros (CPF, nome, sobrenome, assento) e o valor total arrecadado, marcando também o voo como fechado e forçando o término do programa.
- Formato: FV

Persistência de dados
- O programa salva e carrega o estado (struct do voo + vetor de passageiros) em `arquivo.bin` na mesma pasta do executável.
- O arquivo contém o número de passageiros, dados da struct `voo` (campos com tamanhos fixos) e, para cada passageiro, o tamanho/bytes do nome e sobrenome (para leitura dinâmica), seguido dos campos de tamanho fixo (CPF, assento, classe).

### Estrutura de arquivos

- `main.c` — implementação do programa.
- `arquivo.bin` — gerado/atualizado pelo programa (arquivo binário de persistência).
- `Testes/` — casos de teste utilizados para correção.

### OBSERVAÇÕES FINAIS

Este repositório tem caráter acadêmico e didático, portanto, serve apenas para fins de registro das atividades e dos exercícios realizados na disciplina de Introdução à Ciência de Computação I.
