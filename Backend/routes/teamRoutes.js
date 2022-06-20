/* eslint-disable prettier/prettier */
const express = require('express');
const teamController = require('../controllers/teamController');
// const authController = require('../controllers/authController');

const router = express.Router();

//only logged in users can access the following routes
// router.use(authController.protect);

router.route('/create-new-team').post(teamController.createNewTeam);
router.route('/team-point').get(teamController.teamPoint);
router.route('/league-user').get(teamController.league);

router.route('/transfer-player').patch(teamController.transferPlayer);
router.route('/my-team').get(teamController.myTeam);
router.route('/').get(teamController.getAllTeams);
router.route('/').delete(teamController.deleteAll);

module.exports = router;
