/* eslint-disable prettier/prettier */
const express = require('express');
const teamController = require('../controllers/teamController');

const router = express.Router();
router.route('/').get(teamController.getAllTeams);

router.route('/squad-selection').post(teamController.squadSelection);

router.route('/:id').get(teamController.myTeam);
router.route('/:id/transfer-player/:id').patch(teamController.transferPlayer);

module.exports = router;
