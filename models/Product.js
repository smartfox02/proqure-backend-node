const mysql = require('./mysqlConnect');

exports.userList = () => {
  return new Promise((resolve, inject) => {
    let sql = `SELECT * FROM tbl_users as u WHERE u.deleted_at IS NULL AND u.role='4' AND u.status='2';`;
    mysql.query(sql)
      .then((result) => {
        resolve(result);
      })
      .catch((err) => {
        inject(err);
      });
  });
};

exports.findByEmail = (email) => {
    return new Promise((resolve, inject) => {
        mysql.query(`select * from tbl_products where email = '${email}'`).then(([user]) => {
            resolve(user);
        }).catch(err => {
            inject(err);
        })
    })
}

exports.findById = (id) => {
    return new Promise((resolve, inject) => {
        mysql.query(`select * from tbl_products where id = '${id}'`).then(([user]) => {
            resolve(user);
        }).catch(err => {
            inject(err);
        })
    })
}

exports.register = (newProduct) => {
    return new Promise((resolve, reject) => {
        mysql.insertOne('tbl_products', newProduct).then(product => {
            resolve(product)
        }).catch(err => {
            reject(err);
        });
    });
}