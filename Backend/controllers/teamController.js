/* eslint-disable prettier/prettier */
const VirtualTeam = require('../models/teamModel');
const catchAsync = require('../utils/catchAsync');

exports.createNewTeam = catchAsync(async (req, res, next) => {
  if (!req.body.user) req.body.user = req.user.id;
  const newTeam = await VirtualTeam.create(req.body);
  res.status(201).json({
    status: 'success',
    data: {
      newTeam,
    },
  });
});

exports.myTeam = catchAsync(async (req, res, next) => {
  // const team = await VirtualTeam.findById(req.params.id).populate([
  //   { path: 'team.keepers', populate: ['player'] },
  //   { path: 'team.defenders', populate: ['player'] },
  //   { path: 'team.midFielders', populate: ['player'] },
  //   { path: 'team.forwards', populate: ['player'] },
  // ]);

  const team = await VirtualTeam.findById(req.params.id).populate([
    { path: 'team.players', populate: ['player'] },
  ]);
  res.status(200).json({
    status: 'success',
    data: {
      team,
    },
  });
});

// exports.teamPoint = catchAsync(async (req, res, next) => {
//   const gameWeekPoint = await VirtualTeam.aggregate([]);
// });

exports.transferPlayer = catchAsync(async (req, res, next) => {
  const player = await VirtualTeam.findById(
    req.params.id
  ).players.findByIdAndUpdate(req.params.id);
  res.status(200).json({
    status: 'success',
    data: {
      player,
    },
  });
});
