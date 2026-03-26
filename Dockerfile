FROM node:20.12.2

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production

COPY app/package*.json ./

RUN npm ci --omit=dev

COPY app/. .

EXPOSE 8080

CMD ["npm", "run", "start"]