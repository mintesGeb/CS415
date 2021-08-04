let sql = require("mysql");

let connectionInfo = {
  host: "localhost",
  user: "root",
  password: "123456",
  database: "hotel_management_system",
};

let connection = sql.createConnection(connectionInfo);

connection.connect((err) => {
  if (err) throw err;
});

module.exports = connection;
