/* eslint-disable prettier/prettier */
const express = require('express');

const fixtureController = require('../controllers/fixtureController');
// const authController = require('../controllers/authController');

const router = express.Router();

router.route('/').get(fixtureController.getAllFixtures);

module.exports = router;
