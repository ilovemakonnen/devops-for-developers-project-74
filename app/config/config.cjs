require('dotenv').config();

module.exports = {
  development: {
    dialect: 'sqlite',
    storage: './database.sqlite',
  },
  production: {
  dialect: 'postgres',
  host: process.env.DB_HOST || 'db',                // обязательно имя сервиса
  port: 5432,                // или process.env.DATABASE_PORT, если она = 5432
  database: process.env.DATABASE_NAME || 'blog',
  username: process.env.DATABASE_USERNAME || 'postgres',
  password: process.env.DATABASE_PASSWORD || 'password',
},
  test: {
    dialect: 'sqlite',
    storage: './database.test.sqlite',
  },
  // test: {
  //   dialect: 'postgres',
  //   database: process.env.DATABASE_NAME,
  //   username: process.env.DATABASE_USERNAME,
  //   password: process.env.DATABASE_PASSWORD,
  //   port: process.env.DATABASE_PORT,
  //   host: process.env.DATABASE_HOST,
  // },
};
