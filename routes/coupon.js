const passport = require('passport');
const express = require('express');
const router = express.Router();

const { escapeHTMLMiddleware } = require('../utils');
const couponController = require('../controllers/couponController');

router.post('/couponlist', passport.authenticate('jwt', { session: false }), couponController.list);
router.post('/register', passport.authenticate('jwt', { session: false }), couponController.register);
router.post('/edit', passport.authenticate('jwt', { session: false }), couponController.edit);
router.post('/delete', passport.authenticate('jwt', { session: false }), couponController.delete);
router.post('/item', passport.authenticate('jwt', { session: false }), couponController.item);
router.post('/useditem', passport.authenticate('jwt', { session: false }), couponController.useditem);

module.exports = router;