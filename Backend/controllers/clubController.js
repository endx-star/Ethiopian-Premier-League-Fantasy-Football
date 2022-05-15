/* eslint-disable prettier/prettier */
const factory = require('./handlerFactory');
const Club = require('../models/clubModel');
const catchAsync = require('../utils/catchAsync');

exports.getAllClubs = catchAsync(async (req, res, next) => {
  const clubs = await Club.find();
  console.log(clubs);
  res.status(200).json({
    status: 'success',
    data: {
      clubs,
    },
  });
});

exports.addNewClub = factory.createOne(Club);
exports.getClub = factory.getOne(Club);
exports.updateClub = factory.updateOne(Club);
exports.deleteClub = factory.deleteOne(Club);

// fixture
//
