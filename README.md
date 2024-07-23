# Ambientes Docker para desenvolviemnto

Este é um projeto de exemplo que demonstra como configurar um ambiente Docker para uma aplicação TypeScript que pode ser executada em três ambientes diferentes: Desenvolvimento, Homologação e Produção.

## Estrutura do Projeto

```plaintext
docker-ambientes-dev/
├── src/
│   ├── index.ts
│   ├── request.ts
│   └── ...
├── dist/
├── Dockerfile
├── docker-compose.yml
├── tsconfig.json
├── package.json
├── .env.dev
├── .env.homolog
└── .env.prod
```

## Configuração

### Pré-requisitos

- Node 20+
- Docker
- Docker Compose

### Instalação

1. Clone o repositório:

    ```sh
    git clone https://github.com/seu-usuario/my-typescript-app.git
    cd my-typescript-app
    ```

2. Instale as dependências do projeto:

    ```sh
    npm install
    ```

## Comandos Docker

### Construir e Executar o Ambiente de Desenvolvimento

Para executar o ambiente de desenvolvimento, que utiliza `ts-node` para executar o código TypeScript diretamente:

```sh
docker-compose up --build app-dev
```

### Construir e Executar o Ambiente de Homologação

Para executar o ambiente de homologação, que utiliza os arquivos compilados na pasta `dist`:

```sh
NODE_ENV=homolog docker-compose up --build app-homolog
```

### Construir e Executar o Ambiente de Produção

Para executar o ambiente de produção, que também utiliza os arquivos compilados na pasta `dist`:

```sh
NODE_ENV=prod docker-compose up --build app-prod
```

## Scripts NPM

### Compilar o Código TypeScript

Para compilar o código TypeScript e gerar os arquivos na pasta `dist`:

```sh
npm run build
```

### Executar o Ambiente de Desenvolvimento

Para executar o ambiente de desenvolvimento usando `ts-node`:

```sh
npm run start:dev
```

### Executar o Ambiente de Homologação

Para executar o ambiente de homologação usando os arquivos compilados:

```sh
npm run start:homolog
```

### Executar o Ambiente de Produção

Para executar o ambiente de produção usando os arquivos compilados:

```sh
npm run start:prod
```

## Variáveis de Ambiente

O projeto utiliza arquivos `.env` para gerenciar as variáveis de ambiente. Certifique-se de criar os seguintes arquivos no diretório raiz do projeto:

### .env.dev

```env
NODE_ENV=dev
PORT=3000
# outras variáveis de ambiente para desenvolvimento
```

### .env.homolog

```env
NODE_ENV=homolog
PORT=3000
# outras variáveis de ambiente para homologação
```

### .env.prod

```env
NODE_ENV=prod
PORT=3000
# outras variáveis de ambiente para produção
```

## Contribuição

Sinta-se à vontade para abrir problemas (issues) e enviar pull requests. Para mudanças maiores, por favor, abra um problema primeiro para discutir o que você gostaria de mudar.

## Licença

Este projeto está licenciado sob a MIT License.
