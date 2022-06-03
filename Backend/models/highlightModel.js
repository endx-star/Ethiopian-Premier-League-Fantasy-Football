/* eslint-disable prettier/prettier */
const mongoose = require('mongoose');

const highlightSchema = new mongoose.Schema({
  url: String,
  title: String,
  time: {
    type: Date,
    default: Date.now(),
  },
});

const Highlight = mongoose.model('Highlight', highlightSchema);
module.exports = Highlight;
