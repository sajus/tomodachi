var express   = require('express')
  , http      = require('http')
  , app       = express()
  , http      = require('http')
  , path      = require('path');

app.configure(function() {
    app.set('port', '9090');
    app.use(express.static(__dirname + ''));
});

http.createServer(app).listen(app.get('port'), function(){
    console.log("\n\n\tNode (Express) server listening on port " + app.get('port'))
});

var express = require('express');
var app     = express();

app.use(express.compress());
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.static(__dirname));

app.get('/*', function(req,res) {
    res.sendfile(__dirname + '/index.html');
});

app.listen(9000);

console.log('Listening on port 9000');