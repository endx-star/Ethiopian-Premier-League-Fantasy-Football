/* eslint-disable prettier/prettier */
const fs = require('fs');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
// const Player = require('../../models/playerModel');
// const Club = require('../../models/clubModel');
// const Fixture = require('../../models/fixtureModel');
// const Highlight = require('../../models/highlightModel');
const User = require('../../models/userModel');
/************* Import Players Data ***************/
// dotenv.config({ path: './config.env' });

// const DB = process.env.DATABASE.replace(
//   '<PASSWORD>',
//   process.env.DATABASE_PASSWORD
// );

// mongoose
//   // .connect(process.env.DATABASE_LOCAL, {
//   .connect(DB, {
//     useNewUrlParser: true,
//     useCreateIndex: true,
//     useUnifiedTopology: true,
//     useFindAndModify: false,
//   })
//   .then(() => {
//     console.log('Database Connection Successful');
//   });
// const players = JSON.parse(
//   fs.readFileSync(`${__dirname}/players.json`, 'utf-8')
// );

// // console.log(players);

// //IMPORT ALL DATA
// const importData = async () => {
//   try {
//     await Player.create(players);
//     console.log('Data Successfully loaded');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// //DELETE ALL DATA
// const deleteData = async () => {
//   try {
//     await Player.deleteMany();
//     console.log('Data Successfully deleted');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// if (process.argv[2] === '--import') {
//   importData();
// } else if (process.argv[2] === '--delete') {
//   deleteData();
// }

/******************Import Clubs data *************************/

// dotenv.config({ path: './config.env' });

// const DB = process.env.DATABASE.replace(
//   '<PASSWORD>',
//   process.env.DATABASE_PASSWORD
// );

// mongoose
//   // .connect(process.env.DATABASE_LOCAL, {
//   .connect(DB, {
//     useNewUrlParser: true,
//     useCreateIndex: true,
//     useUnifiedTopology: true,
//     useFindAndModify: false,
//   })
//   .then(() => {
//     console.log('Database Connection Successful');
//   });
// const clubs = JSON.parse(fs.readFileSync(`${__dirname}/clubs.json`, 'utf-8'));

// // console.log(clubs);

// //IMPORT ALL DATA
// const importData = async () => {
//   try {
//     await Club.create(clubs);
//     console.log('Data Successfully loaded');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// //DELETE ALL DATA
// const deleteData = async () => {
//   try {
//     await Club.deleteMany();
//     console.log('Data Successfully deleted');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// if (process.argv[2] === '--import') {
//   importData();
// } else if (process.argv[2] === '--delete') {
//   deleteData();
// }

/************* Import Fixture ***************/
// dotenv.config({ path: './config.env' });

// const DB = process.env.DATABASE.replace(
//   '<PASSWORD>',
//   process.env.DATABASE_PASSWORD
// );

// mongoose
//   // .connect(process.env.DATABASE_LOCAL, {
//   .connect(DB, {
//     useNewUrlParser: true,
//     useCreateIndex: true,
//     useUnifiedTopology: true,
//     useFindAndModify: false,
//   })
//   .then(() => {
//     console.log('Database Connection Successful');
//   });
// const fixture = JSON.parse(
//   fs.readFileSync(`${__dirname}/fixture.json`, 'utf-8')
// );

// // console.log(players);

// //IMPORT ALL DATA
// const importData = async () => {
//   try {
//     await Fixture.create(fixture);
//     console.log('Data Successfully loaded');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// //DELETE ALL DATA
// const deleteData = async () => {
//   try {
//     await Fixture.deleteMany();
//     console.log('Data Successfully deleted');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// if (process.argv[2] === '--import') {
//   importData();
// } else if (process.argv[2] === '--delete') {
//   deleteData();
// }

/******************Import Highlight data *************************/

// dotenv.config({ path: './config.env' });

// const DB = process.env.DATABASE.replace(
//   '<PASSWORD>',
//   process.env.DATABASE_PASSWORD
// );

// mongoose
//   // .connect(process.env.DATABASE_LOCAL, {
//   .connect(DB, {
//     useNewUrlParser: true,
//     useCreateIndex: true,
//     useUnifiedTopology: true,
//     useFindAndModify: false,
//   })
//   .then(() => {
//     console.log('Database Connection Successful');
//   });
// const highlights = JSON.parse(
//   fs.readFileSync(`${__dirname}/highlights.json`, 'utf-8')
// );

// // console.log(Clubs);

// //IMPORT ALL DATA
// const importData = async () => {
//   try {
//     await Highlight.create(highlights);
//     console.log('Data Successfully loaded');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// //DELETE ALL DATA
// const deleteData = async () => {
//   try {
//     await Highlight.deleteMany();
//     console.log('Data Successfully deleted');
//   } catch (err) {
//     console.log(err);
//   }
//   process.exit();
// };

// if (process.argv[2] === '--import') {
//   importData();
// } else if (process.argv[2] === '--delete') {
//   deleteData();
// }

/*************** Delete User ************************/
dotenv.config({ path: './config.env' });

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
const users = JSON.parse(fs.readFileSync(`${__dirname}/user.json`, 'utf-8'));

// console.log(players);

//IMPORT ALL DATA
const importData = async () => {
  try {
    await User.create(users);
    console.log('Data Successfully loaded');
  } catch (err) {
    console.log(err);
  }
  process.exit();
};

//DELETE ALL DATA
const deleteData = async () => {
  try {
    await User.deleteMany();
    console.log('Data Successfully deleted');
  } catch (err) {
    console.log(err);
  }
  process.exit();
};

if (process.argv[2] === '--import') {
  importData();
} else if (process.argv[2] === '--delete') {
  deleteData();
}
