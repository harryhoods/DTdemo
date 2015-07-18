var londonResponse="[\
{\"location\": { \"name\" : \"Bexley/Slade-Green PM10:18.4\", \"color\" : \"green\", \"lat\" : 51.46599, \"long\" : 0.18484879 }},\
{\"location\": { \"name\" : \"Barnet/Finchley PM10:19.1\",        \"color\" : \"green\", \"lat\" : 51.59190, \"long\" : -0.20599200 }},\
{\"location\": { \"name\" : \"Hounslow/Hatton-Cross PM10:19.7\",        \"color\" : \"green\", \"lat\" : 51.46340, \"long\" : -0.42752500 }},\
{\"location\": { \"name\" : \"Greenwich/Plumstead-High PM10:20.2\",        \"color\" : \"yellow\", \"lat\" : 51.48696, \"long\" : 0.09511100 }},\
{\"location\": { \"name\" : \"Croydon/Thornton-Heath PM10:20.9\",        \"color\" : \"yellow\", \"lat\" : 51.40401, \"long\" : -0.09881400 }},\
{\"location\": { \"name\" : \"Lambeth/Loughborough PM10:22.2\",        \"color\" : \"yellow\", \"lat\" : 51.46487, \"long\" : -0.09916100 }},\
{\"location\": { \"name\" : \"City_of_London/Sir_John_Cass_School PM10:26.3\",        \"color\" : \"yellow\", \"lat\" : 51.51385, \"long\" : -0.07776568 }},\
{\"location\": { \"name\" : \"Waltham_Forest/Crooked_Billet PM10:29.6\",        \"color\" : \"yellow\", \"lat\" : 51.60172, \"long\" : -0.01649826 }},\
{\"location\": { \"name\" : \"Tower_Hamlets/Blackwall PM10:35.5\",        \"color\" : \"orange\", \"lat\" : 51.51508, \"long\" : -0.00838700 }},\
{\"location\": { \"name\" : \"Westminster/Marylebone PM10:39.5\",        \"color\" : \"orange\", \"lat\" : 51.52254, \"long\" : 0.15459000 }},\
{\"location\": { \"name\" : \"Brent/Neasden PM10:40.9\",        \"color\" : \"red\", \"lat\" : 51.55266, \"long\" : -0.24877400 }},\
{\"location\": { \"name\" : \"Ealing/Horn PM10:41.3\",        \"color\" : \"red\", \"lat\" : 51.51895, \"long\" : -0.26561700 }}\
]";

var sfResponse="[\
{\"location\": { \"name\" : \"San Fransisco PM10:33.4\", \"color\" : \"orange\", \"lat\" : 37.7833, \"long\" : -122.4167 }},\
{\"location\": { \"name\" : \"Berkeley PM10:22.1\",        \"color\" : \"yellow\", \"lat\" : 37.8717, \"long\" : -122.2728 }}\
]";

var newyorkResponse="[\
{\"location\": { \"name\" : \"Newark PM10:38.4\", \"color\" : \"red\", \"lat\" : 40.7242, \"long\" : -74.1726 }},\
{\"location\": { \"name\" : \"Manhattan PM10:16.3\",\"color\" : \"green\", \"lat\" : 40.7903, \"long\" : -73.9597 }}\
]";

var tokyoResponse="[\
{\"location\": { \"name\" : \"Adachi PM10:18.4\", \"color\" : \"green\", \"lat\" : 35.7833, \"long\" : 139.8 }},\
{\"location\": { \"name\" : \"Kawasaki PM10:33.3\",\"color\" : \"orange\", \"lat\" : 35.5167, \"long\" : 139.7 }}\
]";

exports.index = function(req, res){

  if(req.param('id').indexOf("San") > -1){
    res.send(sfResponse);
}
  else if(req.param('id').indexOf("New") > -1){
    res.send(newyorkResponse);
}
  else if(req.param('id').indexOf("Tokyo") > -1){
    res.send(tokyoResponse);
}
  else if(req.param('id').indexOf("London") > -1){
    res.send(londonResponse);
  }
  else{
    res.send(londonResponse);
}
};
