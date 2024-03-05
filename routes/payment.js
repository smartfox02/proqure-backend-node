const express = require("express")
const passport = require("passport")
const router = express.Router()
const cors = require("cors")
const paymentController = require("../controllers/paymentController")
router.post('/order', passport.authenticate('jwt', {session: false}), paymentController.order)
module.exports = router