const passport = require('passport');
const express = require('express');
const { escapeHTMLMiddleware } = require('../utils');
const router = express.Router();
const reviewsController = require('../controllers/reviewsController');

router.post('/itemlist', reviewsController.itemlist);
router.post('/item', reviewsController.item);
router.post('/related', reviewsController.related);

router.post('/register', passport.authenticate('jwt', { session: false }), reviewsController.register);
router.post('/edit', passport.authenticate('jwt', { session: false }), reviewsController.edit);
router.post('/delete', passport.authenticate('jwt', { session: false }), reviewsController.delete);
module.exports = router;