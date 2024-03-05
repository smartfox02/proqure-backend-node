const passport = require('passport');
const express = require('express');
const { escapeHTMLMiddleware } = require('../utils');
const router = express.Router();
const orderController = require('../controllers/orderController');

// admi role
router.post('/orderlist', passport.authenticate('jwt', {session: false}), orderController.orderlist);
router.post('/changestatus', passport.authenticate('jwt', { session: false }), orderController.changestatus)
router.post('/makeread', passport.authenticate('jwt', { session: false }), orderController.makeread);
router.post('/delete', passport.authenticate('jwt', { session: false }), orderController.delete);

// admin detail role
router.post('/orderdetaillist', passport.authenticate('jwt', {session: false}), orderController.orderdetaillist);
router.post('/changestatusdetail', passport.authenticate('jwt', {session: false}), orderController.changestatusdetail)

// vendor role
router.post('/vendororderlist', passport.authenticate('jwt', {session: false}), orderController.vendororderlist)
router.post('/changestatusvendor', passport.authenticate('jwt', {session: false}), orderController.changestatusvendor)

//customer transaction
router.post('/transactionlist', passport.authenticate('jwt', {session: false}), orderController.transactionlist) 
module.exports = router;