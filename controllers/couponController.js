const validator = require("validator");
const bcrypt = require("bcrypt");
const path = require("path");
const jwt = require("jsonwebtoken");
const mysql = require("../models/mysqlConnect");
const fs = require("fs");
const Coupon = require("../models/Coupon");
const {
  isEmpty,
  getCurrentFormatedDate,
  getFormatedDate,
} = require("../utils");
const Sent = require("../models/Sent");
const Socket = require("../utils/socket");

const validatePhoneNumber = (phoneNumber) => {
  const regex = /^\d{11,}$/; // Matches 11 or more digits
  return regex.test(phoneNumber);
};

exports.register = (req, res) => {
  console.log("couponregister", req.body);

  let { code, type, value, count, validity_date, applied_id, applied_name, title, content } = req.body;
  title = title.replace(`'`, `\\'`);
  content = content.replace(`'`, `\\'`);
  validity_date = getFormatedDate(validity_date);
  console.log("validity_date", validity_date);
  Coupon.findByCoupon(code)
    .then((fresult) => {
      if (fresult) {
        return res.json({
          status: 1,
          message: "Code already exists",
        });
      }
      const newCoupon = { code, type, value, count, applied_id, applied_name, validity_date };

      newCoupon.created_at = getCurrentFormatedDate();
      let insertQuery = mysql.getInsertQuery("tbl_coupon", newCoupon);
      let selectQuery = mysql.selectQuery("tbl_coupon", { deleted_at: null });
      let mInsertQuery = "";
      Sent.userList("all")
        .then((userList) => {
          for (let i = 0; i < userList.length; i++) {
            mInsertQuery += mysql.getInsertQuery("tbl_message", {
              user_id: userList[i].id,
              user_email: userList[i].email,
              segment_id: null,
              title: title,
              content: content,
              created_at: getCurrentFormatedDate(),
            });
          }

          mysql.query(`${insertQuery}${selectQuery}${mInsertQuery}`)
            .then((result) => {
              Socket.newMessage();
              return res.json({
                status: 0,
                result,
                message: "Successfully registered",
              });
            })
            .catch((err) => {
              console.log(err);
              return res.json({
                status: 1,
                message: "Please try again later",
              });
            });
        })
        .catch((err) => {
          return res.json({
            status: 0,
            message: "Successfully registered",
          });
        });
    })
    .catch((err) => {
      console.log(err);
      return res.json({
        status: 1,
        message: "Please try again later",
      });
    });
};

exports.edit = (req, res) => {
  console.log("editreqbody", req.body);
  let fileName = null;
  let uploadPath = null;
  let { id, type, value, count, validity_date } = req.body;
  validity_date = getFormatedDate(validity_date);

  let updateQuery = mysql.updateQuery(
    "tbl_coupon",
    { id: id },
    { type: type, value: value, count: count, validity_date: validity_date }
  );
  let selectQuery = mysql.selectQuery("tbl_coupon", { deleted_at: null });

  mysql
    .query(`${updateQuery}${selectQuery}`)
    .then((result) => {
      return res.json({
        status: 0,
        message: "Successfully updated",
        result,
      });
    })
    .catch((err) => {
      console.log(err);
      return res.json({
        status: 1,
        message: "Please try again later",
      });
    });
};

exports.item = (req, res) => {
  console.log("couponcodebody", req.body);
  let { couponValue, user_id } = req.body;
  Coupon.findByCouponHistory(couponValue, user_id)
    .then((fresult) => {
      console.log("fresult:", fresult);
      if (!isEmpty(fresult)) {
        return res.json({
          status: 1,
          message: "Coupon code is already used",
        });
      }
      Coupon.findByCoupon(couponValue)
        .then((result) => {
          if (isEmpty(result)) {
            return res.json({
              status: 1,
              message: "Coupon code is incorrect",
            });
          }
          if(result.active == 1){
            return res.json({
                status: 1,
                message: "The period has expired"
            })
          }
          return res.json({
            status: 0,
            message: "Code already exists",
            result,
          });
        })
        .catch((err) => {
          console.log(err);
          return res.json({
            status: 1,
            message: "Please try again later",
          });
        });
    })
    .catch((err) => {
      return res.json({
        status: 1,
        message: "Please try again later",
      });
    });
};

exports.useditem = (req, res) => {
  let { user_id, couponValue, count } = req.body;
  console.log("req.body: " + JSON.stringify(req.body))
  let newHistory = { user_id: user_id, coupon_code: couponValue};
  newHistory.created_at = getCurrentFormatedDate();
  let insertQuery = mysql.getInsertQuery("tbl_coupon_history", newHistory);
  let updatedQuery = mysql.updateQuery("tbl_coupon", {code: couponValue}, {count: count});
  console.log("updatedQuery:", updatedQuery);
  mysql.query(`${insertQuery}${updatedQuery}`).then((result) => {
      return res.json({
        status: 0,
        message: "Successfully inserted coupon",
        result,
      });
    })
    .catch((err) => {
      console.log(err);
      return res.json({
        status: 1,
        message: "Please try again later",
      });
    });
};

exports.delete = (req, res) => {
  console.log("deletebody", req.body);
  let { id, company, firstname, lastname, phone, email } = req.body;
  let delete_at = getCurrentFormatedDate();
  let updateQuery = mysql.updateQuery(
    "tbl_coupon",
    { id: id },
    { deleted_at: delete_at }
  );
  let selectQuery = mysql.selectQuery("tbl_coupon", { deleted_at: null });
  console.log(updateQuery);
  mysql
    .query(`${updateQuery}${selectQuery}`)
    .then((result) => {
      return res.json({
        status: 0,
        message: "Succefully removed",
        result,
      });
    })
    .catch((err) => {
      return res.json({
        status: 1,
        message: "Please try again later",
      });
    });
};

exports.list = (req, res) => {
  // let selectQuery = mysql.selectQuery("tbl_coupon", { deleted_at: null });
  let updateQuery = 'UPDATE tbl_coupon SET active = IF(validity_date < NOW(), 1, active);';
  updateQuery += "UPDATE tbl_coupon SET active = IF(validity_date > NOW(), 0, active);"; 
  let selectQuery = `SELECT * from tbl_coupon WHERE deleted_at IS NULL;`;
  mysql.query(`${updateQuery}${selectQuery}`)
    .then((coupons) => {
      res.json({
        status: 0,
        list: coupons[2],
      });
    })
    .catch((error) => {
      res.json({
        status: 1,
        error,
      });
    });
};
