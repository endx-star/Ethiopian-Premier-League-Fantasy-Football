/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
// const validator = require('validator');

const playerSchema = new mongoose.Schema(
  {
    clubId: {
      type: mongoose.Schema.ObjectId,
      ref: 'Club',
    },
    name: {
      type: String,
      required: [true, 'A player must have name'],
      // trim: true,
      // maxlength: [15, 'A player first name must be less than 10 characters'],
      // minlength: [4, 'A player first name must be greater than 4 characters'],
      // validate: [validator.isAlpha, 'A playe name must be only characters'],
    },
    price: {
      type: Number,
      required: [true, 'A player must have a price'],
    },
    totalPoint: {
      type: Number,
      default: 0,
    },
    photo: String,
    position: {
      type: String,
      required: [true, 'A player must have a position'],
      trim: true,
      enum: {
        values: ['Goalkeeper', 'Midfielder', 'Defender', 'Striker'],
        message: 'you entered invalid position',
      },
    },
    gameWeek: [
      {
        week: Number,
        rating: {
          type: Number,
          default: 0.0,
        },
        status: [
          {
            type: String,
            default: [],
          },
        ],
        point: {
          type: Number,
          default: 0,
        },
      },
    ],
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

// Document middelware only works for .save() and .create()'
playerSchema.pre('save', function (next) {
  let i = 0;
  while (i < this.gameWeek.length) {
    if (this.gameWeek[i].status.length === 0) {
      this.gameWeek[i].point = 0;
    } else if (this.position === 'Goalkeeper') {
      if (this.gameWeek[i].status.includes('clean sheet')) {
        this.gameWeek[i].point += 5;
      }
      if (this.gameWeek[i].status.includes('assist'))
        this.gameWeek[i].point += 3;
      if (this.gameWeek[i].status.includes('score goal'))
        this.gameWeek[i].point += 2;
    } else if (this.position === 'Defender') {
      if (this.gameWeek[i].status.includes('clean sheet'))
        this.gameWeek[i].point += 4;
      if (this.gameWeek[i].status.includes('assist'))
        this.gameWeek[i].point += 3;
      if (this.gameWeek[i].status.includes('score goal'))
        this.gameWeek[i].point += 6;
    } else if (this.position === 'Midfielder') {
      if (this.gameWeek[i].status.includes('clean sheet'))
        this.gameWeek[i].point += 1;
      if (this.gameWeek[i].status.includes('assist'))
        this.gameWeek[i].point += 3;
      if (this.gameWeek[i].status.includes('score goal'))
        this.gameWeek[i].point += 5;
    } else if (this.position === 'Striker') {
      if (this.gameWeek[i].status.includes('assist'))
        this.gameWeek[i].point += 3;
      if (this.gameWeek[i].status.includes('score goal'))
        this.gameWeek[i].point += 4;
    }
    if (this.gameWeek[i].status.includes('missing penalty'))
      this.gameWeek[i].point -= 2;
    if (this.gameWeek[i].status.includes('yellow card'))
      this.gameWeek[i].point -= 1;
    if (this.gameWeek[i].status.includes('red card'))
      this.gameWeek[i].point -= 3;
    if (this.gameWeek[i].status.includes('own goal'))
      this.gameWeek[i].point -= 2;
    i += 1;
  }
  next();
});

playerSchema.pre('save', function (next) {
  let i = 0;
  while (i < this.gameWeek.length) {
    this.totalPoint += this.gameWeek[i].point;
    i += 1;
  }
  next();
});

// Query middelware

// Aggregate middelware

// playerSchema.pre('aggregate', function (next) {
//   console.log(this.pipeline());
//   next();
// });

const Player = mongoose.model('Player', playerSchema);
module.exports = Player;
