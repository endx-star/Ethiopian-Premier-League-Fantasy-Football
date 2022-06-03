/* eslint-disable prettier/prettier */
const express = require('express');

const highlightController = require('../controllers/highlightController');
// const authController = require('../controllers/authController');

const router = express.Router();

router
  .route('/')
  .post(highlightController.addNewHighlight)
  .get(highlightController.getAllHighlights);

router
  .route('/:id')
  .get(highlightController.getHighlight)
  .patch(highlightController.updateHighlight)
  .delete(highlightController.deleteHighlight);

module.exports = router;
