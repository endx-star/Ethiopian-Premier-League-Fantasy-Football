/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
// const Player = require('./playerModel');

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
    default: Math.floor(Math.random() * 100) + 100,
  },
  bank: {
    type: Number,
    default: 100.0,
  },
  favoriteClub: String,
  user: String,
  team: {
    // players: [TeamPlayer],
    keepers: [TeamPlayer],
    defenders: [TeamPlayer],
    midfielders: [TeamPlayer],
    forwards: [TeamPlayer],
  },
});

// virtualTeamSchema.pre('save', async function (next) {
//   const playersPromises = this.players.map(
//     async (id) => await Player.findById(id)
//   );
//   this.players = await Promise.all(playersPromises);
//   next();
// });

virtualTeamSchema.pre('save', function (next) {
  this.team.keepers[0].substitute = true;
  this.team.defenders[0].substitute = true;
  this.team.midfielders[0].substitute = true;
  this.team.forwards[0].substitute = true;
  next();
});

virtualTeamSchema.post('findOneAndUpdate', (doc, next) => {
  doc.save((err) => {
    if (!err) {
      doc.team.keepers[0].substitute = true;
      doc.team.defenders[0].substitute = true;
      doc.team.midfielders[0].substitute = true;
      doc.team.forwards[0].substitute = true;
    }
  });
  next();
});

// virtualTeamSchema.pre(/^find/, (doc, next) => {
//   console.log(this);
//   let i = 0;
//   let Kpoint = 0;
//   let Dpoint = 0;
//   let Mpoint = 0;
//   let Fpoint = 0;

//   while (i < doc.team.keepers) {
//     if (doc.team.keepers[i].substitute === true) Kpoint += 0;
//     else Kpoint += doc.team.keepers[i].totalPoint;
//     i += 1;
//   }
//   while (i < doc.team.defenders) {
//     if (doc.team.defenders[i].substitute === true) Dpoint += 0;
//     else Dpoint += doc.team.defenders[i].totalPoint;
//     i += 1;
//   }
//   while (i < doc.team.midfielders) {
//     if (doc.team.midfielders[i].substitute === true) Mpoint += 0;
//     else Mpoint += doc.team.midfielders[i].totalPoint;
//     i += 1;
//   }
//   while (i < doc.team.forwards) {
//     if (doc.team.forwards[i].substitute === true) Fpoint += 0;
//     else Fpoint += doc.team.forwards[i].totalPoint;
//     i += 1;
//   }
//   doc.teamPoint = Kpoint + Dpoint + Mpoint + Fpoint;
//   next();
// });

const VirtualTeam = mongoose.model('VirtualTeam', virtualTeamSchema);
module.exports = VirtualTeam;
