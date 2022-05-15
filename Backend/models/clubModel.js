/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');
const validator = require('validator');

const clubSchema = new mongoose.Schema({
  name: {
    type: 'string',
    required: [true, 'A club must have a name'],
    unique: true,
    validate: [validator.isAlpha, 'please provide a valid club name'],
  },
  kit: {
    type: 'string',
    required: [true, 'A club must have a kit'],
  },
  logo: {
    type: 'string',
    required: [true, 'A club must have a kit'],
  },
  shortName: {
    type: 'string',
    required: [true, 'A club must have a short name'],
  },
});

const Club = mongoose.model('Club', clubSchema);
module.exports = Club;
