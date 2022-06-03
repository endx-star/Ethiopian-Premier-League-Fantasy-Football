/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
const Player = require('./playerModel');

const { ObjectId } = mongoose.Schema;

const TeamPlayer = new mongoose.Schema({
  player: {
    type: ObjectId,
    ref: 'Player',
  },
  substitute: {
    type: Boolean,
    default: false,
  },
});

const virtualTeamSchema = new mongoose.Schema({
  name: {
    type: 'string',
    required: [true, 'A team must have a name'],
    unique: true,
  },
  teamPoint: {
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
  team: {
    players: [TeamPlayer],
    // keepers: [TeamPlayer],
    // defenders: [TeamPlayer],
    // midfielders: [TeamPlayer],
    // forwards: [TeamPlayer],
  },
});

// virtualTeamSchema.pre('save', async function (next) {
//   const playersPromises = this.players.map(
//     async (id) => await Player.findById(id)
//   );
//   this.players = await Promise.all(playersPromises);
//   next();
// });

// virtualTeamSchema.post('save', async function () {
//   let i = 0;
//   while (i < this.players.length) {
//     if (this.players[i].position === 'Goalkeeper' && i === 1)
//       this.players[i].substitute = true;
//     else if (this.players[i].position === 'Defender' && i === 6)
//       this.players[i].substitute = true;
//     else if (this.players[i].position === 'Midfielder' && i === 11)
//       this.players[i].substitute = true;
//     else if (this.players[i].position === 'Striker' && i === 14)
//       this.players[i].substitute = true;
//     i += 1;
//   }
// });

const VirtualTeam = mongoose.model('VirtualTeam', virtualTeamSchema);
module.exports = VirtualTeam;
