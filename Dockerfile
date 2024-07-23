# Etapa 1: Construir a aplicação
FROM node:20 as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Etapa 2: Desenvolvimento
FROM node:20 as development

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Certifique-se de instalar as dependências de desenvolvimento
RUN npm install --only=development

CMD ["npm", "run", "start:dev"]

# Etapa 3: Produção e Homologação
FROM node:20 as production

WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./

RUN npm install --only=production

COPY .env* ./

CMD ["node", "dist/index.js"]
