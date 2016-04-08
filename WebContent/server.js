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