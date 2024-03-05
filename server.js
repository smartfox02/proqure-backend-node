const express = require("express");
const app = express();
const http = require("http");
const cors = require("cors");
const { query } = require("./models/mysqlConnect");
const passport = require("./utils/passport");
const bodyParser = require("body-parser");

const fileUpload = require("express-fileupload");
const multer = require("multer");
const upload = multer();

const path = require("path");
require("dotenv").config();

//create socket http server
const socket = require("./utils/socket");

const PORT = process.env.PORT || 5005;

const payment = require("./routes/payment");
const item = require("./routes/item");
const category = require("./routes/category");
const user = require("./routes/user");
const client = require("./routes/client");

//ai chatbot
const ai = require("./routes/ai");
// admin
const product = require("./routes/product");
const coupon = require("./routes/coupon");
const sent = require("./routes/sent");
const inbox = require("./routes/inbox");
const segment = require("./routes/segment");
const order = require("./routes/order");
const reviews = require('./routes/reviews');
// middlewares

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.resolve(__dirname, "public")));

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

// db cron command
// db connection check
query("SELECT * from tbl_users")
  .then((result) => {
    console.log("Db connection successful");
  })
  .catch((err) => {
    console.log("Db connection failed", err);
    throw err;
    return;
  });

app.use("/api/payment", payment);
app.use("/api/user", fileUpload(), user);
app.use("/api/category", fileUpload(), category);
app.use("/api/item", fileUpload(), item);
app.use("/api/segment", fileUpload(), segment);

//ai chatbot
app.use("/api/ai", upload.any("file"), ai);
//admin
app.use("/api/client", fileUpload(), client);
app.use("/api/product", fileUpload(), product);
app.use("/api/coupon", fileUpload(), coupon);
app.use("/api/sent", fileUpload(), sent);
app.use("/api/inbox", fileUpload(), inbox);
app.use("/api/order", fileUpload(), order);
app.use("/api/reviews", fileUpload(), reviews)
// const server = require('http').createServer(app);
const httpServer = http.createServer(app);
const io = require("socket.io")(httpServer);
// init socket connection
io.on("connection", socket.onConnect);

httpServer.listen(PORT, console.log("Server is running on port ", PORT));