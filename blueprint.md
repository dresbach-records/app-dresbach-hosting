# Blueprint: Dresbach Hosting App

## Visão Geral

Este documento descreve o plano e a arquitetura para a construção de um aplicativo móvel Flutter para a **Dresbach Hosting do Brasil**. O aplicativo irá espelhar a funcionalidade descrita no conceito de "Área do Cliente via WhatsApp", fornecendo uma experiência de usuário nativa para gerenciamento de serviços de hospedagem, contratação de planos, pagamentos e suporte.

## Arquitetura e Estilo

- **Linguagem:** Dart
- **Framework:** Flutter
- **Arquitetura:** Feature-first (organização por funcionalidade) com camadas de apresentação, domínio e dados.
- **Gerenciamento de Estado:** `provider` para gerenciar o estado do tema e da autenticação.
- **Navegação:** `go_router` para uma navegação declarativa e baseada em rotas.
- **Design:** Material 3, com um tema moderno, limpo e profissional, utilizando o pacote `google_fonts`.

## Plano de Implementação Atual

### Etapa 2: Tela de Login e Dashboard

O objetivo desta etapa é construir a interface de login e a tela principal do cliente (Dashboard), que ele verá após a autenticação.

1.  **Criar a Tela de Login Funcional (`login_screen.dart`):**
    *   Substituir o placeholder `LoginScreen`.
    *   Adicionar o pacote `mask_text_input_formatter` para formatar a entrada de CPF/CNPJ.
    *   Implementar um `StatefulWidget` com um `GlobalKey<FormState>`.
    *   Adicionar `TextFormField` para "CPF ou CNPJ" com a máscara de formatação dinâmica.
    *   Adicionar `TextFormField` para "Senha" com um `IconButton` para alternar a visibilidade.
    *   Adicionar um botão "ENTRAR" que valida o formulário e (por enquanto) simula o login.
    *   Incluir um link `TextButton` para "Esqueci minha senha".

2.  **Criar a Tela do Dashboard (`dashboard_screen.dart`):**
    *   Criar um novo arquivo para a tela do Dashboard.
    *   Esta tela servirá como o hub central do cliente, exibindo um resumo da conta.
    *   Utilizará um layout de `GridView` para apresentar as principais seções de forma visual e organizada:
        *   Serviços Ativos
        *   Domínios
        *   Tickets de Suporte
        *   Faturas
    *   Cada item no grid será um card interativo com um ícone e um título.

3.  **Atualizar a Navegação (`app_router.dart`):**
    *   Definir uma nova rota `/dashboard` para a `DashboardScreen`.
    *   Atualizar a lógica de login na `LoginScreen` para que, em um login bem-sucedido, o usuário seja redirecionado de `/login` para `/dashboard` usando `context.go('/dashboard')`.

