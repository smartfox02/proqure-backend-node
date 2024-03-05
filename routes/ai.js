const express = require('express');
const router = express.Router();
const passport = require('passport');


const aiController = require('../controllers/aiController');

router.post('/upload',aiController.upload);
router.post('/categorylist', aiController.categorylist)
router.post('/productlist', aiController.productlist)

module.exports = router;