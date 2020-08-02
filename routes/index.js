const express = require('express')
const actions = require('../methods/actions')
const router = express.Router()

router.get('/',(req,res) => {
    res.send('Hello')
})

router.get('/dashboard',(req,res) => {
    res.send('Dashboard')
})

//adding user
//@route POST/adduser

router.post('/adduser',actions.addNew)

//authenticate user
//@route POST/authenticate
router.post('/authenticate',actions.authenticate)


module.exports = router