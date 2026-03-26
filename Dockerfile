FROM node:20.12.2
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/. .
CMD ["make", "test"]