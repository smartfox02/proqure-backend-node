const express = require('express');
const router = express.Router();

const userController = require('../controllers/itemController');

router.post('/get-store', userController.getStore);
module.exports = router;