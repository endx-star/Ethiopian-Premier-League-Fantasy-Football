/* eslint-disable prettier/prettier */
const VirtualTeam = require('../models/teamModel');
const catchAsync = require('../utils/catchAsync');

exports.createNewTeam = catchAsync(async (req, res, next) => {
  const newTeam = await VirtualTeam.create(req.body);
  res.status(201).json({
    status: 'success',
    data: {
      newTeam,
    },
  });
});

exports.getAllTeams = catchAsync(async (req, res, next) => {
  const teams = await VirtualTeam.find();
  res.status(200).json({
    status: 'success',
    data: {
      teams,
    },
  });
});

exports.myTeam = catchAsync(async (req, res, next) => {
  const team = await VirtualTeam.findById(req.params.id);
  res.status(200).json({
    status: 'success',
    data: {
      team,
    },
  });
});
