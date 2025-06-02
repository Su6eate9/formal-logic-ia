% SISTEMA DE LÓGICA FORMAL EM PROLOG
% Demonstração de conceitos fundamentais de lógica formal

PARTE 1: BASE DE CONHECIMENTO
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
nao_filosofo(X) :- 
    pessoa(X),

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