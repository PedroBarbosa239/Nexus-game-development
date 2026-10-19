/// scr_load_documents()

global.documents = [
    // =====================================
    // DIA 1 - EDUCACAO
    // =====================================
    {
        id: "DOC_001",
        title: "Relatorio de Frequencia Escolar",
        type: "RELATORIO",
        content:
            "SECRETARIA DE EDUCACAO\n\n" +
            "ASSUNTO: Frequencia e evasao escolar\n\n" +
            "O levantamento administrativo identificou aumento " +
            "nas ausencias recorrentes em determinadas escolas.\n\n" +
            "A equipe tecnica considera que o acompanhamento " +
            "da frequencia pode ajudar a identificar estudantes " +
            "que necessitam de apoio.\n\n" +
            "Entretanto, a ausencia escolar nao indica, por si so, " +
            "desinteresse ou risco de evasao. Problemas de transporte, " +
            "saude e condicoes familiares tambem podem contribuir.\n\n" +
            "RECOMENDACAO:\n" +
            "Investigar as causas das ausencias antes de definir " +
            "medidas de intervencao."
    },
    {
        id: "DOC_002",
        title: "Parecer sobre Monitoramento",
        type: "PARECER",
        content:
            "ASSESSORIA DE PROTECAO DE DADOS\n\n" +
            "ASSUNTO: Monitoramento automatizado de estudantes\n\n" +
            "A proposta permite identificar padroes de ausencia " +
            "e encaminhar alertas para as equipes escolares.\n\n" +
            "A utilizacao de dados pessoais exige controles de acesso, " +
            "transparencia e limitacao da coleta ao necessario.\n\n" +
            "Alertas incorretos podem gerar estigmatizacao, " +
            "exposicao indevida ou intervencoes injustificadas.\n\n" +
            "QUESTOES PARA ANALISE:\n" +
            "Quem tera acesso aos alertas?\n" +
            "Como os erros serao corrigidos?\n" +
            "O estudante podera contestar uma classificacao?"
    },

    // =====================================
    // DIA 2 - SAUDE
    // =====================================
    {
        id: "DOC_003",
        title: "Relatorio de Demanda Hospitalar",
        type: "RELATORIO",
        content:
            "SECRETARIA DE SAUDE\n\n" +
            "ASSUNTO: Planejamento da capacidade hospitalar\n\n" +
            "As unidades de saude enfrentam variacoes na procura " +
            "por consultas, exames e atendimento de urgencia.\n\n" +
            "Uma ferramenta preditiva pode auxiliar no planejamento " +
            "de equipes, leitos e materiais.\n\n" +
            "A utilidade das previsoes depende da atualizacao " +
            "dos registros e da representatividade dos dados.\n\n" +
            "ALERTA:\n" +
            "A previsao deve apoiar o planejamento, sem substituir " +
            "a avaliacao dos profissionais de saude."
    },
    {
        id: "DOC_004",
        title: "Auditoria do Modelo Hospitalar",
        type: "AUDITORIA",
        content:
            "NUCLEO DE AVALIACAO TECNOLOGICA\n\n" +
            "ASSUNTO: Riscos do sistema preditivo\n\n" +
            "Dados incompletos ou historicamente enviesados podem " +
            "produzir previsoes menos confiaveis para determinados " +
            "grupos ou regioes.\n\n" +
            "Uma alocacao baseada exclusivamente nas previsoes " +
            "pode prejudicar unidades com registros historicos " +
            "insuficientes.\n\n" +
            "MEDIDAS SUGERIDAS:\n" +
            "Auditorias periodicas, revisao humana e acompanhamento " +
            "dos erros por unidade hospitalar."
    },

    // =====================================
    // DIA 3 - SEGURANCA PUBLICA
    // =====================================
    {
        id: "DOC_005",
        title: "Relatorio de Ocorrencias Urbanas",
        type: "RELATORIO",
        content:
            "CENTRO DE OPERACOES URBANAS\n\n" +
            "ASSUNTO: Tempo de resposta a ocorrencias\n\n" +
            "A administracao pretende utilizar ferramentas " +
            "automatizadas para identificar situacoes que " +
            "possam exigir atendimento.\n\n" +
            "O sistema pode ajudar a organizar alertas, mas " +
            "a qualidade da identificacao depende das imagens, " +
            "das condicoes ambientais e do contexto observado.\n\n" +
            "LIMITACAO:\n" +
            "Uma deteccao automatica nao comprova que uma infracao " +
            "ou situacao de risco realmente ocorreu."
    },
    {
        id: "DOC_006",
        title: "Parecer sobre Vigilancia Urbana",
        type: "PARECER",
        content:
            "COMISSAO DE DIREITOS DIGITAIS\n\n" +
            "ASSUNTO: Monitoramento de espacos publicos\n\n" +
            "A analise automatizada de imagens pode ampliar " +
            "a capacidade de monitoramento da administracao.\n\n" +
            "Por outro lado, a coleta e o armazenamento de imagens " +
            "podem afetar a privacidade da populacao.\n\n" +
            "QUESTOES PARA ANALISE:\n" +
            "Qual sera o prazo de armazenamento?\n" +
            "Quem podera consultar as imagens?\n" +
            "Como serao investigados erros e identificacoes injustas?"
    },

    // =====================================
    // DIA 4 - ASSISTENCIA SOCIAL
    // =====================================
    {
        id: "DOC_007",
        title: "Relatorio de Solicitacoes Sociais",
        type: "RELATORIO",
        content:
            "SECRETARIA DE ASSISTENCIA SOCIAL\n\n" +
            "ASSUNTO: Analise de solicitacoes de beneficios\n\n" +
            "O volume de solicitacoes exige organizacao " +
            "e priorizacao dos atendimentos.\n\n" +
            "Uma ferramenta automatizada pode auxiliar " +
            "na identificacao de casos que necessitam " +
            "de analise mais urgente.\n\n" +
            "A priorizacao precisa considerar as necessidades " +
            "reais das pessoas, e nao apenas a semelhanca " +
            "com casos registrados anteriormente."
    },
    {
        id: "DOC_008",
        title: "Auditoria de Exclusao Algoritmica",
        type: "AUDITORIA",
        content:
            "OBSERVATORIO DE POLITICAS SOCIAIS\n\n" +
            "ASSUNTO: Riscos na classificacao automatizada\n\n" +
            "Pessoas com historicos incompletos ou situacoes " +
            "pouco representadas nos dados podem receber " +
            "classificacoes inadequadas.\n\n" +
            "Uma pontuacao automatizada nao deve ser tratada " +
            "como prova definitiva de elegibilidade.\n\n" +
            "SALVAGUARDAS:\n" +
            "Permitir revisao humana, contestacao da decisao " +
            "e correcao de dados incorretos."
    },

    // =====================================
    // DIA 5 - MEIO AMBIENTE
    // =====================================
    {
        id: "DOC_009",
        title: "Relatorio de Consumo de Agua",
        type: "RELATORIO",
        content:
            "AGENCIA DE GESTAO HIDRICA\n\n" +
            "ASSUNTO: Variacao da demanda por agua\n\n" +
            "O planejamento da distribuicao depende de estimativas " +
            "de consumo, disponibilidade e necessidades regionais.\n\n" +
            "Um modelo preditivo pode ajudar a antecipar variacoes " +
            "e apoiar o planejamento operacional.\n\n" +
            "A qualidade das estimativas depende da atualizacao " +
            "dos registros e da consideracao de eventos excepcionais."
    },
    {
        id: "DOC_010",
        title: "Analise de Distribuicao Regional",
        type: "ANALISE",
        content:
            "COMISSAO DE PLANEJAMENTO AMBIENTAL\n\n" +
            "ASSUNTO: Equidade na distribuicao de agua\n\n" +
            "A distribuicao de recursos hidricos precisa considerar " +
            "a disponibilidade, a demanda e as necessidades " +
            "essenciais de cada regiao.\n\n" +
            "Uma previsao baseada apenas no consumo historico " +
            "pode reproduzir desigualdades existentes.\n\n" +
            "QUESTAO CENTRAL:\n" +
            "Como equilibrar eficiencia operacional, necessidades " +
            "essenciais e atendimento de regioes vulneraveis?"
    },

    // =====================================
    // DIA 6 - TRANSPORTE
    // =====================================
    {
        id: "DOC_011",
        title: "Relatorio de Demanda por Linha",
        type: "RELATORIO",
        content:
            "DEPARTAMENTO DE TRANSPORTE PUBLICO\n\n" +
            "ASSUNTO: Distribuicao da frota\n\n" +
            "A demanda por transporte varia conforme horarios, " +
            "regioes e dias da semana.\n\n" +
            "Um sistema preditivo pode auxiliar na avaliacao " +
            "da frequencia e da distribuicao dos veiculos.\n\n" +
            "As recomendacoes devem considerar lotacao, " +
            "acessibilidade, cobertura territorial e necessidades " +
            "dos passageiros."
    },
    {
        id: "DOC_012",
        title: "Avaliacao da Qualidade dos Dados",
        type: "AUDITORIA",
        content:
            "NUCLEO DE MOBILIDADE E DADOS\n\n" +
            "ASSUNTO: Confiabilidade das previsoes de transporte\n\n" +
            "Registros incompletos de passageiros, atrasos " +
            "ou alteracoes de itinerario podem comprometer " +
            "as estimativas do sistema.\n\n" +
            "Uma linha com poucos dados pode receber " +
            "recomendacoes menos confiaveis.\n\n" +
            "MEDIDAS SUGERIDAS:\n" +
            "Validar os dados, acompanhar os resultados " +
            "e permitir ajustes por equipes responsaveis."
    },

    // =====================================
    // DIA 7 - ADMINISTRACAO PUBLICA
    // =====================================
    {
        id: "DOC_013",
        title: "Relatorio de Eficiencia Administrativa",
        type: "RELATORIO",
        content:
            "SECRETARIA DE ADMINISTRACAO PUBLICA\n\n" +
            "ASSUNTO: Automatizacao de processos\n\n" +
            "A administracao pretende reduzir o tempo de analise " +
            "e organizar o encaminhamento de solicitacoes.\n\n" +
            "Sistemas automatizados podem auxiliar na triagem " +
            "e na identificacao de prioridades.\n\n" +
            "A rapidez do processamento, entretanto, nao garante " +
            "que uma decisao seja justa ou adequada."
    },
    {
        id: "DOC_014",
        title: "Parecer sobre Decisoes Automatizadas",
        type: "PARECER",
        content:
            "COMISSAO DE GOVERNANCA DIGITAL\n\n" +
            "ASSUNTO: Responsabilidade e supervisao humana\n\n" +
            "A ampliacao de sistemas de recomendacao pode " +
            "aumentar a dependencia de resultados automatizados.\n\n" +
            "Decisoes administrativas precisam ter justificativas " +
            "compreensiveis e permitir a identificacao " +
            "dos responsaveis por sua aprovacao.\n\n" +
            "QUESTOES PARA ANALISE:\n" +
            "Quem responde por uma decisao inadequada?\n" +
            "Como uma recomendacao pode ser contestada?\n" +
            "Que decisoes exigem avaliacao humana obrigatoria?"
    }
];