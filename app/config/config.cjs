require('dotenv').config();

module.exports = {
  development: {
    dialect: 'postgres',
    host: process.env.DATABASE_HOST || 'db',
    port: 5432,
    database: process.env.DATABASE_NAME || 'blog',
    username: process.env.DATABASE_USERNAME || 'postgres',
    password: process.env.DATABASE_PASSWORD || 'password',
  },

  test: {
    dialect: 'postgres',
    host: process.env.DATABASE_HOST || 'db',
    port: 5432,
    database: process.env.DATABASE_NAME || 'blog',
    username: process.env.DATABASE_USERNAME || 'postgres',
    password: process.env.DATABASE_PASSWORD || 'password',
  },

  production: {
    dialect: 'postgres',
    host: process.env.DATABASE_HOST || 'db',
    port: 5432,
    database: process.env.DATABASE_NAME || 'blog',
    username: process.env.DATABASE_USERNAME || 'postgres',
    password: process.env.DATABASE_PASSWORD || 'password',
  },
};