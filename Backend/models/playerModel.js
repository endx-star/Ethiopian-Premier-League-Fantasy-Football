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
      unique: true,
    },
    lastName: {
      type: String,
      required: [true, 'A player must have a last name'],
      trim: true,
      maxlength: [15, 'A player last name must be less than 10 characters'],
      minlength: [4, 'A player last name must be greater than 4 characters'],
      unique: true,
    },
    slug: String,
    price: {
      type: Number,
      required: [true, 'A player must have a price'],
    },
    rating: {
      type: Number,
      required: [true, 'A player must have a rating'],
      min: [1, 'A player rating must be greater than 1.0'],
      max: [10, 'A player rating must be less than 10.0'],
      validate: {
        validator: function (val) {
          return val <= this.price;
        },
        message: 'A player rating ({VALUE}) must be less than player price',
      },
    },
    form: {
      type: Number,
      required: [true, 'A player must have a form'],
      min: [1, 'A player form must be greater than 1.0'],
      max: [10, 'A player form must be less than 10.0'],
    },
    photo: {
      type: String,
      required: [true, 'A player must have a photo'],
    },
    club: {
      type: mongoose.Schema.ObjectId,
      ref: 'Club',
    },

    position: {
      type: String,
      required: [true, 'A player must have a position'],
      trim: true,
      enum: {
        values: ['Goalkeeper', 'Midfielder', 'Defender', 'Forward'],
        message: 'you entered invalid position',
      },
      // select: false,
    },
    point: {
      type: Number,
      required: [true, 'A player must have a point'],
    },

    injury: {
      type: Number,
      default: 0,
    },
    leavedPlayer: {
      type: Boolean,
      default: false,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

// VIRTUAL PROPERTY like conversion from day to weeks, m to km , decimal to percentage
// playerSchema.virtual('injuryPercent').get(function () {
//   return `${this.injury * 100}%`;
// });

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

playerSchema.post(/^find/, function (docs, next) {
  // console.log(docs);
  console.log(`${Date.now() - this.start} milliseconds`);
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
