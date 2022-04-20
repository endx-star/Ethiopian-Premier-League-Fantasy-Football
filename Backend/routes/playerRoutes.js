/* eslint-disable prettier/prettier */
const express = require('express');
const playerController = require('../controllers/playerController');
const authController = require('../controllers/authController');

const router = express.Router();
// router.param('id', playerController.checkId);
router.route('/transfer-player').get(playerController.transferPlayer);
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

router.route('/:id/transfer-player').get(playerController.getPlayer);

module.exports = router;
