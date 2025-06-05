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
cidadao_propriedade(joao_santos, renda_familiar, 800).
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
