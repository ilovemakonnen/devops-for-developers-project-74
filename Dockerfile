FROM node:20.12.2

WORKDIR /app

# Зависимости для сборки нативных модулей (иногда нужны)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем переменные среды до npm ci
ENV NODE_ENV=production

# Копируем только package.json и package-lock.json
COPY app/package*.json ./

# Устанавливаем только production зависимости
RUN npm ci --omit=dev

# Копируем все исходники
COPY app/. .

# Открываем порт
EXPOSE 8080

# Запуск приложения
CMD ["npm", "run", "start"]