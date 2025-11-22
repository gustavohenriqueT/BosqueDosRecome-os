# 🌿 Bosque dos Recomeços

Bosque dos Recomeços é um protótipo de jogo desenvolvido em Godot Engine 4, ambientado em um bosque 2D com elementos naturais, movimentação de personagem e interações simples. O projeto serve como base para futuras mecânicas como coleta, plantio, NPCs, diálogos e missões.

---------------------------------------------------------------------

## 📘 Documentação (PI / GDD)

Acessar GDD do Projeto:
[Abrir GDD](PI_gdd.md)

---------------------------------------------------------------------

## 🕹️ Sobre o Projeto

O jogo apresenta um cenário inicial onde o jogador controla um personagem em um bosque.

O projeto atualmente possui:
- Movimento 2D com animações
- Tilemap personalizado
- Itens e elementos interativos
- Scripts modularizados
- Estrutura pronta para expansão

---------------------------------------------------------------------

## 📁 Estrutura do Repositório

Tipo | Arquivo / Pasta | Descrição
-----|-----------------|-----------
🧠 Script do personagem | lumi.gd | Controla movimento, animações e estados
🧩 Cena principal | principal.tscn | Cena inicial do jogo (root)
🌿 Cenário e objetos | cenario_grama.tscn, tomate/milho/morango/uva.gd | Tilemap e item básico interativo
🖼️ Assets | walk and idle.png, summer tilemap.png, Crop_Spritesheet.png | Sprites do personagem, cenário e itens
⚙️ Configuração | project.godot | Arquivo principal da Godot

---------------------------------------------------------------------

## ▶️ Como Executar

1. Instale a Godot Engine 4.x  
   https://godotengine.org/

2. Clone o repositório:
   git clone https://github.com/usuario/bosque-comecos.git

3. Abra a Godot e selecione o arquivo:
   Bosque Começos/project.godot

4. Clique em Play (▶) para executar.

---------------------------------------------------------------------

## 🎮 Controles

Ação | Tecla
-----|-------
Mover | W / A / S / D
Interagir | E
Menu / Voltar | ESC

---------------------------------------------------------------------

## 🧠 Scripts Principais

### lumi.gd
Responsável por:
- Movimento (vetores)
- Animações (idle/walk)
- Mudança de direção
- Detecção de interação
- Base para estados futuros (corrida, coleta, etc)

### tomate/miho/morango/uva.gd
Item básico com potencial para:
- Sistema de plantio
- Coleta
- Evolução por estágios

---------------------------------------------------------------------

## 🌿 Ambiente e Assets

Sprites utilizados:
- walk and idle.png — animação do personagem
- summer tilemap.png — tilemap do cenário
- Crop_Spritesheet.png — plantas e cultivo

---------------------------------------------------------------------

## 🚧 Status do Projeto

Em desenvolvimento (🟡)

Implementado:
- Ambiente inicial
- Animações básicas
- Scripts essenciais
- Inventário
- Plantio
- Missões
- Sons e partículas



---------------------------------------------------------------------

## 🧾 Licença

Adicione uma licença (MIT é recomendado).  
Se quiser, eu incorporo automaticamente.

