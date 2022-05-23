/* eslint-disable prettier/prettier */
const express = require('express');
const teamController = require('../controllers/teamController');
// const authController = require('../controllers/authController');

const router = express.Router();

//only logged in users can access the following routes
// router.use(authController.protect);

router.route('/').get(teamController.getAllTeams);
router.route('/create-new-team').post(teamController.createNewTeam);
router.route('/:id').get(teamController.myTeam);

module.exports = router;
