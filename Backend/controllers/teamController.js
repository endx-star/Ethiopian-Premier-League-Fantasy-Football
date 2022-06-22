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

exports.deleteAll = catchAsync(async (req, res, next) => {
  await VirtualTeam.deleteMany();
  res.status(204).json({
    status: 'success',
    data: null,
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

exports.teamPoint = catchAsync(async (req, res, next) => {
  const point = await VirtualTeam.find(req.query).populate([
    { path: 'team.keepers.player', populate: ['clubId'] },
    { path: 'team.defenders.player', populate: ['clubId'] },
    { path: 'team.midfielders.player', populate: ['clubId'] },
    { path: 'team.forwards.player', populate: ['clubId'] },
  ]);

  res.status(200).json({
    status: 'success',
    data: {
      point,
    },
  });
});

exports.league = catchAsync(async (req, res, next) => {
  // const leagueUsers = await VirtualTeam.aggregate([
  //   {
  //     $setWindowFields: {
  //       sortBy: { teamPoint: -1 },
  //       output: {
  //         rankUser: {
  //           $rank: 1,
  //         },
  //       },
  //     },
  //   },
  //   {
  //     $project: { name: 1, teamPoint: 1, rank: 1 },
  //   },
  // ]);

  const leagueUsers = await VirtualTeam.find().select('name teamPoint');
  const array = [];
  for (const key in leagueUsers) {
    array.push(leagueUsers[key]);
  }
  array.sort((a, b) => {
    return a.teamPoint - b.teamPoint;
  });

  for (let i = 0; i < array.length; i++) {
    array[i].rank = i + 1;
  }

  res.status(200).json({
    status: 'success',
    data: {
      leagueUsers,
    },
  });
});

exports.checkBank = catchAsync(async (req, res, next) => {
  if (req.body.bank > 100) {
    return next(
      new AppError(
        'The total price of players is greater than 100, please choose players with total price less than 100.',
        500
      )
    );
  }
  next();
});
exports.checkDuplication = catchAsync(async (req, res, next) => {
  let hasDuplicate = false;
  req.body.team.keepers
    .map((v) => v.player)
    .sort()
    // eslint-disable-next-line array-callback-return
    .sort((a, b) => {
      if (a === b) hasDuplicate = true;
    });
  req.body.team.defenders
    .map((v) => v.player)
    .sort()
    // eslint-disable-next-line array-callback-return
    .sort((a, b) => {
      if (a === b) hasDuplicate = true;
    });
  req.body.team.forwards
    .map((v) => v.player)
    .sort()
    // eslint-disable-next-line array-callback-return
    .sort((a, b) => {
      if (a === b) hasDuplicate = true;
    });
  req.body.team.midfielders
    .map((v) => v.player)
    .sort()
    // eslint-disable-next-line array-callback-return
    .sort((a, b) => {
      if (a === b) hasDuplicate = true;
    });
  if (hasDuplicate) {
    return next(
      new AppError(
        'you select the same player repeatedly. please select a different',
        400
      )
    );
  }
  next();
});
// exports.checkClub = catchAsync(async(req, res, next)) {

// }
