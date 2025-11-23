# Game Design Document
**Jogo:** O Bosque dos Recomeços
















**Participantes:** Equipe 9
















* **[Gustavo Henrique Tomaz da Silva]:** [22001161] [Scrum Master (SM)]
* **[Lucas de Oliveira Barreiro]:** [22000100]  [Product Owner (PO)]
* **[Fernando Pagliarini Furlanetto]:** [22000293] [Membro da equipe]
* **[Geovana Neuberger Sorg]:** [22001825] [Membro da equipe]
* **[Kayque Silva Zanelli]:** [24001664] [Membro da equipe]
* **[Diogo Daloca Alves]:** [24001784] [Membro da equipe]
























## 1. Visão Geral
O jogo descrito neste documento, com o título de "O Bosque dos Recomeços", é um jogo 2D de aventura e exploração, que será distribuído de forma gratuita (freeware), visando uma experiência completa e sem microtransações. Inspirado em *Stardew Valley* e *Gris*, o jogador controla Lummi, uma garota que acorda em um bosque outrora vibrante e cheio de vida. O objetivo é restaurar a vida e o bosque através da exploração, interação com animais e resolução de pequenos mistérios.
































A proposta de valor é proporcionar uma experiência relaxante, emocional e recompensadora. O jogo foca na sensação de progresso e no impacto das ações do jogador no mundo com a resolução de desafios e puzzles/quests, estimulando a curiosidade, a empatia e a conexão com a natureza, sem a pressão de combate ou falha.
































Para este jogo, o público-alvo são jogadores que apreciam jogos "aconchegantes" (*cozy games*), com foco em exploração e uma estética marcante, como fãs de *Stardew Valley*, *Spiritfarer* ou *Gris*. A faixa etária é ampla, indo de 09 a 40 anos.
































Será desenvolvido inicialmente para plataformas PC (Windows, Linux, Mac), com expansão futura para consoles (Nintendo Switch, PlayStation, Xbox), dado que sua jogabilidade simples se adapta bem a diferentes controles.
































## 2. Objetivos
O jogo é do gênero de aventura e puzzle, pois funciona através da exploração e do cumprimento de "jornadas" (missões). Como objetivo principal, o jogador deve **restaurar completamente o bosque**, retomando sua vida representada pela presença de animais de forma gradativa. Atingir esse objetivo é medido por métricas claras realizadas por missões como:
* Pescar lixos dos rios.
* Limpar clareiras.
* Plantar árvores, frutas e vegetais.
































O jogador conseguirá atingir os objetivos ao explorar o cenário, interagir com elementos e animais, e resolver as tarefas que eles propõem. Não há condição de "derrota" ou morte; o único obstáculo é a conclusão de puzzles para que a progressão seja feita.
































## 3. Referências e Inspirações
O jogo é inspirado em diversas obras que focam em emoção, exploração e estética:
* **Stardew Valley:** Pela perspectiva 2D, a interação com um ambiente e seus habitantes, e a sensação de construir/melhorar algo ao longo do tempo.
* **Gris:** Pelo uso da cor como mecânica central de progressão e como reflexo do estado emocional do mundo.
* **Okami / Flower:** Pela mecânica de "curar" e restaurar a vida e a beleza em um ambiente desolado.
































## 4. Narrativa e Contexto
### 4.1 Resumo
A história começa com a personagem principal, a Lummi, adormecendo em um bosque mágico e cheio de vida. Ao acordar, ela se depara com um silêncio opressor e um bosque totalmente sem vida. Os animais estão escondidos, apáticos ou tristes. A narrativa se desenvolve a partir da busca de Lummi para entender o que aconteceu e como ela pode trazer a vida de volta. Cada animal ajudado revela um fragmento da história, funcionando como peças de um quebra-cabeça emocional sobre perda e recuperação.




### 4.2 Animais Notáveis (NPCs)
O jogo contará com a presença de animais ao longo da história do jogo, sendo liberados novos animais a cada ambiente liberado/recuperado após a conclusão de puzzles/quests. Animais como borboletas, coelhos, sapos e algumas espécies diferentes de animais considerados "animais místicos" como cogumelos ficarão presentes no bosque dos recomeços ao decorrer do jogo, podendo alguns animais estarem transitando e outros presentes de forma estática no cenário/ambiente.




























## 5. Game Design
### 5.1 Mecânica
A mecânica central consiste em **explorar** o mapa, **interagir** com pontos de interesse e **completar jornadas** para restaurar a vida representada pela cor em uma área a cada puzzle concluído. A cada área restaurada, novas interações e caminhos são desbloqueados, criando um ciclo de exploração e recompensa.
































### 5.2 Dinâmica
O jogador explora o ambiente monocromático, encontra um "ponto de interesse" (um rio sujo, uma clareira desestruturada e falta de vida verde na área). Ao interagir, ele recebe um objetivo (uma "jornada"). Ao completar esse objetivo (ex: pescar o lixo do rio, reajustar a clareira e plantar novas plantas), uma "onda" de cor emana do ponto restaurado, revelando visualmente o progresso, abrindo novas áreas e apresentando novas jornadas.
































### 5.3 Estética
O jogo busca evocar sentimentos de:
* **Melancolia e Solidão:** Ao explorar o silencioso bosque inicialmente sem vida e presença de animais.
* **Esperança e Curiosidade:** Ao concretizar puzzles e liberar novos ambientes.
* **Satisfação e Maravilhamento:** A cada explosão de cor que restaura uma parte do bosque (mapa).
* **Conexão e Empatia:** Ao criar laços com o ambiente e sentir-se parte da cura daquele ecossistema.
































### 5.4 Regras do Jogo
* O jogador não pode "morrer" ou "perder". O desafio é puramente exploratório e de resolução de puzzles.
* Certas ações só se tornam acessíveis após outras serem executadas (ex: só poderá fazer plantio no bosque se sair na busca por sementes e capturá-las).
* A progressão é desbloqueada através da conclusão de puzzles, não por sistemas de habilidade ou combate.
































### 5.5 Controles e Personagem
#### 5.5.1 Esquema de Controles
Mapeamento de botões: WASD para andar, "E" para interagir, etc.




#### 5.5.2 Estados do Personagem
Lista de ações: Parado, andando, pescando, plantando, interagindo.




#### 5.5.3 Câmera
O jogo apresenta uma câmera Top-Down 2D, que segue o jogador em cada ação que for executada.
































### 5.6 Sistemas Detalhados
#### 5.6.1 Sistema de Jornadas (Quests)
A jornada até as quests (chamadas anteriormente de puzzles) começam assim que a personagem Lummi sai de sua casa, tendo a intuição do jogador ativada para chegar até a quest através de caminhos de pedras que o direcionam da casa até o puzzle.




#### 5.6.2 Sistema de Inventário e Depósito
O jogador terá um inventário/depósito presente na casa do personagem Lummi, no qual poderão ser armazenados equipamentos, sementes, etc.. Tendo a possibilidade de armazenar infinitamente, pois não há restrição de quantidade.




#### 5.6.3 Definição de Puzzles e Mini-games:
O jogo apresenta puzzles/quests que buscam interagir com o jogador através de entretê-lo com atividades satisfatórias como: plantar, fazer a colheita de sementes, fazer a pesca de lixos nos rios, etc.




























## 6. Level Design
A progressão do jogo será baseada na exploração orgânica do mapa, com a complexidade das jornadas aumentando gradualmente para manter o jogador engajado e proporcionar uma curva de aprendizado suave.
































### 6.1 Estrutura de Níveis (Zonas)
O mapa é um único "nível" interconectado, dividido em zonas temáticas.
































- **Zonas Iniciais (Tutorial / Fácil):**
    - Jornadas simples (ex: "Encontre uma área a ser restaurada").
    - Poucos passos para resolver cada jornada.
    - Serve para introduzir a mecânica central de restauração.
































- **Zonas Intermediárias:**
    - Jornadas que exigem mais exploração (ex: "Encontre e capture sementes", "Faça o plantio", "Pesque o lixo no rio e limpe a clareira").
    - Introdução de pequenas cadeias de missões (fazer a captura de sementes disponibiliza a opção de poder plantá-las).
    - Requer que o jogador se lembre de locais já visitados.
































- **Zonas Avançadas:**
    - Jornadas complexas que envolvem múltiplos puzzles resolvidos.
    - Puzzles ambientais parecidos com os presentes na zona intermediária, porém agora com puzzles mais longos e recompensadores.
    - Requer a aplicação de todas as interações aprendidas para resolver a causa central da desolação.
































### 6.2 Mecânica de Progressão
- **Restauração do Mundo:** A progressão principal é visual. O jogador progride ao ver o mundo se transformar. A porcentagem de restauração, conhecidos como **Pontos de Áurea** é a principal métrica de avanço.
- **Desbloqueios:**
    - **Novas Zonas:** Completar jornadas em uma área libera o acesso à próxima.
    - **Novas Interações:** Completar certos puzzles podem liberar novas interações (ex: a habilidade de capturar sementes e depois armazená-las no depósito dentro da casa, local que no decorrer da história do jogo o jogador também terá acesso).
































### 6.3 Curva de Dificuldade
- **Crescente, mas equilibrada:** A complexidade se deve ao aumento dos requisitos básicos em cada puzzle, deixando mais desafiador a ansiedade de liberar a nova área o quanto antes.
- **Aprendizado contínuo:** O jogador é induzido a procurar atalhos de resolução de tarefas para concluir os puzzles mais longos.
- **Rejogabilidade:** Focada em encontrar todos os segredos e colecionáveis espalhados pelo cenário, e em completar 100% da restauração do bosque.
































## 7. Interface e Experiência do Usuário (UI/UX)
A interface será minimalista e integrada ao mundo do jogo para maximizar a imersão e a beleza visual.
































### 7.1 Layout Geral
- **Tela Inicial:** Nome do jogo com ícones e gifs de animais passando sobre a tela e com o botão de "Iniciar Jogo", tendo forte influência do jogo **Stardew Valley**.
- **Tela de Jogo:**
    - **HUD Mínimo:** Sem barras de vida ou energia. Apenas um discreto indicador de progresso (ex: barra indicando os Pontos de Áurea) e uma hotbar para acessar o inventário podem aparecer quando necessário.
    - **Caixas de Diálogo:** Simples e elegantes, aparecendo acima da cabeça dos personagens, no formato de balão.
































### 7.2 Experiência do Usuário (UX)
- **Feedback Visual:** O feedback mais importante é a "explosão de cor" ao restaurar uma área. Partículas brilhantes ou um leve brilho podem indicar objetos.
- **Navegação Simples:** Controles intuitivos (andar e um botão de ação) para garantir que o foco esteja na exploração e na história.
































### 7.3 Coerência Estética
- **Estilo de Arte Unificado:** Um estilo 2D minimalista e com cores suaves será mantido em todos os elementos: cenários, personagens e interface.
- **Interface Integrada:** Os menus e ícones contém elementos do próprio jogo em vez de caixas genéricas, mantendo a imersão.
































## 8. Sistema de Recompensas
O sistema de recompensas foca na motivação recompensadora, reforçando a sensação de realização e descoberta.
































### 8.1 Recompensas de Curto Prazo e a Médio Prazo
- A satisfação imediata de ver uma área ganhar cor e vida.
- Desbloqueio de uma nova zona do mapa para explorar.
- Após a pesca de lixos nos rios, eles estarão limpos.
- Após a limpeza das lareiras, elas estarão utilizáveis.
































### 8.2 Recompensas de Longo Prazo
- Completar a restauração do bosque (100%).
- Encontrar e resgatar todos os colecionáveis escondidos.
































## 9. Arte e Áudio
### 9.1 Arte
- **Estilo Visual:** 2D simples com uma forte presença de cores vivas e vibrantes. A arte deve transmitir emoção e atmosfera à uma natureza que está sendo restaurada.
- **Personagens:** Designs simples, cativantes e expressivos para Lummi e os animais do bosque. As ações, comandos e animações são simples para possibilitar o maior alcance de público-alvo possível.
- **Ambientes:** Simples em detalhes, para instigar a curiosidade. Cada zona terá seu puzzle e sua conclusão terá como forma de recompensa sua restauração.
































### 9.2 Áudio
- **Trilha Sonora:** A música é, em sua essência, simples e calma, alinhada com a estética "aconchegante", servindo como um guia emocional com o objetivo de remeter a sensação de esperança no jogador, apresentando também uma paisagem sonora representado pelos sons dos animais, da natureza, da água e do ambiente em geral.
- **Efeitos Sonoros:** Foco em sons da natureza de alta qualidade: passos na grama, água corrente, cantos de pássaros específicos de cada zona. A ausência e o retorno desses sons são uma mecânica central.




























## 10. Tecnologia e Desenvolvimento
### 10.1 Plataforma de Desenvolvimento
- **Engine:** **Godot Engine 4.3**
- **Linguagem:** **GDScript**
- **Plataformas Iniciais:** PC (Windows, Linux, Mac).
- **Plataformas Futuras:** Console.
































### 10.2 Ferramentas
- **Engine:** Godot 4.3.
- **Arte:** Krita, Aseprite, Photoshop (para sprites, tilesets e cenários).
- **Controle de Versão:** GitHub.
































### 10.3 Estrutura Técnica
- **Sistema de Cenas:** Arquitetura modular usando cenas `.tscn` para cada área, personagem e objeto interativo, facilitando a manutenção.
- **Lógica de Programação:**
    - **Scripts Modulares:** Scripts `.gd` individuais para cada elemento (personagem, animal, objeto).
    - **Movimentação:** Baseada em input de teclado/controle.
    - **Animações:** Controladas por `AnimationPlayer` e *spritesheets*.
    - **Interação:** Detecção de colisão via `Area2D` e uso de sinais (signals) para comunicação entre os nós.












## 11. Matemática
- **Teoria de Conjuntos:** No inventário do jogo, cada ítem que o jogador possui é representado por um conjunto, apresentando cada conjunto único e exclusivamente do player, sendo basicamente uma lista de elementos sem repetições e ordem específicas. Sendo assim, utilizamos a operação de conjuntos de `diferença()`, responsável por gerenciar os ítens do inventário: "o player usa o ítem e este mesmo é subtraído de seu inventário".
- **Lógica de Grafos:** Pensando por meio dessa lógica, seguindo os parâmetros de vértices e arestas, onde os vértices representam as missões e as arestas os caminhos a serem seguidos, foi utilizado o algoritmo de BFS (busca em largura), que é usado em todas as tasks que necessitam serem feitas antes de uma missão principal (ex: pegar sementes antes da plantação).














## 12. Produção (papéis e cronograma macro)
### 12.1 Papéis na Equipe
- **Game Designer:** Responsável pelo design geral, narrativa e mecânicas.
- **Programador(a):** Responsável pela lógica de jogo, estrutura de cenas e implementação em GDScript.
- **Artista Visual:** Criação de personagens, cenários e interface.
- **QA/Tester:** Responsável por testes de jogabilidade, bugs e equilíbrio.
































### 12.2 Cronograma Macro (estimativa)
- **Mês 1: Pré-produção (Protótipo):** Desenvolver a primeira zona (Prado Inicial) com as mecânicas centrais para validar o conceito.
- **Mês 2: Produção:** Desenvolvimento de todos os assets (arte, som) e implementação de todas as zonas e jornadas.
- **Mês 3: Pós-produção (Polimento):** Correção de bugs, balanceamento, melhorias de UX e testes extensivos.
































### 12.3 Escopo do MVP (Produto Mínimo Viável)
O MVP inclui a jornada principal completa, 3 zonas principais (inicial, intermediária e avançada), contendo mais de 3 animais-chave e todas as mecânicas centrais de restauração.










