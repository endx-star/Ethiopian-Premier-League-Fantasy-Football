/* eslint-disable prettier/prettier */
const multer = require('multer');
const factory = require('./handlerFactory');
const Club = require('../models/clubModel');
const catchAsync = require('../utils/catchAsync');
const AppError = require('../utils/appError');

const multerStorageJersey = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/img/clubs/jersey');
  },
  filename: (req, file, cb) => {
    console.log(req.file);
    const ext = file.mimetype.split('/')[1];
    cb(null, `${file.fieldname}- ${Date.now()}.${ext})`);
  },
});

const multerFilterJersey = (req, file, cb) => {
  if (file.mimetype.startsWith('image')) {
    cb(null, true);
  } else {
    cb(new AppError('Not an image.please upload an image', 400), false);
  }
};
const uploadJ = multer({
  storage: multerStorageJersey,
  fileFilter: multerFilterJersey,
});

exports.uploadJersey = uploadJ.single('jersey');

const multerStorageLogo = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/img/clubs/logo');
  },
  filename: (req, file, cb) => {
    console.log(req.file);
    const ext = file.mimetype.split('/')[1];
    cb(null, `${file.fieldname}- ${Date.now()}.${ext})`);
  },
});

const multerFilterLogo = (req, file, cb) => {
  if (file.mimetype.startsWith('image')) {
    cb(null, true);
  } else {
    cb(new AppError('Not an image.please upload an image', 400), false);
  }
};
const uploadL = multer({
  storage: multerStorageLogo,
  fileFilter: multerFilterLogo,
});

exports.uploadLogo = uploadL.single('logo');

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
