% SISTEMA DE LÓGICA FORMAL EM PROLOG
% Demonstração de conceitos fundamentais de lógica formal  
% MENU INTERATIVO 
% O sistema oferece opções e executa baseado na escolha do usuário.

menu_interativo :- 
    nl,
    write('====== MENU DO SISTEMA DE LOGICA FORMAL ======'), nl,
    write('1. Listar pessoas'), nl,
    write('2. Listar filosofos'), nl,
    write('3. Listar sabios'), nl,
    write('4. Consultar uma pessoa'), nl,
    write('5. Executar todos os testes'), nl,
    write('6. Verificar consistencia'), nl,
    write('7. Demonstracao completa'), nl,
    write('8. Sair'), nl,
    write('Digite uma opcao (1-8): '), 
    read(Opcao), 
    executar_opcao(Opcao).

executar_opcao(1) :- listar_pessoas, menu_interativo.
executar_opcao(2) :- listar_filosofos, menu_interativo.
executar_opcao(3) :- listar_sabios, menu_interativo.
executar_opcao(4) :- 
    write('Digite o nome da pessoa (com ponto no final): '), 
    read(Pessoa), 
    consultar_pessoa(Pessoa), 
    menu_interativo.
executar_opcao(5) :- executar_todos_testes, menu_interativo.
executar_opcao(6) :- verificar_consistencia, menu_interativo.
executar_opcao(7) :- demonstracao, menu_interativo.
executar_opcao(8) :- write('Saindo do sistema. Ate logo!'), nl.
executar_opcao(_) :- write('Opcao invalida, tente novamente.'), nl, menu_interativo.

% PARTE 1: BASE DE CONHECIMENTO
% Pessoas na base de conhecimento
pessoa(socrates).
pessoa(aristoteles).
pessoa(platao).
pessoa(maria).
pessoa(joao).
pessoa(pedro).
pessoa(ana).

% Propriedades das pessoas
mortal(socrates).
mortal(aristoteles).
mortal(platao).
mortal(maria).
mortal(joao).
mortal(pedro).
mortal(ana).

% Filósofos
filosofo(socrates).
filosofo(aristoteles).
filosofo(platao).

% Nacionalidade
grego(socrates).
grego(aristoteles).
grego(platao).

% PARTE 2: REGRAS DE INFERÊNCIA LÓGICA
% Todo ser humano é mortal
humano_mortal(X) :- 
    pessoa(X),
    mortal(X).

% Todo filósofo grego é sábio
sabio(X) :- 
    filosofo(X),
    grego(X).

% Uma pessoa não pode ser imortal se é mortal
imortal(X) :- 
    pessoa(X),
    \+ mortal(X).

% PARTE 3: OPERADORES LÓGICOS
% Conjunção (AND)
filosofo_mortal(X) :- 
    filosofo(X),
    mortal(X).

% Disjunção (OR)
interessante(X) :- 
    filosofo(X).
interessante(X) :- 
    grego(X).

% Negação (NOT)
% O predicado nao_filosofo verifica se uma pessoa NÃO é filósofo.
% Funciona utilizando a negação em Prolog (\+), que significa "não é provado que...".
nao_filosofo(X) :- 
    pessoa(X),     % Garante que X é uma pessoa da base
    \+ filosofo(X). % E que NÃO é um filósofo

% OPERADOR CONDICIONAL (SE → ENTÃO)
% condicional(P, Q) é verdadeiro se P for falso OU Q for verdadeiro.
% Representa a lógica: "Se P então Q".
condicional(P, Q) :- 
    \+ call(P); call(Q).

% BICONDICIONAL (↔)
% bicondicional(P, Q) é verdadeiro se P e Q tiverem o mesmo valor lógico.
% Ou seja, ambos verdadeiros ou ambos falsos.
bicondicional(P, Q) :- 
    (call(P), call(Q)); 
    (\+ call(P), \+ call(Q)).

% XOR EXCLUSIVO
% xor(P, Q) é verdadeiro se P ou Q forem verdadeiros, mas NÃO ambos.
xor(P, Q) :- 
    (call(P), \+ call(Q));
    (\+ call(P), call(Q)).

% PARTE 4: QUANTIFICADORES
% Quantificador Universal - todos são mortais
todos_mortais :- 
    forall(pessoa(X), mortal(X)).

% Quantificador Existencial - existe filósofo
existe_filosofo :- 
    pessoa(X),
    filosofo(X).
  
% PARTE 5: SILOGISMOS
% Silogismo Barbara
silogismo_barbara(X, mortal(X)) :-
    pessoa(X),
    mortal(X).

% Modus Ponens
modus_ponens(P, Q) :-
    call(P),
    (call(P) -> call(Q)).

% PARTE 6: SISTEMA DE PARENTESCO
% Relações familiares
pai(joao, maria).
pai(joao, pedro).
mae(ana, maria).
mae(ana, pedro).

% Progenitor
progenitor(X, Y) :- pai(X, Y).
progenitor(X, Y) :- mae(X, Y).

% Irmãos
irmao(X, Y) :- 
    progenitor(Z, X),
    progenitor(Z, Y),
    X \= Y.

% Avô/Avó
avo(X, Z) :- 
    progenitor(X, Y),
    progenitor(Y, Z).
    
% Neto ou neta
neto(X, Y) :- 
    progenitor(Y, Z), 
    progenitor(Z, X).

% Tio ou tia
tio(X, Y) :- 
    progenitor(Z, Y), 
    irmao(X, Z).

% Primo ou prima
primo(X, Y) :- 
    progenitor(Z, X), 
    progenitor(W, Y), 
    irmao(Z, W),
    X \= Y.

% PARTE 7: PREDICADOS DE UTILIDADE
% Lista todas as pessoas
listar_pessoas :-
    findall(X, pessoa(X), Pessoas),
    write('Pessoas: '), write(Pessoas), nl.

% Lista todos os filósofos
listar_filosofos :-
    findall(X, filosofo(X), Filosofos),
    write('Filosofos: '), write(Filosofos), nl.

% Lista todos os sábios
listar_sabios :-
    findall(X, sabio(X), Sabios),
    write('Sabios: '), write(Sabios), nl.

% PARTE 8: SISTEMA DE TESTES
% Teste básico de funcionamento
teste_basico :-
    write('=== TESTE BASICO ==='), nl,
    write('Verificando fatos basicos:'), nl,
    (pessoa(socrates) -> write('- Socrates e pessoa: OK') ; write('- Erro: Socrates')), nl,
    (filosofo(socrates) -> write('- Socrates e filosofo: OK') ; write('- Erro: filosofo')), nl,
    (sabio(socrates) -> write('- Socrates e sabio: OK') ; write('- Erro: sabio')), nl,
    nl.

% Teste de inferência
teste_inferencia :-
    write('=== TESTE DE INFERENCIA ==='), nl,
    (humano_mortal(socrates) -> write('- Inferencia humano_mortal: OK') ; write('- Erro inferencia')), nl,
    (filosofo_mortal(platao) -> write('- Filosofo mortal: OK') ; write('- Erro filosofo_mortal')), nl,
    (interessante(aristoteles) -> write('- Interessante: OK') ; write('- Erro interessante')), nl,
    nl.

% Teste de quantificadores
teste_quantificadores :-
    write('=== TESTE QUANTIFICADORES ==='), nl,
    (todos_mortais -> write('- Todos mortais: OK') ; write('- Erro todos_mortais')), nl,
    (existe_filosofo -> write('- Existe filosofo: OK') ; write('- Erro existe_filosofo')), nl,
    nl.

% Teste de parentesco
teste_parentesco :-
    write('=== TESTE PARENTESCO ==='), nl,
    (progenitor(joao, maria) -> write('- Progenitor joao-maria: OK') ; write('- Erro progenitor')), nl,
    (irmao(maria, pedro) -> write('- Irmaos maria-pedro: OK') ; write('- Erro irmaos')), nl,
    nl.

% Teste completo do sistema
executar_todos_testes :-
    write('EXECUTANDO BATERIA COMPLETA DE TESTES'), nl,
    nl,
    teste_basico,
    teste_inferencia,
    teste_quantificadores,
    teste_parentesco,
    write('TODOS OS TESTES CONCLUIDOS'), nl.

% PARTE 9: SISTEMA DE CONSULTA
% Consulta informações sobre uma pessoa
consultar_pessoa(Pessoa) :-
    write('Consultando: '), write(Pessoa), nl,
    (   pessoa(Pessoa) 
    ->  (   write('- E uma pessoa'), nl,
            (mortal(Pessoa) -> write('- E mortal') ; write('- Nao e mortal')), nl,
            (filosofo(Pessoa) -> write('- E filosofo') ; write('- Nao e filosofo')), nl,
            (grego(Pessoa) -> write('- E grego') ; write('- Nao e grego')), nl,
            (sabio(Pessoa) -> write('- E sabio') ; write('- Nao e sabio')), nl
        )
    ;   write('- Pessoa nao encontrada na base'), nl
    ).

% Menu do sistema
menu :-
    nl,
    write('=== SISTEMA DE LOGICA FORMAL ==='), nl,
    write('Comandos disponíveis:'), nl,
    write('- teste_basico.'), nl,
    write('- executar_todos_testes.'), nl,
    write('- listar_pessoas.'), nl,
    write('- listar_filosofos.'), nl,
    write('- consultar_pessoa(X).'), nl,
    nl.

% PARTE 10: PREDICADOS ESPECIAIS
% Verifica consistência da base
verificar_consistencia :-
    write('=== VERIFICACAO DE CONSISTENCIA ==='), nl,
    (todos_mortais -> write('- Base consistente: todos mortais') ; write('- Inconsistencia detectada')), nl,
    (existe_filosofo -> write('- Filosofos encontrados na base') ; write('- Nenhum filosofo na base')), nl,
    nl.

% Demonstra capacidades do sistema
demonstracao :-
    write('=== DEMONSTRACAO DO SISTEMA ==='), nl,
    write('1. Listando pessoas:'), nl,
    listar_pessoas,
    write('2. Listando filosofos:'), nl,
    listar_filosofos,
    write('3. Listando sabios:'), nl,
    listar_sabios,
    write('4. Testando inferencias:'), nl,
    teste_inferencia,
    write('Demonstracao concluida!'), nl.

% PARTE 11: EXPLICABILIDADE DO RACIOCÍNIO
% O predicado explicar(P) tenta explicar porque P é verdadeiro.
explicar(P) :- 
    call(P), 
    write('O fato '), write(P), write(' é verdadeiro porque:'), nl,
    explicar_base(P), !.

explicar(P) :- 
    \+ call(P), 
    write('O fato '), write(P), write(' é falso ou não pode ser provado.'), nl.

% Regras específicas de explicação
explicar_base(pessoa(X)) :- 
    write('- '), write(X), write(' está definido como pessoa na base.'), nl.

explicar_base(filosofo(X)) :- 
    write('- '), write(X), write(' é filósofo segundo a base de conhecimento.'), nl.

explicar_base(grego(X)) :- 
    write('- '), write(X), write(' é grego segundo a base.'), nl.

explicar_base(mortal(X)) :- 
    write('- '), write(X), write(' é mortal porque está no conjunto de mortais.'), nl.

explicar_base(humano_mortal(X)) :- 
    write('- '), write(X), write(' é mortal porque é uma pessoa e todo humano é mortal.'), nl.

explicar_base(sabio(X)) :- 
    write('- '), write(X), write(' é sábio porque é filósofo e é grego.'), nl.

explicar_base(irmao(X, Y)) :- 
    write('- '), write(X), write(' e '), write(Y), write(' são irmãos porque possuem pelo menos um progenitor em comum.'), nl.

explicar_base(avo(X, Y)) :- 
    write('- '), write(X), write(' é avô ou avó de '), write(Y), write(' porque é progenitor de um progenitor.'), nl.

explicar_base(tio(X, Y)) :- 
    write('- '), write(X), write(' é tio ou tia de '), write(Y), write(' porque é irmão de um dos progenitores.'), nl.

explicar_base(primo(X, Y)) :- 
    write('- '), write(X), write(' e '), write(Y), write(' são primos porque seus pais são irmãos.'), nl.

/*
DOCUMENTAÇÃO E USO
Este sistema é uma demonstração de lógica formal em Prolog, abrangendo conceitos como inferência lógica, operadores lógicos, quantificadores, silogismos e relações de parentesco. Ele inclui uma base de conhecimento com pessoas, filósofos e regras de inferência.
COMO USAR ESTE SISTEMA:

1. COMANDOS BÁSICOS:
   pessoa(socrates).          % Verifica se Sócrates é pessoa
   filosofo(X).               % Lista todos os filósofos
   sabio(aristoteles).        % Verifica se Aristóteles é sábio

2. COMANDOS DE TESTE:
   teste_basico.              % Executa testes básicos
   executar_todos_testes.     % Executa todos os testes
   verificar_consistencia.    % Verifica consistência da base

3. COMANDOS DE LISTAGEM:
   listar_pessoas.            % Lista todas as pessoas
   listar_filosofos.          % Lista todos os filósofos
   listar_sabios.             % Lista todos os sábios

4. COMANDOS DE CONSULTA:
   consultar_pessoa(socrates). % Consulta informações sobre Sócrates
   demonstracao.               % Demonstra o sistema completo
   menu.                       % Mostra este menu

5. EXEMPLOS DE USO:
   ?- sabio(X).               % Quem é sábio?
   ?- interessante(maria).    % Maria é interessante?
   ?- irmao(X, Y).           % Quem são irmãos?

ESTRUTURA DA BASE:
- 7 pessoas definidas
- 3 filósofos gregos
- Sistema de parentesco
- Regras de inferência lógica
- Operadores lógicos completos
*/