const { query } = require("./models/mysqlConnect");
const cron = require('node-cron');
// db connection check
exports.dbCouponValidityDateUpdate = () => {
  let sql = 'UPDATE tbl_coupon SET active = IF(validity_date < NOW(), 1, active);';
  sql += "UPDATE tbl_coupon SET active = IF(validity_date > NOW(), 0, active);"; 
  cron.schedule('* * * * * *', () => {
    query(sql)
      .then((result) => {
        // console.log("Db connection successful");
      })
      .catch((err) => {
        console.log("Db connection failed", err);
        throw err;
        return;
      });
  });
}

