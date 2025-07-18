% ==================================================================
% SISTEMA INTELIGENTE DE ANÁLISE DE BENEFÍCIOS SOCIAIS
% ==================================================================

% ==================================================================
% MÓDULO 1: BASE DE CONHECIMENTO
% ==================================================================

% Definição de subclasses (sem operadores customizados)
subclass_of(auxilio_financeiro, beneficio_social).
subclass_of(beneficio_previdenciario, beneficio_social).
subclass_of(beneficio_assistencial, beneficio_social).
subclass_of(servico_publico, direito_social).
subclass_of(auxilio_brasil, auxilio_financeiro).
subclass_of(bpc, beneficio_assistencial).
subclass_of(vale_gas, auxilio_financeiro).
subclass_of(tarifa_social_energia, beneficio_social).
subclass_of(auxilio_creche, servico_publico).
subclass_of(passe_livre, servico_publico).

% Instâncias de cidadãos
instance_of(maria_silva, cidadao).
instance_of(joao_santos, cidadao).
instance_of(ana_costa, cidadao).
instance_of(pedro_oliveira, cidadao).
instance_of(lucia_fernandes, cidadao).

% Propriedades dos Cidadãos
cidadao_propriedade(maria_silva, idade, 67).
cidadao_propriedade(maria_silva, renda_familiar, 500).
cidadao_propriedade(maria_silva, num_filhos, 0).
cidadao_propriedade(maria_silva, situacao_emprego, aposentada).
cidadao_propriedade(maria_silva, tem_deficiencia, nao).
cidadao_propriedade(maria_silva, estado, 'SP').
cidadao_propriedade(maria_silva, cidade, 'São Paulo').

cidadao_propriedade(joao_santos, idade, 35).
cidadao_propriedade(joao_santos, renda_familiar, 0).
cidadao_propriedade(joao_santos, num_filhos, 2).
cidadao_propriedade(joao_santos, situacao_emprego, desempregado).
cidadao_propriedade(joao_santos, tem_deficiencia, nao).
cidadao_propriedade(joao_santos, estado, 'RJ').
cidadao_propriedade(joao_santos, cidade, 'Rio de Janeiro').

cidadao_propriedade(ana_costa, idade, 28).
cidadao_propriedade(ana_costa, renda_familiar, 1200).
cidadao_propriedade(ana_costa, num_filhos, 1).
cidadao_propriedade(ana_costa, situacao_emprego, empregada).
cidadao_propriedade(ana_costa, tem_deficiencia, nao).
cidadao_propriedade(ana_costa, estado, 'MG').
cidadao_propriedade(ana_costa, cidade, 'Belo Horizonte').

cidadao_propriedade(pedro_oliveira, idade, 45).
cidadao_propriedade(pedro_oliveira, renda_familiar, 300).
cidadao_propriedade(pedro_oliveira, num_filhos, 3).
cidadao_propriedade(pedro_oliveira, situacao_emprego, desempregado).
cidadao_propriedade(pedro_oliveira, tem_deficiencia, sim).
cidadao_propriedade(pedro_oliveira, estado, 'BA').
cidadao_propriedade(pedro_oliveira, cidade, 'Salvador').

cidadao_propriedade(lucia_fernandes, idade, 72).
cidadao_propriedade(lucia_fernandes, renda_familiar, 300).
cidadao_propriedade(lucia_fernandes, num_filhos, 0).
cidadao_propriedade(lucia_fernandes, situacao_emprego, aposentada).
cidadao_propriedade(lucia_fernandes, tem_deficiencia, nao).
cidadao_propriedade(lucia_fernandes, estado, 'RS').
cidadao_propriedade(lucia_fernandes, cidade, 'Porto Alegre').

% ==================================================================
% MÓDULO 2: DEFINIÇÃO DOS BENEFÍCIOS
% ==================================================================

beneficio_definicao(bpc, [
    nome('Beneficio de Prestacao Continuada'),
    valor(1320),
    tipo(beneficio_assistencial),
    orgao_responsavel('INSS'),
    base_legal('Lei 8.742/1993'),
    descricao('Beneficio mensal para idosos e pessoas com deficiencia')
]).

beneficio_definicao(auxilio_brasil, [
    nome('Auxilio Brasil'),
    valor_minimo(400),
    valor_maximo(1000),
    tipo(auxilio_financeiro),
    orgao_responsavel('Ministerio da Cidadania'),
    base_legal('Lei 14.284/2021'),
    descricao('Programa de transferencia de renda')
]).

beneficio_definicao(vale_gas, [
    nome('Auxilio Gas dos Brasileiros'),
    valor(102),
    tipo(auxilio_financeiro),
    periodicidade(bimestral),
    orgao_responsavel('Ministerio da Cidadania'),
    base_legal('Lei 14.237/2021'),
    descricao('Auxilio para compra de gas de cozinha')
]).

beneficio_definicao(tarifa_social_energia, [
    nome('Tarifa Social de Energia Eletrica'),
    desconto_percentual(65),
    tipo(beneficio_social),
    orgao_responsavel('ANEEL'),
    base_legal('Lei 12.212/2010'),
    descricao('Desconto na conta de energia eletrica')
]).

beneficio_definicao(passe_livre, [
    nome('Passe Livre Interestadual'),
    tipo(servico_publico),
    orgao_responsavel('Ministerio dos Transportes'),
    base_legal('Lei 8.899/1994'),
    descricao('Gratuidade no transporte interestadual')
]).

beneficio_definicao(auxilio_creche, [
    nome('Auxílio Creche'),
    valor(200),
    tipo(servico_publico),
    orgao_responsavel('Prefeitura Municipal'),
    descricao('Auxilio para creche de filhos de baixa renda')
]).

% ==================================================================
% MÓDULO 3: PREDICADOS DE CLASSIFICAÇÃO
% ==================================================================

tem_propriedade(Cidadao, Propriedade, Valor) :-
    cidadao_propriedade(Cidadao, Propriedade, Valor).

eh_idoso(Cidadao) :-
    tem_propriedade(Cidadao, idade, Idade),
    Idade >= 65,
    instance_of(Cidadao, cidadao).

eh_pessoa_deficiencia(Cidadao) :-
    tem_propriedade(Cidadao, tem_deficiencia, sim),
    instance_of(Cidadao, cidadao).

eh_baixa_renda(Cidadao) :-
    tem_propriedade(Cidadao, renda_familiar, Renda),
    Renda =< 550.

eh_extrema_pobreza(Cidadao) :-
    tem_propriedade(Cidadao, renda_familiar, Renda),
    Renda =< 105.

tem_filhos_pequenos(Cidadao) :-
    tem_propriedade(Cidadao, num_filhos, NumFilhos),
    NumFilhos > 0.

esta_desempregado(Cidadao) :-
    tem_propriedade(Cidadao, situacao_emprego, desempregado).

% ==================================================================
% MÓDULO 4: REGRAS DE ELEGIBILIDADE
% ==================================================================

elegivel_bpc(Cidadao, Justificativa) :-
    instance_of(Cidadao, cidadao),
    (   (eh_idoso(Cidadao), 
         Tipo = 'BPC Idoso') 
    ;   (eh_pessoa_deficiencia(Cidadao), 
         Tipo = 'BPC Deficiencia')
    ),
    eh_baixa_renda(Cidadao),
    tem_propriedade(Cidadao, renda_familiar, Renda),
    Justificativa = [
        tipo(Tipo),
        criterio_renda_atendido(Renda =< 550),
        valor_mensal(1320),
        orgao('INSS')
    ].

elegivel_auxilio_brasil(Cidadao, Justificativa) :-
    instance_of(Cidadao, cidadao),
    tem_propriedade(Cidadao, renda_familiar, Renda),
    Renda =< 210,
    calcular_valor_auxilio_brasil(Cidadao, ValorFinal),
    Justificativa = [
        tipo('Auxilio Brasil'),
        renda_per_capita(Renda),
        valor_calculado(ValorFinal),
        orgao('Ministerio da Cidadania')
    ].

calcular_valor_auxilio_brasil(Cidadao, ValorFinal) :-
    tem_propriedade(Cidadao, num_filhos, NumFilhos),
    ValorBase = 400,
    ValorPorFilho = 142,
    ValorFamiliar is NumFilhos * ValorPorFilho,
    ValorFinal is ValorBase + ValorFamiliar.

elegivel_vale_gas(Cidadao, Justificativa) :-
    elegivel_auxilio_brasil(Cidadao, _),
    Justificativa = [
        tipo('Vale Gas'),
        vinculado_a('Auxilio Brasil'),
        valor_bimestral(102),
        periodicidade('A cada 2 meses')
    ].

elegivel_tarifa_social_energia(Cidadao, Justificativa) :-
    instance_of(Cidadao, cidadao),
    (   eh_baixa_renda(Cidadao)
    ;   elegivel_bpc(Cidadao, _)
    ),
    Justificativa = [
        tipo('Tarifa Social de Energia'),
        desconto('Ate 65%'),
        aplicacao('Conta de luz'),
        orgao('ANEEL')
    ].

elegivel_passe_livre(Cidadao, Justificativa) :-
    instance_of(Cidadao, cidadao),
    eh_pessoa_deficiencia(Cidadao),
    eh_baixa_renda(Cidadao),
    Justificativa = [
        tipo('Passe Livre Interestadual'),
        requisito('Pessoa com deficiencia + baixa renda'),
        beneficio('Transporte gratuito'),
        orgao('Ministerio dos Transportes')
    ].

elegivel_auxilio_creche(Cidadao, Justificativa) :-
    instance_of(Cidadao, cidadao),
    tem_filhos_pequenos(Cidadao),
    eh_baixa_renda(Cidadao),
    tem_propriedade(Cidadao, num_filhos, NumFilhos),
    ValorTotal is NumFilhos * 200,
    Justificativa = [
        tipo('Auxilio Creche'),
        num_filhos(NumFilhos),
        valor_total(ValorTotal),
        orgao('Prefeitura Municipal')
    ].

% ==================================================================
% MÓDULO 5: ANÁLISE COMPLETA
% ==================================================================

analisar_cidadao(Cidadao, ResultadoCompleto) :-
    instance_of(Cidadao, cidadao),
    findall(
        beneficio(Tipo, Detalhes),
        (   elegivel_bpc(Cidadao, Detalhes), Tipo = bpc
        ;   elegivel_auxilio_brasil(Cidadao, Detalhes), Tipo = auxilio_brasil
        ;   elegivel_vale_gas(Cidadao, Detalhes), Tipo = vale_gas
        ;   elegivel_tarifa_social_energia(Cidadao, Detalhes), Tipo = tarifa_social_energia
        ;   elegivel_passe_livre(Cidadao, Detalhes), Tipo = passe_livre
        ;   elegivel_auxilio_creche(Cidadao, Detalhes), Tipo = auxilio_creche
        ),
        BeneficiosElegiveis
    ),
    calcular_valor_total_beneficios(BeneficiosElegiveis, ValorTotalMensal),
    obter_perfil_cidadao(Cidadao, PerfilCompleto),
    ResultadoCompleto = [
        cidadao(Cidadao),
        perfil(PerfilCompleto),
        beneficios_elegiveis(BeneficiosElegiveis),
        valor_total_mensal(ValorTotalMensal),
        data_analise(2025)
    ].

analisar_cidadao_formatado(Cidadao) :-
    analisar_cidadao(Cidadao, Resultado),
    exibir_resultado_formatado(Cidadao, Resultado).

analisar_cidadaos :-
    findall(
        Cidadao,
        instance_of(Cidadao, cidadao),
        Cidadaos
    ),
    forall(
        member(C, Cidadaos),
        (
            analisar_cidadao(C, Resultado),
            exibir_resultado_formatado(C, Resultado)
        )
    ).

obter_perfil_cidadao(Cidadao, Perfil) :-
    tem_propriedade(Cidadao, idade, Idade),
    tem_propriedade(Cidadao, renda_familiar, Renda),
    tem_propriedade(Cidadao, num_filhos, Filhos),
    tem_propriedade(Cidadao, situacao_emprego, Emprego),
    tem_propriedade(Cidadao, tem_deficiencia, Deficiencia),
    tem_propriedade(Cidadao, estado, Estado),
    tem_propriedade(Cidadao, cidade, Cidade),
    
    (eh_idoso(Cidadao) -> ClassificacaoIdade = idoso ; ClassificacaoIdade = adulto),
    (eh_baixa_renda(Cidadao) -> ClassificacaoRenda = baixa_renda ; ClassificacaoRenda = renda_regular),
    
    Perfil = [
        idade(Idade),
        classificacao_idade(ClassificacaoIdade),
        renda_familiar(Renda),
        classificacao_renda(ClassificacaoRenda),
        num_filhos(Filhos),
        situacao_emprego(Emprego),
        tem_deficiencia(Deficiencia),
        localizacao(Estado-Cidade)
    ].

calcular_valor_total_beneficios([], 0).
calcular_valor_total_beneficios([beneficio(_, Detalhes)|Resto], ValorTotal) :-
    extrair_valor_beneficio(Detalhes, Valor),
    calcular_valor_total_beneficios(Resto, ValorResto),
    ValorTotal is Valor + ValorResto.

extrair_valor_beneficio(Detalhes, Valor) :-
    (   member(valor_mensal(V), Detalhes) -> Valor = V
    ;   member(valor_calculado(V), Detalhes) -> Valor = V
    ;   member(valor_total(V), Detalhes) -> Valor = V
    ;   Valor = 0
    ).

% ==================================================================
% MÓDULO 6: SISTEMA DE TESTES
% ==================================================================

executar_teste_completo :-
    write('=== SISTEMA DE BENEFICIOS SOCIAIS - TESTE COMPLETO ==='), nl, nl,
    
    write('TESTE 1: Analise Individual'), nl,
    write('----------------------------------------'), nl,
    analisar_cidadao(maria_silva, ResultadoMaria),
    exibir_resultado_formatado(maria_silva, ResultadoMaria),
    nl,
    
    write('TESTE 2: Verificacao de outros cidadaos'), nl,
    write('----------------------------------------'), nl,
    analisar_cidadao(pedro_oliveira, ResultadoPedro),
    exibir_resultado_formatado(pedro_oliveira, ResultadoPedro),
    nl,
    
    write('=== TESTES CONCLUIDOS ==='), nl.

exibir_resultado_formatado(Cidadao, Resultado) :-
    nl,
    write('===================================================='), nl,
    write('              ANALISE DO CIDADAO'), nl,
    write('===================================================='), nl,
    write('Nome: '), write(Cidadao), nl,
    member(perfil(Perfil), Resultado),
    member(idade(Idade), Perfil),
    member(classificacao_idade(ClassIdade), Perfil),
    member(renda_familiar(Renda), Perfil),
    member(classificacao_renda(ClassRenda), Perfil),
    member(num_filhos(Filhos), Perfil),
    member(situacao_emprego(Emprego), Perfil),
    member(tem_deficiencia(Def), Perfil),
    member(localizacao(Estado-Cidade), Perfil),

    write('Idade: '), write(Idade), write(' anos ('), write(ClassIdade), write(')'), nl,
    write('Renda Familiar: R$ '), write(Renda), write(' ('), write(ClassRenda), write(')'), nl,
    write('Numero de Filhos: '), write(Filhos), nl,
    write('Situacao de Emprego: '), write(Emprego), nl,
    write('Pessoa com Deficiencia: '), write(Def), nl,
    write('Localizacao: '), write(Cidade), write(' - '), write(Estado), nl,
    nl,
    
    write('----------------------------------------------------'), nl,
    write('          BENEFICIOS ELEGIVEIS'), nl,
    write('----------------------------------------------------'), nl,
    member(beneficios_elegiveis(Beneficios), Resultado),
    (Beneficios = [] ->
        write('Nenhum beneficio disponivel para este cidadao.'), nl
    ;
        exibir_beneficios(Beneficios)
    ),
    
    member(valor_total_mensal(ValorTotal), Resultado),
    write('----------------------------------------------------'), nl,
    write('Valor Total Mensal Estimado: R$ '), write(ValorTotal), nl,
    write('===================================================='), nl, nl.

exibir_beneficios([]).
exibir_beneficios([beneficio(Nome, Detalhes)|Resto]) :-
    write('* Beneficio: '), write(Nome), nl,
    forall(
        member(Item, Detalhes),
        (
            format('    - ~w~n', [Item])
        )
    ),
    nl,
    exibir_beneficios(Resto).

% ==================================================================
% PREDICADOS DE CONSULTA
% ==================================================================

listar_todos_cidadaos :-
    findall(C, instance_of(C, cidadao), Cidadaos),
    write('Cidadaos cadastrados: '), write(Cidadaos), nl.

consultar_beneficios_disponiveis :-
    write('Beneficios disponiveis: '), nl,
    forall(
        beneficio_definicao(_, Props),
        (
            member(nome(Nome), Props),
            write(' - '), write(Nome), nl
        )
    ).

% Menu de comandos disponíveis
menu :-
    write('=== COMANDOS DISPONIVEIS ==='), nl,
    write('1. analisar_cidadao(Cidadao, Resultado).'), nl,
    write('2. executar_teste_completo.'), nl,
    write('3. listar_todos_cidadaos.'), nl,
    write('4. consultar_beneficios_disponiveis.'), nl,
    write('5. menu.'), nl,
    nl.
