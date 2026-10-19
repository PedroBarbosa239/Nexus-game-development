# NEXUS — Guia de integração do protótipo

Este documento explica como incorporar o protótipo do NEXUS ao projeto principal no GameMaker, preservando os sistemas que já existem.

> **Versão do protótipo:** GameMaker LTS 2026.0.0.23  
> **Linguagem:** GML  
> **Plataforma-alvo:** Windows / PC  
> **Estado:** protótipo funcional; validar nomes de salas, dependências e conflitos antes da integração.

---

## 1. O que o protótipo contém

O protótipo implementa:

- Interface de computador inspirada no Windows XP, com papel de parede e barra de tarefas.
- Abertura e saída do modo computador.
- Janela do aplicativo NEXUS.
- Sete propostas, uma por dia de campanha.
- Recomendação da IA e justificativa para cada proposta.
- Dois documentos associados a cada proposta, com seleção e leitura.
- Rolagem vertical do texto dos documentos usando a rodinha do mouse.
- Registro de decisões de aprovar/negar.
- Relatório final com contagem e histórico de decisões.
- Reinício da campanha.

Os casos e documentos atuais são conteúdo inicial de protótipo e devem ser revisados antes de uma versão final.

## 2. Antes de integrar

1. Faça uma cópia/branch do projeto principal.
2. Abra o projeto do protótipo no GameMaker LTS 2026.0.0.23.
3. Identifique a sala inicial e a sala de menu do projeto principal.
4. Verifique se o projeto principal já possui controlador global, sistema de tempo, entrada para computador, efeitos de tela ou relatório final.
5. Evite importar objetos com nomes iguais aos existentes sem comparar seus eventos.
6. Importe os recursos do protótipo pelo Asset Browser ou pelo mecanismo de importação de recursos do GameMaker. Não copie apenas trechos de código: objetos, sprites, fontes, shaders e outras dependências visuais também podem ser necessários.

## 3. Recursos principais

Os nomes abaixo são os componentes identificados no protótipo. Ao integrar, confira os nomes reais no Asset Browser.

| Recurso | Responsabilidade |
|---|---|
| `obj_game_controller` | Inicializa a configuração da campanha e atualiza o tempo |
| `obj_nexus_computer` | Desenha a área de trabalho do computador |
| `obj_nexus` | Janela do NEXUS, propostas, decisões e documentos |
| `obj_end_report` | Tela do relatório final |
| `obj_crt_effect` | Efeito visual CRT |
| `scr_game_config()` | Inicializa as variáveis globais da campanha |
| `scr_game_time()` | Atualiza o horário do dia |
| `scr_end_day()` | Registra a progressão para o próximo dia e encerra a campanha no último |
| `scr_restart_campaign()` | Reinicia o estado da campanha |
| `scr_computer_enter()` | Entra no modo computador |
| `scr_computer_exit()` | Sai do modo computador |
| `scr_load_proposals()` | Carrega as propostas |
| `scr_get_current_proposal()` | Retorna a proposta do dia atual |
| `scr_load_documents()` | Carrega os documentos |

**Importante:** a tabela descreve as responsabilidades do protótipo. Antes de integrar, confira as dependências e o conteúdo completo dos eventos de cada recurso.

## 4. Estratégia recomendada: integrar por camadas

Não substitua de uma vez o controlador, as salas ou o sistema de entrada do jogo principal. Integre e teste cada camada separadamente.

### Etapa A — Importar os recursos

1. Importe os scripts de configuração, tempo, progressão, reinicialização, computador, propostas e documentos.
2. Importe `obj_nexus`, `obj_nexus_computer`, `obj_end_report` e `obj_crt_effect`.
3. Importe também os sprites, fontes, shaders, objetos auxiliares e demais recursos referenciados pelos eventos.
4. Resolva conflitos de nomes comparando o recurso do protótipo com o existente no projeto principal.
5. Compile antes de colocar os objetos em salas.

### Etapa B — Integrar a inicialização global

O protótipo chama `scr_game_config()` para inicializar o estado da campanha. O controlador `obj_game_controller` também chama `scr_game_time()` no Step.

Se o projeto principal já possui um controlador global:

- **Não crie automaticamente um segundo controlador.**
- Incorpore nele a inicialização e a atualização do NEXUS, ou defina claramente qual controlador será responsável por elas.
- Garanta que `scr_game_config()` seja executado antes de qualquer objeto acessar as variáveis globais do NEXUS.
- Evite executar a configuração a cada entrada em uma sala, pois isso pode reiniciar a campanha sem intenção.
- Confira se `scr_game_config()` chama `scr_load_proposals()` e `scr_load_documents()`.

Se o projeto não possui controlador equivalente, pode ser possível utilizar `obj_game_controller` do protótipo, após confirmar como ele é criado e se é persistente.

### Etapa C — Integrar as salas

1. Coloque o controlador apropriado na sala de inicialização, se o projeto realmente precisar dele.
2. Garanta que os objetos necessários para a interface do computador sejam criados na sala correta.
3. Localize a chamada `room_goto(rm_menu)` em `obj_end_report`.
4. Troque `rm_menu` pelo nome real da sala de menu do projeto principal, se for diferente.
5. Confirme também o destino de `scr_computer_exit()` e quaisquer outras chamadas `room_goto()` presentes nos scripts.
6. Evite adicionar instâncias duplicadas de controladores ou efeitos persistentes ao transitar entre salas.

Não presuma que os nomes das salas do protótipo existem no projeto principal: confira-os no Asset Browser.

## 5. Dados das propostas e documentos

### Propostas

`global.proposals` é carregado por `scr_load_proposals()`. Cada proposta possui os campos:

- `id`
- `day`
- `title`
- `area`
- `problem`
- `intervention`
- `ai_recommendation`
- `ai_reason`
- `documents`

`documents` contém os identificadores dos documentos associados àquela proposta.

### Documentos

`global.documents` é carregado por `scr_load_documents()`. Cada documento possui:

- `id`
- `title`
- `type`
- `content`

O script `scr_get_current_proposal()` procura a proposta cujo campo `day` corresponde a `global.campaign_day`.

Ao substituir os dados de exemplo, preserve a correspondência entre os IDs em `proposal.documents` e os IDs dos objetos em `global.documents`. Caso contrário, a lista poderá aparecer vazia ou não localizar o conteúdo.

## 6. Estado global usado pelo protótipo

O projeto usa, entre outras, estas variáveis globais:

| Variável | Uso |
|---|---|
| `global.computer_mode` | Indica se o modo computador está ativo |
| `global.pc_screen` | Identifica a tela/aplicativo atual |
| `global.pc_active` | Estado ativo do computador |
| `global.campaign_day` | Dia atual da campanha |
| `global.total_days` | Número de dias da campanha |
| `global.campaign_finished` | Indica se a campanha terminou |
| `global.day_active` | Indica se o dia está ativo |
| `global.day_elapsed` | Tempo transcorrido no dia |
| `global.game_minutes` | Horário atual em minutos |
| `global.proposals` | Lista de propostas |
| `global.documents` | Lista de documentos |
| `global.decision_history` | Histórico das decisões |
| `global.decisions_accepted` | Contagem de aprovações |
| `global.decisions_rejected` | Contagem de negativas |
| `global.report_open` | Controla a exibição do relatório final |

Essas variáveis devem ter um único fluxo de inicialização bem definido. Se o jogo principal já usa nomes globais semelhantes, avalie conflitos e renomeie de forma consistente.

## 7. Fluxo de decisão

Quando o jogador escolhe `APROVAR` ou `NEGAR`, `obj_nexus` registra um struct no array `global.decision_history`. O registro contém:

- `day`
- `time`
- `proposal_id`
- `proposal_title`
- `area`
- `ai_recommendation`
- `decision`

A recomendação da IA e a decisão do jogador são dados diferentes. Não os unifique: a possibilidade de contrariar a recomendação é importante para a proposta educativa do jogo.

Depois do registro, o protótipo chama `scr_end_day()`. No último dia, a campanha é marcada como concluída e o relatório final é aberto.

## 8. Sistema de documentos e rolagem

A janela de documentos é desenhada dentro de `obj_nexus` e controlada pela variável de instância `documents_open`.

Outras variáveis de instância:

- `selected_document_id`: ID do documento selecionado.
- `document_scroll`: deslocamento vertical do texto.

Os eventos **Mouse Wheel Up** e **Mouse Wheel Down** de `obj_nexus` atualizam `document_scroll` quando a janela está aberta e há um documento selecionado. Preserve esses eventos ao integrar a interface.

Limitação conhecida: a rolagem funciona, mas o limite máximo ainda não é calculado pela altura total do documento. Isso pode permitir rolar além do fim do texto.

## 9. Relatório final e reinício

`obj_end_report` exibe o resumo e o histórico da campanha. O botão de retorno chama `scr_restart_campaign()` e navega para a sala de menu configurada.

Antes de integrar:

1. Atualize o destino para a sala correta.
2. Verifique se a sala de menu espera variáveis ou objetos específicos.
3. Confirme que `scr_restart_campaign()` não apaga estado do jogo principal que deva ser preservado.
4. Teste se o reinício redefine o dia, o histórico, as contagens e o estado do computador.
5. Confira se o relatório só aparece após a conclusão da campanha.

O protótipo mantém o histórico durante a execução atual; não considere salvamento persistente em arquivo implementado sem verificar o restante do projeto.

## 10. Controles e conflitos possíveis

Os controles atuais incluem:

- `P`: entrar no computador.
- `ESC`: sair do computador.
- Clique do mouse: selecionar documentos e acionar botões.
- Rodinha do mouse: rolar o conteúdo de documentos.

Se o projeto principal já usa essas entradas, integre as condições para evitar que uma tecla ou clique acione dois sistemas ao mesmo tempo. Verifique também o cursor e a conversão de coordenadas para GUI.

## 11. Checklist de testes após a integração

Faça os testes na ordem abaixo:

1. O projeto compila sem erros.
2. A sala inicial abre normalmente.
3. O controlador não é criado em duplicidade.
4. O computador pode ser aberto e fechado.
5. A janela do NEXUS abre e pode ser minimizada/fechada conforme o protótipo.
6. A proposta exibida corresponde ao dia atual.
7. A recomendação e a justificativa são exibidas.
8. O botão **DOCUMENTOS** abre a sobreposição.
9. Os documentos listados pertencem à proposta atual.
10. Clicar em cada documento exibe o conteúdo correto.
11. A rodinha do mouse move o conteúdo sem afetar outros sistemas.
12. **VOLTAR** fecha a sobreposição.
13. Aprovar e negar registram a decisão correta.
14. O histórico guarda o ID, título, área, horário e decisão.
15. O dia avança após a decisão.
16. O sétimo dia abre o relatório final.
17. As contagens correspondem ao histórico.
18. O botão de retorno vai para a sala correta.
19. Reiniciar a campanha limpa as decisões anteriores.
20. O restante do jogo continua funcionando depois de abrir e fechar o NEXUS.

## 12. Limitações conhecidas do protótipo

- As sete propostas e os 14 documentos são conteúdo inicial de teste e precisam ser revisados.
- A rolagem não possui limite máximo calculado.
- O sistema registra decisões, mas consequências diferentes para cada decisão ainda não estão implementadas nesta estrutura descrita.
- O relatório resume decisões, mas não apresenta ainda uma análise narrativa das consequências.
- Não há confirmação de salvamento da campanha em arquivo para continuar posteriormente.
- Nomes de salas e compatibilidade com o projeto principal precisam ser verificados durante a integração.

## 13. Regra principal para a integração

**Preserve o que já funciona e integre por etapas.** Primeiro importe os recursos e compile; depois conecte a inicialização; em seguida integre as salas e controles; por último, teste o fluxo completo da campanha. Não substitua controladores, salas ou sistemas de entrada do jogo principal sem comparar suas responsabilidades com as do protótipo.

---

**Observação:** este README documenta o comportamento e os nomes de recursos descritos durante o desenvolvimento do protótipo. Antes de usá-lo como especificação definitiva, confira os eventos e scripts existentes no projeto GameMaker, pois a integração pode exigir adaptações conforme a estrutura real do projeto principal.
