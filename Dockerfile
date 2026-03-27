FROM node:20.12.2

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3=3.11.2-1+b1 \
    make=4.3-4.1 \
    g++=4:12.2.0-3 \
    curl=7.88.1-10+deb12u14 \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production

COPY app/package*.json ./

RUN npm ci --omit=dev

COPY app/. .

EXPOSE 8080

CMD ["npm", "run", "start"]