/* eslint-disable prettier/prettier */
const express = require('express');
const clubController = require('../controllers/clubController');
// const authController = require('../controllers/authController');

const router = express.Router();

//only logged in users can access the following routes
// router.use(authController.protect);

router
  .route('/')
  .get(clubController.getAllClubs)
  .post(
    clubController.uploadJersey,
    clubController.uploadLogo,
    clubController.addNewClub
  );
router
  .route('/:id')
  .get(clubController.getClub)
  .patch(
    clubController.uploadJersey,
    clubController.uploadLogo,
    clubController.updateClub
  )
  .delete(clubController.deleteClub);

module.exports = router;
