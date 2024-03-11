const express = require("express");
const app = express();
const http = require("http");
const cors = require("cors");
const bodyParser = require("body-parser");

const fileUpload = require("express-fileupload");
const multer = require("multer");
const upload = multer();

const path = require("path");
require("dotenv").config();

const PORT = process.env.PORT || 5005;

const item = require("./routes/item");
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


app.use("/api/item", item);
const httpServer = http.createServer(app);
httpServer.listen(PORT, console.log("Server is running on port ", PORT));