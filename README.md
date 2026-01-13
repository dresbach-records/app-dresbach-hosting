# Dresbach Hosting do Brasil — Web App

Aplicação web oficial da **Dresbach Hosting do Brasil** para **painel do cliente** e **administração interna**, consumindo a API do backend responsável por automação de vendas, pagamentos e provisionamento de serviços de hosting.

Este projeto é **independente do backend**, seguindo boas práticas de separação de responsabilidades, segurança e escalabilidade.

---

## 📌 Visão Geral

O **App Dresbach Hosting** é responsável por:

- Painel do cliente (self-service)
- Visualização de serviços contratados
- Acesso ao painel de hosting
- Faturas, pagamentos e histórico
- Área administrativa (interna)
- Integração direta com a API backend

O backend (bot / API) é mantido em um repositório separado.

---

## 🧱 Arquitetura

[ Web App (Frontend) ]
|
| HTTP / JSON
v
[ Backend API (Go) ]
|
+-- MongoDB
+-- Stripe
+-- WHM / cPanel
+-- WhatsApp Bot

yaml
Copiar código

### Separação de responsabilidades
- **Frontend (este repositório)**: interface, experiência do usuário
- **Backend**: regras de negócio, pagamentos, provisionamento e automações

---

## 🛠️ Stack Tecnológica (planejada)

- **Framework**: Next.js (React)
- **Linguagem**: TypeScript
- **Estilização**: Tailwind CSS
- **Gerenciamento de estado**: React Context / Zustand
- **Autenticação**: JWT (via API)
- **Consumo de API**: REST
- **Build & Deploy**: Node.js + CI/CD

> A stack pode ser ajustada conforme evolução do projeto.

---

## 🔐 Autenticação & Segurança

- Autenticação baseada em **JWT**
- Tokens armazenados de forma segura
- Comunicação HTTPS obrigatória
- Controle de permissões por perfil:
  - Cliente
  - Administrador
  - Suporte

---

## 📂 Estrutura do Projeto (prevista)

app-dresbach-hosting/
├── src/
│ ├── app/ # Rotas e páginas
│ ├── components/ # Componentes reutilizáveis
│ ├── services/ # Integração com API
│ ├── hooks/ # Hooks customizados
│ ├── styles/ # Estilos globais
│ └── utils/ # Funções utilitárias
├── public/
├── .env.example
├── package.json
└── README.md

yaml
Copiar código

---

## 🔄 Integração com o Backend

Este app consome a API do projeto:

bot-dresbach-hosting

markdown
Copiar código

Principais endpoints esperados:
- `/auth/login`
- `/client/services`
- `/client/invoices`
- `/client/payments`
- `/admin/*`

---

## ⚙️ Variáveis de Ambiente (exemplo)

Arquivo `.env.example`:

NEXT_PUBLIC_API_BASE_URL=https://api.dresbachhosting.com.br
NEXT_PUBLIC_APP_NAME=Dresbach Hosting

yaml
Copiar código

---

## 🚀 Fluxos Principais

### Cliente
- Login
- Visualiza serviços ativos
- Acessa painel de hosting
- Consulta faturas e pagamentos
- Atualiza dados cadastrais

### Administrador
- Visualiza clientes
- Consulta pedidos
- Acompanha provisionamentos
- Suporte operacional

---

## 📦 Status do Projeto

🚧 **Em desenvolvimento**  
Este repositório está em fase inicial de estruturação.

---

## 📄 Licença

Projeto proprietário.  
Uso restrito à **Dresbach Hosting do Brasil**.

---

## 📞 Contato

Dresbach Hosting do Brasil  
Suporte técnico e desenvolvimento interno.

---