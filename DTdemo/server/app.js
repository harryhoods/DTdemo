var express     = require('express')
    ,routes     = require('./routes')
    ,wherez     = require('./routes/wherez') 
    ,save       = require('./routes/save')
    ;

var app        = express();

app.set('port', process.env.PORT || 3001);
app.use(express.favicon());


app.get('/', routes.index);
app.get('/wherez/:id', wherez.wherez);
app.post('/wherez/:id', wherez.wherez);
app.get('/save/:id', save.save);
app.post('/save/:id', save.save);

app.listen(app.get('port'),"0.0.0.0");

console.log('wherez server listening on port %d', app.get('port'));
