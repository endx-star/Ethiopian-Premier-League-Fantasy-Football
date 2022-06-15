/* eslint-disable prettier/prettier */
const VirtualTeam = require('../models/teamModel');
const catchAsync = require('../utils/catchAsync');
// const factory = require('./handlerFactory');
const AppError = require('../utils/appError');

exports.createNewTeam = catchAsync(async (req, res, next) => {
  // if (!req.body.user) req.body.user = req.user.id;
  const newTeam = await VirtualTeam.create(req.body);
  res.status(201).json({
    status: 'success',
    data: {
      newTeam,
    },
  });
});

exports.myTeam = catchAsync(async (req, res, next) => {
  const teams = await VirtualTeam.findOne(req.query).populate([
    { path: 'team.keepers.player', populate: ['clubId'] },
    { path: 'team.defenders.player', populate: ['clubId'] },
    { path: 'team.midfielders.player', populate: ['clubId'] },
    { path: 'team.forwards.player', populate: ['clubId'] },
  ]);
  // SEND RESPONSE
  res.status(200).json({
    status: 'success',
    data: {
      teams,
    },
  });
});

exports.getAllTeams = catchAsync(async (req, res, next) => {
  const teams = await VirtualTeam.find();
  res.status(200).json({
    status: 'success',
    result: teams.length,
    data: {
      teams,
    },
  });
});

// exports.myTeam = catchAsync(async (req, res, next) => {
//   const team = await VirtualTeam.findOne(req.params.id).populate([
//     { path: 'team.keepers', populate: ['player'] },
//     { path: 'team.defenders', populate: ['player'] },
//     { path: 'team.midFielders', populate: ['player'] },
//     { path: 'team.forwards', populate: ['player'] },
//   ]);

// const team = await VirtualTeam.findById(req.params.id).populate([
//   { path: 'team.players', populate: ['player'] },
// ]);
//   res.status(200).json({
//     status: 'success',
//     data: {
//       team,
//     },
//   });
// });

// exports.teamPoint = catchAsync(async (req, res, next) => {
//   const Point = await VirtualTeam.aggregate([]);
// });

exports.transferPlayer = catchAsync(async (req, res, next) => {
  const player = await VirtualTeam.findOneAndUpdate(req.query, req.body, {
    new: true,
    runValidators: true,
  });
  if (!player) {
    return next(new AppError('No document found with this email', 404));
  }
  res.status(200).json({
    status: 'success',
    data: {
      player,
    },
  });
});

// exports.substitutePlayer = catchAsync(async (req, res, next) => {
//   const
// })
