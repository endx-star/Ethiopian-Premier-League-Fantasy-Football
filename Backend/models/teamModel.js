/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

const Player = require('./playerModel');

const virtualTeamSchema = new mongoose.Schema({
  name: {
    type: 'string',
    required: [true, 'A team must have a name'],
    unique: true,
  },
  totalPoint: {
    type: Number,
    default: 0.0,
  },
  bank: {
    type: Number,
    default: 100.0,
  },
  favoriteClub: {
    type: mongoose.Schema.ObjectId,
    ref: 'Club',
  },
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
  },
  players: Array,
});

virtualTeamSchema.pre('save', async function (next) {
  const playersPromises = this.players.map(
    async (id) => await Player.findById(id)
  );
  this.players = await Promise.all(playersPromises);
  next();
});

virtualTeamSchema.pre(/^find/, function (next) {
  this.populate('user').populate('favoriteClub');
  next();
});

const VirtualTeam = mongoose.model('VirtualTeam', virtualTeamSchema);
module.exports = VirtualTeam;
