
const validator = require('validator');
const bcrypt = require('bcrypt');
const path = require('path');
const jwt = require('jsonwebtoken');
const fs = require('fs');

let response = {
    "storename": "Pet Paradise",
    "description": "We provide the best care for your pets while you're away. Our team is dedicated to ensuring your pets are happy and healthy.",
    "products": [
        {
            "name": "Dog Food",
            "price": 15
        },
        {
            "name": "Cat Food",
            "price": 10
        }
    ],
    "Reviews": [
        {
            "id": 1,
            "username": "petlover123",
            "comment": "Great service! My dog loves it here.",
            "rating": 5
        },
        {
            "id": 2,
            "username": "catlover456",
            "comment": "My cat is always happy after visiting Pet Paradise.",
            "rating": 4
        }
    ],
    "images": [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
    ],
    "profile": {
        "profile_image": "https://example.com/profile.jpg",
        "profile_slug": "petparadise",

    },
    "social_media": {
        "facebook": "https://www.facebook.com/petparadise",
        "instagram": "https://www.instagram.com/petparadise"
    }
}
exports.getStore = (req, res) => {
    console.log("getStore:", req.body);
    return res.json({
        status: 0,
        response
    })

}
