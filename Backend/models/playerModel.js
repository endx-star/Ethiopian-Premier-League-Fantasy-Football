/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
const slugify = require('slugify');
const validator = require('validator');

const playerSchema = new mongoose.Schema(
  {
    firstName: {
      type: String,
      required: [true, 'A player must have a first name'],
      trim: true,
      maxlength: [15, 'A player first name must be less than 10 characters'],
      minlength: [4, 'A player first name must be greater than 4 characters'],
      validate: [validator.isAlpha, 'A playe name must be only characters'],
    },
    lastName: {
      type: String,
      required: [true, 'A player must have a last name'],
      trim: true,
      maxlength: [15, 'A player last name must be less than 10 characters'],
      minlength: [4, 'A player last name must be greater than 4 characters'],
    },
    price: {
      type: Number,
      required: [true, 'A player must have a price'],
    },
    photo: String,
    position: {
      type: String,
      required: [true, 'A player must have a position'],
      trim: true,
      enum: {
        values: ['Goalkeeper', 'Midfielder', 'Defender', 'Forward'],
        message: 'you entered invalid position',
      },
    },
    club: {
      type: mongoose.Schema.ObjectId,
      ref: 'Club',
    },
    gameWeek: [
      {
        week: Number,
        rating: Number,
        point: Number,
      },
    ],
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

// VIRTUAL PROPERTY like conversion from day to weeks, m to km , decimal to percentage
playerSchema.virtual('totalPoint').get(function () {
  let result = 0;
  // eslint-disable-next-line no-plusplus
  for (let i = 0; i < this.gameWeek.length; i++) {
    result += this.gameWeek[i].point;
  }
  return result;
});

// Document middelware only works for .save() and .create()
playerSchema.pre('save', function (next) {
  const fullName = `${this.firstName} ${this.lastName}`;
  this.slug = slugify(fullName, {
    lower: true,
    replacement: '-',
  });
  next();
});

// Query middelware
playerSchema.pre(/^find/, function (next) {
  this.find({ leavedPlayer: { $ne: true } });
  this.start = Date.now();
  next();
});

// Aggregate middelware
playerSchema.pre('aggregate', function (next) {
  // console.log(this.pipeline());
  this.pipeline().unshift({ $match: { leavedPlayer: { $ne: true } } });
  next();
});

const Player = mongoose.model('Player', playerSchema);
module.exports = Player;
