/// @function scr_load_proposals()
/// @description Cria a base inicial de propostas do NEXUS.

global.proposals = [
    {
        id: "PROP_001",
        day: 1,
        title: "Programa de Monitoramento Escolar",
        area: "EDUCACAO",

        problem: "A evasao escolar aumentou nos ultimos anos.",

        intervention:
            "Implementar um sistema automatizado para monitorar a frequencia dos estudantes.",

        ai_recommendation: "APROVAR",

        ai_reason:
            "A IA preve que a identificacao antecipada de ausencias permitira intervencoes mais rapidas.",

        documents: ["DOC_001", "DOC_002"]
    },

    {
        id: "PROP_002",
        day: 2,
        title: "Sistema Preditivo Hospitalar",
        area: "SAUDE",

        problem:
            "Hospitais enfrentam dificuldades para distribuir recursos e organizar o atendimento.",

        intervention:
            "Utilizar IA para prever a demanda hospitalar e recomendar a alocacao de recursos.",

        ai_recommendation: "NEGAR",

        ai_reason:
            "A IA identificou riscos relacionados a confiabilidade das previsoes e a distribuicao desigual de recursos.",

        documents: ["DOC_003", "DOC_004"]
    },

    {
        id: "PROP_003",
        day: 3,
        title: "Sistema de Vigilancia Urbana",
        area: "SEGURANCA PUBLICA",

        problem:
            "O governo busca reduzir o tempo de resposta a ocorrencias urbanas.",

        intervention:
            "Implementar um sistema automatizado de analise de imagens em espacos publicos.",

        ai_recommendation: "APROVAR",

        ai_reason:
            "A IA estima uma reducao no tempo de identificacao de ocorrencias, mas a medida envolve questoes de privacidade.",

        documents: ["DOC_005", "DOC_006"]
    },

    {
        id: "PROP_004",
        day: 4,
        title: "Programa de Distribuicao de Beneficios",
        area: "ASSISTENCIA SOCIAL",

        problem:
            "O governo identificou dificuldades na distribuicao de beneficios sociais.",

        intervention:
            "Utilizar um sistema automatizado para classificar solicitacoes e priorizar atendimentos.",

        ai_recommendation: "NEGAR",

        ai_reason:
            "A IA identificou risco de exclusao de pessoas cujos perfis nao correspondem aos padroes historicos.",

        documents: ["DOC_007", "DOC_008"]
    },

    {
        id: "PROP_005",
        day: 5,
        title: "Gestao Inteligente de Recursos Hidricos",
        area: "MEIO AMBIENTE",

        problem:
            "O consumo de agua apresenta variacoes significativas entre regioes.",

        intervention:
            "Adotar um sistema preditivo para recomendar a distribuicao de recursos hidricos.",

        ai_recommendation: "APROVAR",

        ai_reason:
            "A IA estima que a previsao de demanda pode melhorar o planejamento da distribuicao.",

        documents: ["DOC_009", "DOC_010"]
    },

    {
        id: "PROP_006",
        day: 6,
        title: "Otimizacao do Transporte Publico",
        area: "TRANSPORTE",

        problem:
            "A distribuicao de veiculos nao acompanha adequadamente a variacao da demanda.",

        intervention:
            "Utilizar IA para recomendar alteracoes nas frequencias e nos horarios das linhas.",

        ai_recommendation: "APROVAR",

        ai_reason:
            "A IA identificou oportunidades de reduzir o tempo de espera, mas as previsoes dependem da qualidade dos dados.",

        documents: ["DOC_011", "DOC_012"]
    },

    {
        id: "PROP_007",
        day: 7,
        title: "Sistema Nacional de Avaliacao Automatizada",
        area: "ADMINISTRACAO PUBLICA",

        problem:
            "O governo busca acelerar a analise de solicitacoes e a distribuicao de recursos.",

        intervention:
            "Ampliar o uso de sistemas de IA para recomendar decisoes administrativas.",

        ai_recommendation: "NEGAR",

        ai_reason:
            "A IA identificou riscos de concentracao decisoria e dependencia excessiva de recomendacoes automatizadas.",

        documents: ["DOC_013", "DOC_014"]
    }
];