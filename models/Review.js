const mysql = require('./mysqlConnect');

exports.findByEmail = (email) => {
    return new Promise((resolve, inject) => {
        mysql.query(`select * from tbl_categories where email = '${email}'`).then(([user]) => {
            resolve(user);
        }).catch(err => {
            inject(err);
        })
    })
}

exports.findById = (id) => {
    return new Promise((resolve, inject) => {
        mysql.query(`select * from tbl_categories where id = '${id}'`).then(([user]) => {
            resolve(user);
        }).catch(err => {
            inject(err);
        })
    })
}

exports.register = (newReview) => {
    return new Promise((resolve, reject) => {
        mysql.insertOne('tbl_reviews', newReview).then(review => {
            resolve(review)
        }).catch(err => {
            reject(err);
        });
    });
}