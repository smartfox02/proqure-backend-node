const passport = require('passport');
const express = require('express');
const { escapeHTMLMiddleware } = require('../utils');
const router = express.Router();
const categoryController = require('../controllers/categoryController');

router.post('/categorylist', categoryController.categorylist);
router.post('/itemlist', categoryController.itemlist);
router.post('/item', categoryController.item);
router.post('/related', categoryController.related);
router.post('/filterlist', categoryController.filterlist);
router.post('/getpendinglist', passport.authenticate('jwt', {session: false}), categoryController.getpendinglist);

router.post('/messagelist', passport.authenticate('jwt', { session: false }), categoryController.messagelist);
router.post('/register', passport.authenticate('jwt', { session: false }), categoryController.register);
router.post('/edit', passport.authenticate('jwt', { session: false }), categoryController.edit);
router.post('/delete', passport.authenticate('jwt', { session: false }), categoryController.delete);
module.exports = router;