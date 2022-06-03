/* eslint-disable prettier/prettier */
const express = require('express');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const mongoSanitize = require('express-mongo-sanitize');
const xss = require('xss-clean');

const AppError = require('./utils/appError');
const globalErrorHandler = require('./controllers/errorController');
const playerRouter = require('./routes/playerRoutes');
const userRouter = require('./routes/userRoutes');
const clubRouter = require('./routes/clubRoutes');
const teamRouter = require('./routes/teamRoutes');
const highlightRouter = require('./routes/highlightRoutes');
const fixtureRouter = require('./routes/fixtureRoutes');

const app = express();

////////////GLOBAL MIDDLEWARE////////
// set Security HTTP headers
app.use(helmet());

// development logging
if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

// limit requests coming from same IP
const limiter = rateLimit({
  max: 100,
  windowMs: 60 * 60 * 1000,
  message: 'Too many requests from this Ip. Please try again after an hour.',
});
app.use('/api', limiter);

// body parser, reading data from body to req.body
app.use(express.json({ limit: '16kb' }));

// Data sanitization against NoSQL query injection
app.use(mongoSanitize());

//Prevent parameter pollution
//app.use(hpp);

// Data sanitization against xss
app.use(xss());

// Test middleware
app.use((req, res, next) => {
  req.requestTime = new Date().toISOString();
  // console.log(req.headers);
  next();
});

// ROUTES
app.use('/api/v1/players', playerRouter);
app.use('/api/v1/users', userRouter);
app.use('/api/v1/clubs', clubRouter);
app.use('/api/v1/teams', teamRouter);
app.use('/api/v1/highlights', highlightRouter);
app.use('/api/v1/fixtures', fixtureRouter);

// Handle unhandled routes for all http methods
app.all('*', (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on this server`, 404));
});

// set Global Error handler
app.use(globalErrorHandler);
module.exports = app;
