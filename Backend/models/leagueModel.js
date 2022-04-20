/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

const leagueSchema = new mongoose.Schema({
  name: {
    type: 'string',
    required: [true, 'A league must have a name'],
    unique: true,
  },
  rank: 'integer',
  numberOfTeams: 'integer',
});

const League = mongoose.model('League', leagueSchema);
module.exports = League;
