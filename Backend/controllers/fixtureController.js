/* eslint-disable prettier/prettier */
const Fixture = require('../models/fixtureModel');

const catchAsync = require('../utils/catchAsync');

exports.getAllFixtures = catchAsync(async (req, res, next) => {
  const fixtures = await Fixture.find();

  // SEND RESPONSE
  res.status(200).json({
    status: 'success',
    result: fixtures.length,
    data: {
      fixtures,
    },
  });
});
