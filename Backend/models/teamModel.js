/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

const virtualTeamSchema = new mongoose.Schema({
  name: {
    type: 'string',
    required: [true, 'A team must have a name'],
    unique: true,
  },
  point: {
    type: Number,
    default: 0.0,
  },
  rank: Number,
  gameWeek: Number,
  gameWeekPoint: Number,
  club: {
    type: mongoose.Schema.ObjectId,
    ref: 'Club',
  },
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
  },
  player: [
    {
      type: mongoose.Schema.ObjectId,
      ref: 'Player',
    },
  ],
  // favorite club, kit, shortName
  // bank
  //firstName,price,point, position
});

const VirtualTeam = mongoose.model('VirtualTeam', virtualTeamSchema);
module.exports = VirtualTeam;
