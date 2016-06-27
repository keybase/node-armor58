enc = require './encoding'
http = require('http');
b64 = enc.b64.encoding

stream_data = (src, dst) ->
	src.on 'data', (chunk) ->
		dst.write(b64.decode(new Buffer chunk, 'utf-8'));

server = http.createServer (req, res) ->
	stream_data(req, res);
	req.on 'end', ->
		res.end();

server.listen(39393);
