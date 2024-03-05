
const validator = require('validator');
const bcrypt = require('bcrypt');
const path = require('path');
const jwt = require('jsonwebtoken');
const mysql = require('../models/mysqlConnect');
const User = require('../models/User');
const fs = require('fs')
const Review = require('../models/Review');
const { isEmpty, getCurrentFormatedDate } = require('../utils');
const { uploadUrl } = require('../config');

exports.reviewlist = (req, res) => {
    console.log('reviewlist');
    mysql.query('SELECT * FROM `tbl_categories`;').then(list => {
        return res.json({
            status: 0,
            list,
        })
    }).catch(err => {
        console.log(err);
        res.json({
            status: 1,
            message: 'Please try again later'
        })
    })
}

exports.item = (req, res) => {
    let select_query = `SELECT p.*, c.name as cat_name, c.id as cat_id, count(r.id) as reviews_count from tbl_products as p INNER JOIN tbl_categories as c ON p.cat_id=c.id LEFT JOIN tbl_reviews as r ON p.id = r.product_id  WHERE p.id=${req.body.id};`;
    mysql.query(select_query).then(result => {
        let related_query = `SELECT p.*, c.name as cat_name, c.id as cat_id from tbl_products as p INNER JOIN tbl_categories as c ON p.cat_id=c.id WHERE p.cat_id=${result[0].cat_id};`; 
        let review_query = `select r.*, p.name as product_name , u.lastname, u.firstname, u.avatar from tbl_reviews as r INNER JOIN tbl_products as p ON r.product_id=p.id INNER JOIN tbl_users as u ON r.user_id=u.id WHERE r.deleted_at is NULL and p.id='${req.body.id}';`
        mysql.query(related_query).then(rresult => {
            mysql.query(review_query).then(review_result => {
                return res.json({
                    status: 0,
                    result,
                    rresult,
                    review_result,
                })
            }).catch(err => {
                res.json({
                    status: 1,
                    message: 'Please try again later'
                })
            })
        }).catch(err => {
            res.json({
                status: 1,
                message: 'Please try again later'
            })
        })
    }).catch(err => {
        res.json({
            status: 1,
            message: 'Please try again later'
        })
    })
}

exports.related = (req, res) => {
    mysql
      .query(
        `SELECT p.*, c.name as cat_name, c.id as cat_id from tbl_products as p INNER JOIN tbl_categories as c ON p.cat_id=c.id WHERE p.cat_id=${req.body.cat_id};`
      )
      .then((list) => {
        return res.json({
          status: 0,
          list,
        });
      })
      .catch((err) => {
        res.json({
          status: 1,
          message: "Please try again later",
        });
      });
}

exports.itemlist = (req, res) => {
    let data = req.data;
    let { user_id, user_email } = req.body;
    let sql = `SELECT p.*, count(r.id) as reviews_count, c.name as cat_name, c.id as cat_id from tbl_categories as c JOIN  tbl_products as p ON c.id = p.cat_id left join tbl_reviews as r on p.id=r.product_id group by p.id ORDER BY p.id;`;
    sql += `SELECT p.*, count(r.id) as reviews_count, c.name as cat_name, c.id as cat_id from tbl_categories as c JOIN  tbl_products as p ON c.id = p.cat_id left join tbl_reviews as r on p.id=r.product_id group by p.id ORDER BY ratings DESC;`;
    sql += `SELECT * from tbl_categories ORDER BY id ASC;`;
    sql += `SELECT w.id, w.user_id, w.product_id,c.name as cat_name, c.id as cat_id, p.name, p.price, p.image, p.description, p.details, p.vendor_id,p.created_at FROM tbl_wish as w INNER JOIN tbl_products as p ON w.product_id = p.id INNER JOIN tbl_categories as c ON c.id=p.cat_id WHERE w.user_id='${user_id}';`;
    sql += `SELECT ct.id, ct.user_id, ct.product_id, ct.size, c.name as cat_name, c.id as cat_id, p.name, p.price, p.image, p.description, p.details, p.vendor_id, ct.quantity, p.created_at FROM tbl_cart as ct INNER JOIN tbl_products as p ON ct.product_id = p.id INNER JOIN tbl_categories as c ON c.id=p.cat_id WHERE ct.user_id='${user_id}';`;
    sql += `SELECT * from tbl_message WHERE is_read='0' AND user_id='${user_id}';`;
    console.log("=======sql", sql);

    mysql.query(sql).then(([list,toplist, clist, wishlist, cartlist, messagelist]) => {
        const sortedArray = list.reduce((acc, curr) => {
            const foundIndex = acc.findIndex(item => item.cat_id === curr.cat_id);
            if (foundIndex !== -1) {
                acc[foundIndex].items.push(curr);
            } else {
                acc.push({ cat_id: curr.cat_id, cat_name: curr.cat_name, items: [curr] });
            }
            return acc;
        }, []);
        return res.json({
            status: 0,
            list,
            toplist,
            clist,
            wishlist,
            cartlist,
            messagelist,
            sortedArray,
        })
    }).catch(err => {
        res.json({
            status: 1,
            message: 'Please try again later'
        })
    });
}

exports.register = (req, res) => {
    console.log("reviewregister", req.body);
    let { user_id, product_id, ratings, description, user_name, user_email, totalRatings } = req.body;
    let fileName = null;
    let uploadPath = null;
    const newReview = {
        user_id: user_id, product_id: product_id,user_name: user_name, user_email: user_email, ratings: ratings, description: description,
    };

    newReview.created_at = getCurrentFormatedDate();
    newReview.updated_at = newReview.created_at;
    let insertQuery = mysql.getInsertQuery('tbl_reviews', newReview);
    let review_query = `select r.*, p.name as product_name , u.lastname, u.firstname, u.avatar from tbl_reviews as r INNER JOIN tbl_products as p ON r.product_id=p.id INNER JOIN tbl_users as u ON r.user_id=u.id WHERE r.deleted_at is NULL and p.id='${product_id}';`;
    let  updateQuery = mysql.updateQuery('tbl_products', {id: product_id}, {ratings: totalRatings });
    console.log("updatequery", updateQuery);
    mysql.query(`${insertQuery}${review_query}${updateQuery}`).then(result => {
        // ioHandler.sendnewReviewEvent(review);
        return res.json({
            status: 0,
            result,
            message:"Successfully added"
        })
    }).catch(err => {
        console.log(err);
        return res.json({
            status: 1,
            message: "Please try again later"
        })
    });
}

exports.edit = (req, res) => {
    console.log("editreqbody", req.body);
    let fileName = null;
    let uploadPath = null;
    const editReview = () => {
        let { id, name, description } = req.body;
        let selectQuery;
        selectQuery = mysql.selectQuery('tbl_categories', {deleted_at: null});
        
        let  updateQuery = mysql.updateQuery('tbl_categories', {id: id}, {name: name, description: description.replace(`'`, `\\'`) });
        if(uploadPath) {
            updateQuery = mysql.updateQuery('tbl_categories', {id: id}, {name: name, description: description.replace(`'`, `\\'`), image: filePath });
        }

        mysql.query(`${updateQuery}${selectQuery}`)
            .then(result => {
                return res.json({
                    status: 0,
                    message: 'Successfully updated',
                    result
                })
            })
            .catch((err) => {
                console.log(err)
                return res.json({
                    status: 1,
                    message: "Please try again later"
                })
            })
    }
    console.log("editfiles:", req.files);
    if (req.files && Object.keys(req.files).length) {
        const file = req.files.image;
        
        let timestamp = new Date().getTime();
        fileName = file.name;
        uploadPath = path.join(uploadUrl, `/review/${timestamp}`);
        if (!fs.existsSync(uploadPath)) {
            fs.mkdirSync(uploadPath);
        }
        uploadPath = path.join(uploadUrl, `/review/${timestamp}/${file.name}`);
        filePath = `\\\\upload\\\\review\\\\${timestamp}\\\\${file.name}`;
        console.log("uploadPath", filePath)
        file.mv(uploadPath, function (err) {
            if (err) {
                return res.json({
                    status: 1,
                    message: 'Please try again later'
                })
            }
            editReview();
        })
    } else {
        editReview();
    }
}
exports.delete = (req, res) => {
    console.log("deletebody", req.body);
    let {id, company, firstname, lastname, phone, email } = req.body;
    let delete_at = getCurrentFormatedDate();
    let updateQuery = mysql.updateQuery('tbl_categories', {id: id}, {deleted_at: delete_at});
    let selectQuery = mysql.selectQuery('tbl_categories', {deleted_at: null});
    console.log(updateQuery)
    mysql.query(`${updateQuery}${selectQuery}`)
        .then(result => {
            console.log(result)
            return res.json({
                status: 0,
                message: 'Successfully updated',
                result
            })
        })
        .catch((err) => {
            return res.json({
                status: 1,
                message: "Please try again later"
            })
        })
}
