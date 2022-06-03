/* eslint-disable prettier/prettier */
const Highlight = require('../models/highlightModel');
const factory = require('./handlerFactory');
const catchAsync = require('../utils/catchAsync');

exports.getHighlight = factory.getOne(Highlight);
exports.addNewHighlight = factory.createOne(Highlight);
exports.updateHighlight = factory.updateOne(Highlight);
exports.deleteHighlight = factory.deleteOne(Highlight);

exports.getAllHighlights = catchAsync(async (req, res, next) => {
  const doc = await Highlight.aggregate([
    {
      $sort: { time: -1 },
    },
  ]);
  res.status(200).json({
    status: 'success',
    data: {
      doc,
    },
  });
});
