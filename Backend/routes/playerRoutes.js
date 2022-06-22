/* eslint-disable prettier/prettier */
const express = require('express');
const playerController = require('../controllers/playerController');
// const authController = require('../controllers/authController');

const router = express.Router();

//only logged in users can access the following routes
// router.use(authController.protect);

router.route('/goalkeepers').get(playerController.getGoalkeepers);
router.route('/defenders').get(playerController.getDefenders);
router.route('/midfielders').get(playerController.getMidfielders);
router.route('/forwards').get(playerController.getForwards);

router
  .route('/top-5-players')
  .get(playerController.aliasTopPlayers, playerController.getAllPlayers);
router.route('/get-players-status').get(playerController.getPlayerStatus);

//restrict the route only to the admin
// router.use(authController.restrictTo('admin'));
router
  .route('/')
  .get(playerController.getAllPlayers)
  .post(playerController.uploadPlayerPhoto, playerController.addNewPlayer);
router
  .route('/:id')
  .get(playerController.getPlayer)
  .patch(playerController.uploadPlayerPhoto, playerController.updatePlayer)
  .delete(playerController.deletePlayer);

module.exports = router;
