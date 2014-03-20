// include

var express = require('express');
var http = require('http');

var configuration = {
    'port': 8000
};

// initialize

var application = module.exports = express();
var httpServer = http.createServer(application);

// execute

application.use(express.static(__dirname));

httpServer.listen(configuration.port, function () {
    console.log('Client listening on port ' + configuration.port + '.');
});