exports.wherez = function(req, res){
  res.send('{"id": "'+ req.param('id') +'", "msg": "I am at Hawaii!!!"}');
};