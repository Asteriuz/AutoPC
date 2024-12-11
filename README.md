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

### 📂 `lib/hotkeys/apps.ahk` - Abrir Aplicativos

| **🎯 Atalho**    | **📝 Descrição**          |
| ---------------- | ------------------------- |
| `Win + B`        | 🦊 Firefox                |
| `Win + Ctrl + B` | 🕶️ Firefox (Modo Privado) |
| `Win + Ctrl + D` | 💬 Discord                |
| `Win + W`        | 📱 WhatsApp               |
| `Win + T`        | 🔄 qBittorrent            |
| `Win + Ctrl + W` | 🎨 Wallpaper Engine       |
| `Win + Ctrl + C` | 🧮 Calculadora            |

> **📂 Observação:** Criar uma pasta `shortcuts` no diretório do projeto para armazenar os atalhos personalizados.

### 💻 `lib/hotkeys/code.ahk` - VsCode

| **🎯 Atalho**     | **📝 Descrição**                                 |
| ----------------- | ------------------------------------------------ |
| `Win + Shift + D` | 🛠️ Executar `terminal.py`                        |
| `Ctrl + Alt + .`  | ↔️ Alternar posição do painel no VSCode          |
| `Ctrl + Alt + S`  | 💾 Alternar configuração de Auto-Save            |
| `Win + C`         | 🖥️ Abrir VSCode ou o diretório ativo no Explorer |

### 📁 `lib/hotkeys/explorer.ahk` - Windows Explorer

| **🎯 Atalho**              | **📝 Descrição**                         |
| -------------------------- | ---------------------------------------- |
| `Backspace`                | ↩️ Navegar para a pasta anterior         |
| `Win + H`                  | 👀 Alternar exibição de arquivos ocultos |
| `Win + E`                  | 📂 Abrir Explorador de Arquivos          |
| `Win + D`                  | 📥 Abrir Downloads                       |
| `Win + Ctrl + V`           | 🎥 Abrir Vídeos                          |
| `Win + Ctrl + L`           | 🗑️ Abrir Lixeira                         |
| `Win + Ctrl + PrintScreen` | 📸 Abrir Screenshots                     |
| `Ctrl + Enter`             | ✏️ Renomear item selecionado             |

### ⚙️ `lib/hotkeys/manager.ahk` - Gerenciamento do AutoPC

| **🎯 Atalho**        | **📝 Descrição**                        |
| -------------------- | --------------------------------------- |
| `Win` + `Alt` + `H`  | 🔧 Teclas modificadoras do AHK          |
| `Scroll Lock`        | ⏸️ Alternar suspensão dos atalhos       |
| `Win + Insert`       | 🔓 Abrir `AutoPC.ahk` no VSCode         |
| `Win + Alt + Insert` | 📂 Abrir diretório do projeto no VSCode |
| `Win + Shift + R`    | 🔄 Reiniciar o script                   |
| `Win + Ctrl + R`     | 🛡️ Reiniciar em modo administrador      |
| `Win + Ctrl + G`     | 🌐 Abrir repositório no GitHub          |

### 🖥️ `lib/hotkeys/windows.ahk` - Windows

| **🎯 Atalho**       | **📝 Descrição**                  |
| ------------------- | --------------------------------- |
| `Win + -`           | 🔉 Diminuir volume                |
| `Win + =`           | 🔊 Aumentar volume                |
| `Win + BackSpace`   | 🔇 Mudo                           |
| `Ctrl + Q`          | ❌ Fechar janela ativa            |
| `Win + Shift + L`   | 📴 Desligar tela                  |
| `Win + Shift + Q`   | 📌 Travar cursor ao monitor       |
| `Win + Enter`       | 🖥️ Abrir o Terminal               |
| `Win + Alt + Enter` | 🛡️ Abrir o Terminal como Admin    |
| `Win + Home`        | 📋 Abrir Gerenciador de Tarefas   |
| `Win + Alt + Home`  | 🔍 Abrir Window Spy               |
| `Win + L`           | 🌙 Alternar modo noturno          |
| `Win + Alt + L`     | 🔆 Configurações de luz noturna   |
| `Win + Alt + B`     | 🔵 Configurações de Bluetooth     |
| `Win + Alt + D`     | 💾 Configurações de armazenamento |

#### Personalize os Atalhos!

Os atalhos podem ser ajustados diretamente nos arquivos `.ahk` localizados em `lib/hotkeys/`. Adicione, remova ou modifique atalhos e funções de acordo com suas preferências.

## 📑 Menus Contextuais <a id="menus"></a>

### 🎨 **Adobe** (`lib/menu/adobe.ahk`)

| **Atalho** | **Descrição**     | **Opções**                       |
| ---------- | ----------------- | -------------------------------- |
| `Win + A`  | Exibir menu Adobe | Photoshop, Illustrator, Premiere |

### 🖥️ **Exibição** (`lib/menu/display.ahk`)

| **Atalho** | **Descrição**           | **Opções**       |
| ---------- | ----------------------- | ---------------- |
| `Win + M`  | Exibir menu de exibição | Monitor, TV, All |

### 📂 **Explorer** (`lib/menu/explorer.ahk`)

| **Atalho**        | **Descrição**                     | **Path**          |
| ----------------- | --------------------------------- | ----------------- |
| `Win + Shift + E` | Exibir menu principal do Explorer | `C:\Users\<user>` |

### 🚀 **Projetos** (`lib/menu/project.ahk`)

| **Atalho** | **Descrição**           |
| ---------- | ----------------------- |
| `Win + U`  | Exibir menu de projetos |

### 🔊 **Som** (`lib/menu/sound.ahk`)

| **Atalho** | **Descrição**      | **Opções**        |
| ---------- | ------------------ | ----------------- |
| `Win + S`  | Exibir menu de som | Monitor, Fone, TV |

#### Personalize os Menus!

Os menus podem ser ajustados diretamente nos arquivos `.ahk` localizados em `lib/menu/`. Adicione, remova ou modifique atalhos e funções de acordo com suas preferências.

## ✍️ Autor <a id="autores"></a>

<div align="center">

[![Asteriuz](https://avatars.githubusercontent.com/u/89879115?v=4&s=150)](https://github.com/Asteriuz)  
**[Asteriuz](https://github.com/Asteriuz)**

</div>

[⬆ Voltar ao topo](#autopc)<br>
