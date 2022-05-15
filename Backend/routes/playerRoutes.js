/* eslint-disable prettier/prettier */
const express = require('express');
const playerController = require('../controllers/playerController');
const authController = require('../controllers/authController');

const router = express.Router();
router.route('/goalkeepers').get(playerController.getGoalkeepers);
router.route('/defenders').get(playerController.getDefenders);
router.route('/midfielders').get(playerController.getMidfielders);
router.route('/forwards').get(playerController.getForwards);

router
  .route('/top-5-players')
  .get(playerController.aliasTopPlayers, playerController.getAllPlayers);
router.route('/get-players-status').get(playerController.getPlayerStatus);

router
  .route('/')
  .get(authController.protect, playerController.getAllPlayers)
  .post(playerController.addNewPlayer);
router
  .route('/:id')
  .get(playerController.getPlayer)
  .patch(playerController.updatePlayer)
  .delete(
    authController.protect,
    authController.restrictTo('admin'),
    playerController.deletePlayer
  );

module.exports = router;
