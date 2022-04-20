/* eslint-disable prettier/prettier */
const AppError = require('../utils/appError');

const handleCastErrorDB = (err) => {
  const message = `Invalid ${err.path}: ${err.value}`;
  return new AppError(message, 400);
};

const handleDuplicateFieldsDB = (err) => {
  const value = err.message.match(/(?<=(["']))(?:(?=(\\?))\2.)*?(?=\1)/)[0];
  const message = `Duplicate value: ${value} . please try again`;
  return new AppError(message, 400);
};

const handleValidationErrorDB = (err) => {
  const errors = Object.values(err.errors).map((el) => el.message);
  const message = `Invalid Input data: ${errors.join('. ')}`;
  // const message = `Validation error: ${err.message}`;
  return new AppError(message, 400);
};
const handleJWTError = () =>
  new AppError('Invalid token. please log in again', 401);

const handleTokenExpired = () =>
  new AppError('Token expired. please log in again', 401);

const sendErrorDev = (err, res) => {
  res.status(err.statusCode).json({
    status: err.status,
    Error: err,
    message: err.message,
    stack: err.stack,
  });
};

const sendErrorProd = (err, res) => {
  // Oprational,Trusted Error: send to the client
  if (err.isOperational) {
    res.status(err.statusCode).json({
      status: err.status,
      message: err.message,
    });
  }
  // programming, other unknown error: don't leak the details to the client
  else {
    //   1) Log error
    console.log('Error 🔥', err);
    //   2) send generic message
    res.status(500).json({
      status: 'fail',
      message: 'Something Went Wrong!',
    });
  }
};

module.exports = (err, req, res, next) => {
  err.statusCode = err.statusCode || 500;
  err.status = err.status || 'error';
  if (process.env.NODE_ENV === 'development') {
    sendErrorDev(err, res);
  } else if (process.env.NODE_ENV === 'production') {
    // let error = { ...err}  not working i don't know what happnes it needs further reading
    if (err.name === 'CastError') err = handleCastErrorDB(err);
    if (err.code === 11000) err = handleDuplicateFieldsDB(err);
    if (err.name === 'ValidationError') err = handleValidationErrorDB(err);
    if (err.name === 'JsonWebTokenError') err = handleJWTError();
    if (err.name === 'TokenExpiredError') err = handleTokenExpired();
    sendErrorProd(err, res);
  }
};
