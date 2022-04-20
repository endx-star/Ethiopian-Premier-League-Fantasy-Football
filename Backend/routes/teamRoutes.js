/* eslint-disable prettier/prettier */
const express = require('express');
const teamController = require('../controllers/teamController');

const router = express.Router();
router.route('/squad-selection').post(teamController.squadSelection);

router.route('/my-team/:id').get(teamController.myTeam);

module.exports = router;
