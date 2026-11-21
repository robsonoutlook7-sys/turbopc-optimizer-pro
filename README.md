# ⚡ TurboPC Pro v2.0 - Suite de Otimização e Manutenção do Windows

TurboPC Pro é uma suíte profissional de manutenção preventiva, aceleração do sistema e recuperação de espaço em disco para computadores e notebooks com Windows 10 e Windows 11.

---

## 🌟 Principais Recursos

- **Proteção Ativa:** Criação automática de Ponto de Restauração antes de qualquer alteração crítica.
- **Limpeza Profunda:** Remoção segura de arquivos temporários (`%TEMP%`, `C:\Windows\Temp`, relatórios de erro e despejos de memória).
- **Otimização de Navegadores:** Limpeza de caches pesados do Google Chrome, Microsoft Edge, Brave, Opera e Firefox mantendo histórico, senhas salvas e favoritos intactos.
- **Manutenção de Atualizações:** Limpeza do cache do Windows Update e consolidação de componentes obsoletos via DISM WinSxS.
- **Aceleração de SSD:** Envio de comando TRIM nativo para otimização dos blocos flash do armazenamento principal.
- **Duas Interfaces:** Painel de linha de comando com relatório antes/depois e aplicativo gráfico (GUI) em Modo Escuro.

---

## 📂 Estrutura do Projeto

```
turbopc-optimizer-pro/
├── TurboPC_Pro.bat                   # Menu central interativo
├── app/
│   └── TurboPC_GUI.ps1               # Interface gráfica em Dark Mode (PowerShell/WinForms)
├── scripts/
│   ├── TurboPC-Optimizer.bat         # Rotina de otimização completa em 9 etapas
│   ├── Criar_Ponto_Restauracao.bat   # Utilitário rápido de backup
│   └── Restaurar_Sistema.bat         # Acesso à Restauração do Windows
├── docs/
│   ├── MANUAL_DO_USUARIO.md          # Manual de instruções passo a passo
│   └── EBOOK_5_HABITOS_PC_RAPIDO.md  # Guia com boas práticas de uso
├── marketing/
│   ├── COPY_DE_VENDAS_LANDING_PAGE.md # Estrutura para páginas de produto
│   ├── ROTEIRO_VIDEOS_TIKTOK_REELS.md # Ideias de demonstração em vídeo
│   └── MENSAGENS_WHATSAPP_E_SUPORTE.md# Modelos de comunicação e suporte
├── legal/
│   └── TERMOS_DE_USO_E_AVISO_LEGAL.md # Termos de uso e diretrizes legais
└── build/
    └── Compilar_Para_EXE.ps1         # Instruções para empacotamento em executável
```

---

## 🚀 Como Executar

1. Abra a pasta do projeto.
2. Dê um duplo clique no arquivo `TurboPC_Pro.bat`.
3. Confirme a solicitação de permissão de Administrador do Windows.
4. Escolha a opção desejada no menu numérico.

---

## 🛡️ Segurança e Compatibilidade

- **Compatibilidade:** Windows 10 e Windows 11 (64-bit).
- **Integridade:** Utiliza exclusivamente utilitários nativos e comandos homologados do Windows.
- **Privacidade:** Documentos, imagens, planilhas e arquivos pessoais do usuário nunca são acessados ou modificados.

---

## 📄 Licença

Distribuído sob a Licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.