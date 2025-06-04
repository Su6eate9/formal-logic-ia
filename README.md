# LÓGICA FORMAL

A Lógica Formal é o estudo sistemático da forma dos argumentos, independentemente de seu conteúdo. Seu objetivo é distinguir raciocínios válidos de inválidos, garantindo que conclusões sejam derivadas corretamente das premissas.

# Sistema de Lógica Formal em Prolog

Um sistema completo de demonstração de conceitos fundamentais de lógica aplicados em Prolog, incluindo base de conhecimento, regras de inferência, operadores lógicos e sistema de testes.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Instalação](#instalação)
- [Estrutura do Sistema](#estrutura-do-sistema)
- [Como Usar](#como-usar)
- [Comandos Disponíveis](#comandos-disponíveis)
- [Exemplos de Uso](#exemplos-de-uso)
- [Testes](#testes)
- [Base de Conhecimento](#base-de-conhecimento)
- [Contribuindo](#contribuindo)

## 🎯 Visão Geral

Este sistema implementa conceitos fundamentais de lógica formal utilizando Prolog, incluindo:

- **Base de conhecimento** com pessoas, filósofos e suas propriedades
- **Regras de inferência lógica** (modus ponens, silogismos)
- **Operadores lógicos** (conjunção, disjunção, negação)
- **Quantificadores** (universal e existencial)
- **Sistema de parentesco** com relações familiares
- **Sistema de testes** automatizado
- **Predicados de consulta** interativos

## 🔧 Instalação

### Pré-requisitos

- SWI-Prolog ou compatível instalado no sistema
- Sistema operacional: Windows, Linux ou macOS

### Como executar

1. Clone o repositório ou baixe o arquivo `sistema_logica.pl`
2. Abra o interpretador Prolog
3. Carregue o arquivo:
   ```prolog
   ?- [sistema_logica].
   ```
4. Execute o menu para ver os comandos disponíveis:
   ```prolog
   ?- menu.
   ```

## 🏗️ Estrutura do Sistema

### Componentes Principais

1. **Base de Conhecimento**: Fatos sobre pessoas, filósofos e propriedades
2. **Regras de Inferência**: Lógica para dedução de novos conhecimentos
3. **Operadores Lógicos**: Implementação de AND, OR, NOT
4. **Quantificadores**: Lógica universal e existencial
5. **Sistema de Parentesco**: Relações familiares e genealógicas
6. **Sistema de Testes**: Verificação automatizada de funcionalidades
7. **Interface de Consulta**: Comandos interativos para o usuário

## 🚀 Como Usar

### Comandos Básicos de Consulta

```prolog
% Verificar se alguém é pessoa
?- pessoa(socrates).

% Listar todos os filósofos
?- filosofo(X).

% Verificar se alguém é sábio
?- sabio(aristoteles).
```

### Comandos de Sistema

```prolog
% Mostrar menu de ajuda
?- menu.

% Executar demonstração completa
?- demonstracao.

% Verificar consistência da base
?- verificar_consistencia.
```

## 📚 Comandos Disponíveis

### Comandos de Teste

- `teste_basico.` - Executa testes básicos do sistema
- `executar_todos_testes.` - Executa bateria completa de testes
- `teste_inferencia.` - Testa regras de inferência
- `teste_quantificadores.` - Testa quantificadores lógicos
- `teste_parentesco.` - Testa relações familiares

### Comandos de Listagem

- `listar_pessoas.` - Lista todas as pessoas na base
- `listar_filosofos.` - Lista todos os filósofos
- `listar_sabios.` - Lista todas as pessoas sábias

### Comandos de Consulta

- `consultar_pessoa(Nome).` - Consulta informações sobre uma pessoa específica
- `verificar_consistencia.` - Verifica a consistência da base de conhecimento
- `demonstracao.` - Executa demonstração completa do sistema

## 💡 Exemplos de Uso

### Consultas Básicas

```prolog
% Quem são os filósofos?
?- filosofo(X).
X = socrates ;
X = aristoteles ;
X = platao.

% Sócrates é sábio?
?- sabio(socrates).
true.

% Quem é interessante?
?- interessante(X).
X = socrates ;
X = aristoteles ;
X = platao.
```

### Consultas de Parentesco

```prolog
% Quem são os irmãos?
?- irmao(X, Y).
X = maria, Y = pedro ;
X = pedro, Y = maria.

% João é progenitor de quem?
?- progenitor(joao, X).
X = maria ;
X = pedro.
```

### Consultas Avançadas

```prolog
% Consultar informações completas sobre uma pessoa
?- consultar_pessoa(socrates).
Consultando: socrates
- E uma pessoa
- E mortal
- E filosofo
- E grego
- E sabio

% Verificar se todos são mortais
?- todos_mortais.
true.
```

## 🧪 Testes

O sistema inclui uma bateria completa de testes automatizados:

### Execução de Todos os Testes

```prolog
?- executar_todos_testes.
```

### Testes Individuais

```prolog
% Teste básico de funcionamento
?- teste_basico.

% Teste de regras de inferência
?- teste_inferencia.

% Teste de quantificadores
?- teste_quantificadores.

% Teste de relações familiares
?- teste_parentesco.
```

## 📊 Base de Conhecimento

### Pessoas na Base

- **Filósofos Gregos**: Sócrates, Aristóteles, Platão
- **Outras Pessoas**: Maria, João, Pedro, Ana

### Propriedades

- Todos são mortais
- Filósofos gregos são sábios
- Sistema de parentesco definido

### Relações Familiares

```
João (pai) ─┬─ Maria
            └─ Pedro
Ana (mãe) ──┬─ Maria
            └─ Pedro
```

## 🔍 Predicados Principais

### Predicados de Base

- `pessoa(X)` - X é uma pessoa
- `mortal(X)` - X é mortal
- `filosofo(X)` - X é filósofo
- `grego(X)` - X é grego

### Predicados de Inferência

- `sabio(X)` - X é sábio (filósofo grego)
- `humano_mortal(X)` - X é humano e mortal
- `interessante(X)` - X é interessante (filósofo ou grego)

### Predicados de Parentesco

- `pai(X, Y)` - X é pai de Y
- `mae(X, Y)` - X é mãe de Y
- `progenitor(X, Y)` - X é progenitor de Y
- `irmao(X, Y)` - X e Y são irmãos

## 🔧 Funcionalidades Avançadas

### Quantificadores

- **Universal**: Verifica se todos os elementos satisfazem uma condição
- **Existencial**: Verifica se existe pelo menos um elemento que satisfaz uma condição

### Operadores Lógicos

- **Conjunção (AND)**: `filosofo_mortal(X)`
- **Disjunção (OR)**: `interessante(X)`
- **Negação (NOT)**: `nao_filosofo(X)`

### Silogismos

- **Barbara**: Implementação do silogismo clássico
- **Modus Ponens**: Regra de inferência básica

## 🤝 Contribuindo

Para contribuir com este projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/NovaFuncionalidade`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/NovaFuncionalidade`)
5. Abra um Pull Request

## 📝 Notas Técnicas

- Compatível com SWI-Prolog e interpretadores Prolog padrão
- Utiliza predicados built-in como `forall/2`, `findall/3`, `\+/1`
- Sistema de testes automatizado garante integridade
- Base de conhecimento extensível

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 🎓 Propósito Educacional

Este sistema foi desenvolvido para fins educacionais, demonstrando:

- Conceitos fundamentais de lógica formal
- Implementação de regras de inferência em Prolog
- Estruturação de bases de conhecimento
- Testes automatizados em Prolog
- Boas práticas de programação lógica

---

/*  ===========================================================  
   SISTEMA DE LÓGICA FORMAL EM PROLOG  
   Desenvolvido por  
   Antonio Claudino Silva Neto  
   Gabryel Guimaraes Coelho Gomes  
   Maria Luiza Monteiro  
   Nickolas Ferreira Maiolino  
  
   Este sistema demonstra conceitos fundamentais de lógica:  
   - Inferência  
   - Operadores Lógicos  
   - Quantificadores  
   - Silogismos  
   - Relações familiares  
   ===========================================================   */