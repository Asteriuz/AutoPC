<h1 align="center" id="autopc">
🖥️<br>AutoPC
</h1>

<div align="center">

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)
![Size](https://img.shields.io/github/repo-size/Asteriuz/AutoPC?style=for-the-badge&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjxzdmcKICAgd2lkdGg9IjI0IgogICBoZWlnaHQ9IjI0IgogICB2aWV3Qm94PSIwIDAgMjQgMjQiCiAgIHZlcnNpb249IjEuMSIKICAgaWQ9InN2ZzEyIgogICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCiAgIHhtbG5zOnN2Zz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxkZWZzCiAgICAgaWQ9ImRlZnMxNiIgLz4KICA8cGF0aAogICAgIGQ9Ik0gOCwxNCBIIDAgViAxMiBIIDguNjcyIFogTSAwLDI0IHYgLTggaCAyNCB2IDggeiBtIDIsLTIgaCAyMCB2IC00IGggLTIgdiAyIGggLTEgdiAtMiBoIC0yIHYgMyBoIC0xIHYgLTMgaCAtMiB2IDIgaCAtMSB2IC0yIGggLTIgdiAyIEggMTAgViAxOCBIIDggdiAzIEggNyBWIDE4IEggNSB2IDIgSCA0IFYgMTggSCAyIFogTSAxMS4zOTgsOS43NCAxMCwxNCAxNC4yMjcsMTIuNTY4IFogTSAyMS4xNzIsMCAyNCwyLjgyOCAxNS40MTMsMTEuMzgyIDEyLjU4NSw4LjU1NCBaIgogICAgIGlkPSJwYXRoMTAiCiAgICAgc3R5bGU9ImZpbGw6I2ZmZmZmZjtmaWxsLW9wYWNpdHk6MSIgLz4KPC9zdmc+Cg==&color=red)
![Language](https://img.shields.io/github/languages/top/Asteriuz/AutoPC?logo=AutoHotkey&logoColor=white&style=for-the-badge)

</div>

## 📋 Índice

- [Sobre](#sobre)
- [Funcionalidades](#funcionalidades)
- [Instalação](#instalacao)
- [Como Usar](#como-usar)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura do Projeto](#estrutura)
- [Atalhos](#atalhos)
- [Autor](#autores)

<h2 id="sobre">📖 Sobre</h2>

O **AutoPC** é um projeto desenvolvido para automatizar e facilitar o uso do seu PC, proporcionando uma experiência mais rápida e eficiente.

<h2 id="funcionalidades">🚀 Funcionalidades</h2>

- Atalhos personalizados para aplicativos e funções do sistema
- Menus contextuais para fácil acesso a programas e pastas
- Scripts para gerenciamento de áudio e exibição
- Automação de tarefas comuns no Windows

<h2 id="instalacao">🛠️ Instalação</h2>

1. Clone o repositório:
   ```sh
   git clone https://github.com/Asteriuz/AutoPC.git
   ```
2. Navegue até o diretório do projeto:
   ```sh
   cd AutoPC
   ```
3. Execute o script principal `AutoPC.ahk` utilizando o AutoHotkey v2.0

<h2 id="como-usar">💻 Como Usar</h2>

- Execute o script principal `AutoPC.ahk` utilizando o AutoHotkey v2.0.
- Utilize os atalhos definidos para acessar rapidamente as funcionalidades.
- Personalize os atalhos e menus contextuais de acordo com suas preferências.
- (Recomendado) Crie uma pasta shortcuts no diretório do projeto para armazenar os atalhos personalizados.

<h2 id="tecnologias-utilizadas">🛠️ Tecnologias Utilizadas</h2>

- [AutoHotkey](https://www.autohotkey.com/) - Para automação de tarefas no Windows
- [Python](https://www.python.org/) - Para scripts auxiliares
- [PowerShell](https://docs.microsoft.com/en-us/powershell/) - Para gerenciamento de áudio e exibição

<h2 id="estrutura">📁 Estrutura do Projeto</h2>

```bash
AutoPC
├─ lib                # Bibliotecas e scripts auxiliares
│  ├─ assets               # Recursos de mídia
│  │  ├─ icons
│  │  └─ logo
│  ├─ hotkeys              # Atalhos personalizados
│  │  ├─ apps
│  │  ├─ code
│  │  ├─ explorer
│  │  ├─ manager
│  │  └─ windows
│  └─ menu                 # Menus contextuais
│     ├─ adobe
│     ├─ display
│     ├─ explorer
│     ├─ project
│     └─ sound
├─ .gitignore         # Arquivos ignorados pelo Git
├─ AutoPC.ahk         # Script principal
└─ README.md          # Documentação do projeto
```

## ⌨️ Atalhos <a id="atalhos"></a>

### 📂 `lib/hotkeys/apps.ahk` - Explorer

| **Atalho**       | **Descrição**                   |
| ---------------- | ------------------------------- |
| `Win + B`        | Abrir Firefox                   |
| `Win + Ctrl + B` | Abrir Firefox (Modo Privado)    |
| `Win + Ctrl + D` | Abrir Discord                   |
| `Win + W`        | Abrir WhatsApp                  |
| `Win + Ctrl + W` | Alternar/Abrir Wallpaper Engine |
| `Win + Ctrl + C` | Abrir Calculadora               |

> **Observação:** Criar uma pasta shortcuts no diretório do projeto para armazenar os atalhos personalizados.

### 💻 `lib/hotkeys/code.ahk` - VsCode

| **Atalho**        | **Descrição**                                 |
| ----------------- | --------------------------------------------- |
| `Win + Shift + D` | Executar `terminal.py`                        |
| `Ctrl + Alt + .`  | Alternar posição do painel no VSCode          |
| `Ctrl + Alt + S`  | Alternar configuração de Auto-Save            |
| `Win + C`         | Abrir VSCode ou o diretório ativo no Explorer |

### 📁 `lib/hotkeys/explorer.ahk` - Windows Explorer

| **Atalho**                 | **Descrição**                         |
| -------------------------- | ------------------------------------- |
| `Backspace`                | Navegar para a pasta anterior         |
| `Win + H`                  | Alternar exibição de arquivos ocultos |
| `Win + E`                  | Abrir nova aba no Explorer            |
| `Win + D`                  | Abrir pasta Downloads                 |
| `Win + Ctrl + L`           | Abrir Lixeira                         |
| `Win + Ctrl + PrintScreen` | Abrir pasta Screenshots               |
| `Ctrl + Enter`             | Renomear item selecionado             |

### ⚙️ `lib/hotkeys/manager.ahk` - Gerenciamento do AutoPC

| **Atalho**           | **Descrição**                        |
| -------------------- | ------------------------------------ |
| `Win + Alt + H`      | Exibir teclas modificadoras do AHK   |
| `Scroll Lock`        | Alternar suspensão dos atalhos       |
| `Win + Insert`       | Abrir `AutoPC.ahk` no VSCode         |
| `Win + Alt + Insert` | Abrir diretório do projeto no VSCode |
| `Win + Shift + R`    | Reiniciar o script                   |
| `Win + Ctrl + R`     | Reiniciar em modo administrador      |
| `Win + Ctrl + G`     | Abrir repositório no GitHub          |

### 🖥️ `lib/hotkeys/windows.ahk` - Windows

| **Atalho**         | **Descrição**                        |
| ------------------ | ------------------------------------ |
| `Win + -`          | Diminuir volume                      |
| `Win + =`          | Aumentar volume                      |
| `Ctrl + Q`         | Fechar janela ativa                  |
| `Win + Shift + L`  | Desligar tela                        |
| `Win + Enter`      | Executar ações no Explorer           |
| `Win + Home`       | Abrir Gerenciador de Tarefas         |
| `Win + Alt + Home` | Abrir WindowSpy                      |
| `Win + L`          | Executar `night-light.py`            |
| `Win + N`          | Abrir configurações de luz noturna   |
| `Win + Alt + B`    | Abrir configurações de Bluetooth     |
| `Win + Alt + D`    | Abrir configurações de armazenamento |

### 📑 Menus Contextuais

#### 🎨 Adobe (`lib/menu/adobe.ahk`)

| **Atalho** | **Descrição**                    |
| ---------- | -------------------------------- |
| `Win + A`  | Exibir menu Adobe                |
| **Opções** | Photoshop, Illustrator, Premiere |

#### 🖥️ Exibição (`lib/menu/display.ahk`)

| **Atalho**      | **Descrição**           |
| --------------- | ----------------------- |
| `Win + Alt + M` | Exibir menu de exibição |
| **Opções**      | Monitores, TV, All      |

#### 📂 Explorer (`lib/menu/explorer.ahk`)

| **Atalho** | **Descrição**                     |
| ---------- | --------------------------------- |
| `Win + M`  | Exibir menu principal do Explorer |

#### 🚀 Projetos (`lib/menu/project.ahk`)

| **Atalho** | **Descrição**           |
| ---------- | ----------------------- |
| `Win + U`  | Exibir menu de projetos |

#### 🔊 Som (`lib/menu/sound.ahk`)

| **Atalho**      | **Descrição**      |
| --------------- | ------------------ |
| `Win + Alt + S` | Exibir menu de som |
| **Opções**      | Monitor, Fone, TV  |

## ✍️ Autor <a id="autores"></a>

<div align="center">

[![Asteriuz](https://avatars.githubusercontent.com/u/89879115?v=4&s=150)](https://github.com/Asteriuz)  
**[Asteriuz](https://github.com/Asteriuz)**

</div>

[⬆ Voltar ao topo](#autopc)<br>
