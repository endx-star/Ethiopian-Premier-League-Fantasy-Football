/* eslint-disable prettier/prettier */
const Player = require('../models/playerModel');
const catchAsync = require('../utils/catchAsync');
// const APIFeatures = require('../utils/apiFeatures');
// const AppError = require('../utils/appError');
const factory = require('./handlerFactory');

exports.aliasTopPlayers = (req, res, next) => {
  req.query.limit = '5';
  req.query.sort = '-rating';
  req.query.fields = 'firstName, price, rating, point';
  next();
};

exports.getAllPlayers = catchAsync(async (req, res, next) => {
  // console.log(req.query.fields);
  // EXCUTE QUERY
  // const features = new APIFeatures(Player.find(), req.query)
  //   .filter()
  //   .sort()
  //   .limitFields()
  //   .paginate();
  // const players = await features.query;

  const players = await Player.find();

  // SEND RESPONSE
  res.status(200).json({
    status: 'success',
    result: players.length,
    requestedAt: req.requestTime,
    data: {
      players,
    },
  });
});

// exports.getPlayer = catchAsync(async (req, res, next) => {
//   const player = await Player.findById(req.params.id);
//   // const player = await Player.findOne({ _id: req.params.id });
//   if (!player) {
//     return next(new AppError('No player found with this ID', 404));
//   }
//   res.status(200).json({
//     status: 'success',
//     data: {
//       player,
//     },
//   });
// });

// exports.addNewPlayer = catchAsync(async (req, res, next) => {
//   const newPlayer = await Player.create(req.body);
//   res.status(201).json({
//     status: 'success',
//     data: {
//       newPlayer,
//     },
//   });
// });

// exports.updatePlayer = catchAsync(async (req, res, next) => {
//   const player = await Player.findByIdAndUpdate(req.params.id, req.body, {
//     new: true,
//     runValidators: true,
//   });
//   if (!player) {
//     return next(new AppError('No player found with this ID', 404));
//   }
//   res.status(200).json({
//     status: 'success',
//     data: {
//       player,
//     },
//   });
// });

exports.getPlayer = factory.getOne(Player);
exports.addNewPlayer = factory.createOne(Player);
exports.updatePlayer = factory.updateOne(Player);
exports.deletePlayer = factory.deleteOne(Player);

exports.getPlayerStatus = catchAsync(async (req, res, next) => {
  const status = await Player.aggregate([
    {
      $match: { price: { $gte: 5 } },
    },
    {
      $group: {
        _id: { $toUpper: '$position' },
        numOfPlayers: { $sum: 1 },
        avgPoints: { $avg: '$point' },
        avgRating: { $avg: '$rating' },
        maxPoints: { $max: '$point' },
        minPoints: { $min: '$point' },
      },
    },
    {
      $sort: { avgRating: 1 },
    },
    // {
    //   $match: { avgPoints: { $gte: 7 } },
    // },
    // {
    //   $project: { _id: 0 },
    // },
  ]);
  res.status(200).json({
    status: 'success',
    data: {
      status,
    },
  });
});

exports.transferPlayer = catchAsync(async (req, res, next) => {
  const playerData = await Player.findById(req.params.id);

  res.status(200).json({
    status: 'success',
    data: {
      playerData,
    },
  });
});
