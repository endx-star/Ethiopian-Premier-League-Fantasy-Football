/* eslint-disable prettier/prettier */
const express = require('express');
const teamController = require('../controllers/teamController');
// const authController = require('../controllers/authController');

const router = express.Router();

//only logged in users can access the following routes
// router.use(authController.protect);

// router.route('/').get(teamController.getAllTeams);
router.route('/create-new-team').post(teamController.createNewTeam);
// router.route('/team-point').get(teamController.teamPoint);
// router.route('/substitute-player').patch(teamController.substitutePlayer);
// router.route('/:id').get(teamController.myTeam);

router.route('/').patch(teamController.transferPlayer);
router.route('/').get(teamController.myTeam);
router.route('/all-teams').get(teamController.getAllTeams);

module.exports = router;
