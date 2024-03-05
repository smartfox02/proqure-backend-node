const fs = require("fs");
const path = require("path");
const { Configuration, OpenAIApi } = require("openai");
const { isEmpty, getCurrentFormatedDate } = require("../utils");
const { API_KEY } = require("../config");
const mysql  = require("../models/mysqlConnect")
const configuration = new Configuration({
    apiKey: API_KEY,
});

exports.upload = (req, res) => {
  console.log("upload_chatbot:", req.body);
  // return
  if (req.files && Object.keys(req.files).length) {
    audio_file = req.files[0];
    buffer = audio_file.buffer;
    buffer.name = audio_file.originalname;
    const response = transcribe(buffer);
    response.then((data) => {
        console.log("translatedata", data.data.text)
        return res.json({
            status: 0,
            message:data.data.text
        })
    }).catch((err) => {
        return res.json({
            status: 1,
            message: "Please try again later"
        })
    });
  }
};

async function transcribe(buffer) {
    const openai = new OpenAIApi(configuration);
    const response = await openai.createTranscription(
        buffer, // The audio file to transcribe.
        "whisper-1", // The model to use for transcription.
        undefined, // The prompt to use for transcription.
        'json', // The format of the transcription.
        1, // Temperature
        'en' // Language
    )
    return response;
}

exports.categorylist = (req, res) => {
    console.log('categorylist');
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

exports.productlist = (req, res) => {
    mysql.query(`SELECT * from tbl_products WHERE cat_id='${req.body.cat_id}'`).then(list => {
        return res.json({
            status: 0,
            list,
        })
    }).catch(err => {
        res.json({
            status: 1,
            message: 'Please try again later'
        })
    })
}
