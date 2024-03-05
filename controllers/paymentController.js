const axios = require("axios");
const mysql = require("../models/mysqlConnect");
const { isEmpty } = require("../utils");
const CHAPA_URL = process.env.CHAPA_URL || "https://api.chapa.co/v1/transaction/initialize";
const CHAPA_AUTH = process.env.CHAPA_AUTH; // || register to chapa and get the key
const request = require("request");
var sha512 = require("js-sha512");
const { getCurrentFormatedDate } = require("../utils");
const { MerchantId, privateKey, publickey } = require("../config");

exports.expressCheckout = async (total, params) => {
  return new Promise((resolve, reject) => {
    console.log("checkout_params:", params)
    let { userId, userName, userEmail, userMobile, orderName, orderDescription } = params;
    const formData = {
      "amount": {
          "currency": "NGN",
          "total": total
      },
      "callbackUrl": "https://your-call-back-url",
      "cancelUrl": "https://your-cacel-url",
      "country": "NG",
      "expireAt":300,
      "sn":"PE462xxxxxxxx",
      "payMethod":"",
      "product":{
          "description": orderDescription,
          "name": orderName,
      },
      "reference": "983541354914",
      "returnUrl": "https://your-return-url",
      "userInfo":{
              "userEmail": userEmail,
              "userId": userId,
              "userMobile": userMobile,
              "userName": userName
      }
    };
    
    request({
        url: 'https://testapi.opaycheckout.com/api/v1/international/cashier/create',
        method: 'POST',
    
        headers: {
          'Authorization': 'Bearer '+ publickey,
          'MerchantId': MerchantId
        },
        json: true,
        body: formData
      }, function (error, response, body) {
        console.log("express_checkout_error:", error)
        console.log('express_checkout_body: ', body)
        resolve(body);
      }
    )
  })
}
exports.order = async (req, res) => {
  try{
    console.log("orderbody:", req.body)
    let { items, totalAmount, shipping, schedule_date, user_id, opayInfo, option } = req.body;
    console.log("items: ", totalAmount, shipping, schedule_date, user_id, option);
  
    let newOrder = { user_id, shipping, totalAmount, option };
    if (!isEmpty(schedule_date)) newOrder.schedule_date = schedule_date;
    newOrder.created_at = getCurrentFormatedDate();
  
    if (!isEmpty(opayInfo)) {
      console.log("opayInfo:", opayInfo);
        orderResult = await this.expressCheckout(totalAmount, opayInfo);
        console.log("orderCardCheckoutResult: ", orderResult);
      if(orderResult.code !== "00000"){
        return res.json({
          status: 0,
          message:"Please try again later"
        })
      }
    }
    mysql.insertOne('tbl_orders', newOrder).then(oresult => {
      console.log("oresult", oresult);
      let insertQuery = '';
      let deleteQuery = '';
      items && items.forEach(item => {
        insertQuery += mysql.getInsertQuery('tbl_orderdetails', {order_id: oresult.id, user_id: user_id, product_id: item.product_id, cat_id: item.cat_id,size: item.size, quantity: item.quantity, vendor_id: item.vendor_id, status: 0 });
        deleteQuery += mysql.deleteManyQuery("tbl_cart", {user_id: user_id, product_id: item.product_id});
      })
      let pendingSql = `SELECT * FROM tbl_orders WHERE user_id = '${user_id}' and status != 4 and deleted_at is NULL`;
      console.log("pending_sql", pendingSql);
      console.log("===sql:", insertQuery, deleteQuery, pendingSql);
      mysql.query(`${insertQuery}${deleteQuery}${pendingSql}`).then(result => {
        console.log("result:", result[2]);
        let list = result[2];
        return res.json({
          status: 0,
          message: "Successfully ordered",
          list
        })
      }).catch(err => {
        console.log("ordered", err);
        return res.json({
          status: 1,
          message: "Please try again later"
        })
      })
    })
  }
  catch(err){
    console.log("payment error:", err);
    return res.json({
      status: 1,
      message: "Please try again later"
    })
  }
};
