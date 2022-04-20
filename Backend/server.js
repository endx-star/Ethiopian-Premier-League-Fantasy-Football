/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
const dotenv = require('dotenv');

process.on('uncaughtException', (err) => {
  console.log('UNCAUGHT EXCEPTION 🎇 Shouting down...');
  console.log(err.name, err.message);
  // console.log(err);
  process.exit(1);
});

dotenv.config({ path: './config.env' });
const app = require('./app');

const DB = process.env.DATABASE.replace(
  '<PASSWORD>',
  process.env.DATABASE_PASSWORD
);

mongoose
  // .connect(process.env.DATABASE_LOCAL, {
  .connect(DB, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
  })
  .then(() => {
    console.log('Database Connection Successful');
  });

console.log(process.env.NODE_ENV);
const port = process.env.PORT || 8000;
const server = app.listen(port, (req, res) => {
  console.log(`App running on port ${port}...`);
});

process.on('unhandledRejection', (err) => {
  console.log('UNHADLED REJECTION 🎇 Shouting down...');
  console.log(err.name, err.message);
  server.close(() => {
    process.exit(1);
  });
});
