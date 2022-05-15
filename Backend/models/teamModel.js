/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

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
  favoriteClub: {
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
});

virtualTeamSchema.pre(/^find/, function (next) {
  this.populate('user').populate('player');
  next();
});

const VirtualTeam = mongoose.model('VirtualTeam', virtualTeamSchema);
module.exports = VirtualTeam;
