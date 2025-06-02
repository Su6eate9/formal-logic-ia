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
    \+ filosofo(X).

% PARTE 4: QUANTIFICADORES
% Quantificador Universal - todos são mortais
todos_mortais :- 
    forall(pessoa(X), mortal(X)).

% Quantificador Existencial - existe filósofo
existe_filosofo :- 
    pessoa(X),
    filosofo(X).