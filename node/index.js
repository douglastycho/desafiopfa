const express = require('express')
const app = express()
const port = 3000
const config = {
    host: 'mysql-pfa',
    port: '3306',
    user: 'root',
    password: 'root',
    database: 'nodedb'
};
const mysql = require('mysql')
const connection = mysql.createConnection(config)

app.get('/', (req, res) => {

    connection.query("SELECT * FROM Courses", function (err, result, fields) {
        if (err) throw err;

        res.send(result);
    });

})

app.listen(3000, () => {
    console.log("Running on port 3000")
})