let db = require("../moduleSQL");

let express = require("express");
const { Db } = require("mongodb");
let router = express.Router();

router.get("/", (req, res) => {
  db.query("select* from hotel", (err, result, fields) => {
    res.json(result);
  });
});
router.get("/special", (req, res) => {
  db.query(
    "select r.hotel_no, sum(r.price) from room r left join booking b on r.hotel_no=b.hotel_no and r.room_no=b.room_no where b.room_no is null group by r.hotel_no",
    (err, result, fields) => {
      res.json(result);
    }
  );
});

router.get("/:id", (req, res) => {
  console.log(req.params.id);
  db.query(
    `select* from hotel where hotel_no =?`,
    [req.params.id],
    (err, result, fields) => {
      res.json(result);
    }
  );
});

router.post("/", (req, res) => {
  db.query(
    `insert into hotel (hotel_no, hotel_name, city) values (default,?, ?)`,
    ["comfort inn", "Seatle"],
    (err, result, fields) => {
      res.json(result);
    }
  );
});
router.put("/:id", (req, res) => {
  db.query(
    "update hotel set hotel_name=? , city =? where hotel_no =?",
    ["Marriot", "DC", req.params.id],
    (err, result, fields) => {
      res.json(result);
    }
  );
});

module.exports = router;
