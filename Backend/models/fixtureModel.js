/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

const fixtureSchema = new mongoose.Schema({
  week: Number,
  games: [
    {
      clubOneName: 'String',
      clubTwoName: 'String',
      clubOneLogo: 'String',
      clubTwoLogo: 'String',
      score: 'String',
      startTime: 'String',
    },
  ],
});

// fixtureSchema.virtual('startTime').get(function () {
//   return this.date.getHours();
// });

const Fixture = mongoose.model('Fixture', fixtureSchema);
module.exports = Fixture;
