<h1 align="center">UI Inventory</h1>
<p align="center">Sistema de Inventário por <strong>Daniel Mendes Neto</strong></p>

<br />
<br />

## Introdução
Este projeto apresenta o **Sistema de Inventário** de itens feito na linguagem GML como entrega para o Teste Técnico de Programador GameMaker para a empresa Creative Hand.

## Como baixar
Para acessar o projeto, pode-se optar por um dos seguintes métodos:
1. Baixar todo o código-fonte pelo GitHub através do botão `Code` > `Download ZIP`.
    - Ao baixar o arquivo Zip, extraia-o.
    - Abra o GameMaker e clique em `Open` (ou `Abrir` se seu GameMaker estiver em português.)
    - Selecione o arquivo `UI Invetory.yyp`.
2. Baixar o projeto exportado na página de Releases.
    - Baixe o arquivo com final `.yyz`
    - Abra o GameMaker e clique em `Import` (ou `Importar` se seu GameMaker estiver em português.)
    - Selecione o arquivo baixado.
    - Por fim, selecione o diretório do seu computador onde os arquivos do projeto serão extraídos.

*Nota: O projeto deve ser aberto no GameMaker em sua versão mais recente para que o teste do sistema de inventário funcione corretamente.*

## Controles
- Pressione a tecla `I` do teclado para abrir e fechar o inventário.
- Com o inventário aberto, passe o mouse sobre os slots com itens para exibir suas descrições.
- Clique no botão esquerdo do mouse sobre um dos slots com itens para usar o item.

## Estrutura do Sistema de Inventário
O Sistema de Inventário de itens é organizado em uma grade predefinida com um tamanho de 4 slots de largura e 3 slots de altura (estes podendo ser editáveis em `scrInventoryData` no projeto).

A estrutura de dados do Sistema de Inventário é organizada em um *constructor* chamado `InventoryManager` e é tratada como *singleton*. As funções de adicionar um item, remover um item, pegar um item, pegar largura e altura do inventário, e verificar se o inventário está cheio estão nele.

Para apresentar o sistema de inventário no jogo, é utilizado um objeto controlador chamado `objInventoryManager` onde as ações de exibir o visual da grade de itens da tela, descrição dos itens e as ações do mouse sobre eles estão nele.

## Extras do projeto
- Devido os assets disponíveis para este projeto serem pixel-arts e possuem tamanhos menores, foi preciso reduzir o tamanho da GUI do jogo para 320 pixels de largura e 180 pixels de altura para melhor apresentação dos gráficos dos assets na tela ao iniciar o teste.
- 3 novos sprites foram criados a partir dos assets disponíveis para melhor apresentação dos elementos visuais da tela: `sprBoxDark`, `sprBoxLight` e `sprBoxWhite`.
- Foi adicionada a fonte `Liberation Mono` para a apresentação dos textos das descrições dos itens.
- Foram utilizadas duas bibliotecas de terceiros no projeto: [Input](https://github.com/offalynne/input), para gerenciar controles no jogo e [Scribble](https://github.com/JujuAdams/scribble) para formatação e exibição avançada de textos.
