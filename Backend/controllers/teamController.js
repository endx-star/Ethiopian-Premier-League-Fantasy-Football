/* eslint-disable prettier/prettier */
const VirtualTeam = require('../models/teamModel');
const catchAsync = require('../utils/catchAsync');

exports.squadSelection = catchAsync(async (req, res, next) => {
  const newTeam = await VirtualTeam.create(req.body);
  res.status(201).json({
    status: 'success',
    data: {
      newTeam,
    },
  });
});

exports.myTeam = catchAsync(async (req, res, next) => {
  const team = await VirtualTeam.findById(req.params.id)
    .populate({
      path: 'player',
      select: 'firstName',
    })
    .populate('club')
    .populate({
      path: 'user',
      select: 'firstName lastName',
    });

  res.status(200).json({
    status: 'success',
    data: {
      team,
    },
  });
});
