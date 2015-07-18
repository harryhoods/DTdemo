exports.save = function(req, res){
  var MongoClient = require('mongodb').MongoClient;
  var data = {};
  MongoClient.connect("mongodb://localhost:27017/wherezDb", function(err, db) {
    if(err) { return console.dir(err); }
    var data = {} ;
    for(obj in req.query) {
      data[obj] = req.query[obj];
    }
    for(obj in req.body) {
      data[obj] = req.body[obj];
    }
    for(obj in req.params) {
      data[obj] = req.params[obj];
    }
    collection.insert(data);
  });
  res.json(data);
};